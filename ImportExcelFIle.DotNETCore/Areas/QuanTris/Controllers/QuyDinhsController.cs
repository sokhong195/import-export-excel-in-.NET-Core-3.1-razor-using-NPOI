using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.Models;
using ImportExcelFIle.DotNETCore.Utilities;

namespace ImportExcelFIle.DotNETCore.Controllers

{
    [Area("QuanTris")]
    public class QuyDinhsController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public readonly string model = "Quy định";
        public string result = "";
        public bool removeSpecialCharacters= true;
        public string pathView = "CreateOrEdit";
        public QuyDinhsController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }

        // GET: QuyDinhs
        public async Task<IActionResult> Index()
        {
            return View(await _context.QuyDinhs.ToListAsync());
        }


        [HttpGet]
        // GET: QuyDinhs/Edit/5
        public async Task<IActionResult> CreateOrEdit(int id = 0)
        {
            QuyDinh QuyDinh = null;
            try
            {
                if (id == 0)
                {
                    @ViewData["SoDong"] = 0;
                    QuyDinh = new QuyDinh();
                }
                else
                {
                    QuyDinh = await _context.QuyDinhs.
                        Include(n => n.QuyDinhChiTiets)
                        .FirstOrDefaultAsync(n => n.IdQuyDinh == id);
                    @ViewData["SoDong"] = QuyDinh.QuyDinhChiTiets.Count();
                    if (QuyDinh == null)
                    {
                        return NotFound();
                    }
                }
            }
            catch (Exception ex)
            {
                return NotFound(Message.Fail(ex));
            }
            ViewBag.IdLoaiQuyDinh = new   SelectList(_context.LoaiQuyDinhs
                .OrderByDescending(a => a.TenLoaiQuyDinh), "IdLoaiQuyDinh", "TenLoaiQuyDinh");
            return View(pathView, QuyDinh);
        }

        // POST: QuyDinhs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(int id, [Bind("IdQuyDinh","TenQuyDinh", "IdLoaiQuyDinh", "QuyDinhChiTiets")] QuyDinh QuyDinh, int SoDong=0)
        {
            
            @ViewData["SoDong"] = SoDong;
            if (id != QuyDinh.IdQuyDinh)
            {
                return NotFound();
            }
            if (CheckExist.TenQuyDinh(QuyDinh.TenQuyDinh, id))
            {
                ModelState.AddModelError("TenQuyDinh", "Tên quy định đã tồn tại");
            }
            if (ModelState.IsValid)
            {
                try
                {
                    if (QuyDinh.QuyDinhChiTiets.Where(n => n.ThoiGianKetThuc == null).Count() > 1)
                    {
                        removeSpecialCharacters = false;
                        throw new Exception(@"Mỗi quy định chỉ được có 1 giá trị được sử dụng tại thời điểm hiện tại");
                    }
                    if (QuyDinh.IdQuyDinh == 0)
                    {
                        
                       
                            _context.Add(QuyDinh);
                            int idQuyDinh = QuyDinh.IdQuyDinh;
                            foreach (var item in QuyDinh.QuyDinhChiTiets)
                            {
                                item.IdQuyDinh = idQuyDinh;
                                _context.QuyDinhChiTiets.Add(item);
                            }
                            await _context.SaveChangesAsync();
                            result = Message.SuccessCreate(model);
                    }
                    else
                    {
                        //Cap nhat bang chi tiet
                        List<int> listIdQuyDinhChiTiet = QuyDinh.QuyDinhChiTiets.Select(n => n.IdQuyDinhChiTiet).ToList();
                        List<QuyDinhChiTiet> Xoa = _context.QuyDinhChiTiets.Where(n => !listIdQuyDinhChiTiet.Contains(n.IdQuyDinhChiTiet)&& n.IdQuyDinh == QuyDinh.IdQuyDinh).ToList();
                        //Xoa
                        _context.QuyDinhChiTiets.RemoveRange(Xoa);
                         //Sua  +  Them
                        foreach (var item in QuyDinh.QuyDinhChiTiets)
                        {
                            if(item.IdQuyDinhChiTiet == 0)
                            {
                                item.IdQuyDinh = QuyDinh.IdQuyDinh;
                                _context.QuyDinhChiTiets.Add(item);
                            }
                            else
                            {
                                _context.Update(item);
                            }
                        }
                        _context.Update(QuyDinh);
                        result = Message.SuccessEdit(model);
                        await _context.SaveChangesAsync();
                    }
                }
                catch (Exception ex)
                {
                    result = Message.Fail(ex,removeSpecialCharacters);
                }
                return Json(new { isValid = true, href = "QuyDinhsTab", message = result });
            }
            ViewBag.IdLoaiQuyDinh = new SelectList(_context.LoaiQuyDinhs
                .OrderByDescending(a => a.TenLoaiQuyDinh), "IdLoaiQuyDinh", "TenLoaiQuyDinh");
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, pathView, QuyDinh) });
        }

        // POST: QuyDinhs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var QuyDinh = await _context.QuyDinhs
                    .Include(n => n.QuyDinhChiTiets)
                    .FirstOrDefaultAsync(n => n.IdQuyDinh == id);
                if (QuyDinh.QuyDinhChiTiets.Count > 0)
                {
                    result = Utilities.Message.FailDataConstraints("Chi tiết quy định");
                }
                else
                {
                    _context.QuyDinhs.Remove(QuyDinh);
                    await _context.SaveChangesAsync();
                    result = Utilities.Message.SuccessDelete(model);
                }
            }
            catch (Exception ex)
            {
                result = Utilities.Message.Fail(ex, removeSpecialCharacters);
            }
            return Json(new { isValid = true, href = "QuyDinhsTab", message = result });
        }
        [HttpGet]
        public async Task<IActionResult> GetValues(DateTime? date)
        {
            float SoGioLyThuyet1TinChi = GetValue.QuyDinh(VietTat.SoGioLyThuyet1TinChi, date);
            float SoGioHuongDanTuHocCho1TinChi = GetValue.QuyDinh(VietTat.SoGioHuongDanTuHocCho1TinChi, date);
            float SoGioTuHocCho1TinChi = GetValue.QuyDinh(VietTat.SoGioTuHocCho1TinChi, date);
            float SoGioThucHanh1TinChi = GetValue.QuyDinh(VietTat.SoGioThucHanh1TinChi, date);
            float SoGioThucTapDoAnKhoaLuanTotNghiepCho1TinChi = GetValue.QuyDinh(VietTat.SoGioThucTapDoAnKhoaLuanTotNghiepCho1TinChi, date);
            return Json(new { SoGioLyThuyet1TinChi = SoGioLyThuyet1TinChi , SoGioHuongDanTuHocCho1TinChi = SoGioHuongDanTuHocCho1TinChi,
            SoGioTuHocCho1TinChi = SoGioTuHocCho1TinChi,
                SoGioThucHanh1TinChi = SoGioThucHanh1TinChi,
                SoGioThucTapDoAnKhoaLuanTotNghiepCho1TinChi = SoGioThucTapDoAnKhoaLuanTotNghiepCho1TinChi
            });
        }
        [HttpGet]
        public async Task<JsonResult> GetQuyDinhs(int IdLoaiQuyDinh)
        {
            var list = await GetList.QuyDinhValue(null, IdLoaiQuyDinh, null);
            return Json(list);
        }
    }
}
