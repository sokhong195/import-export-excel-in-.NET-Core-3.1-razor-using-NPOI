using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.Models;
using ImportExcelFIle.DotNETCore.Utilities;

namespace ImportExcelFIle.DotNETCore.Areas.QuanTris.Controllers
{
    [Area("QuanTris")]
    public class TrangThaiLamViecsController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public readonly string model = "Trạng thái làm việc";
        public string result = "";
        private bool removeSpecialCharacters = true;
        public string pathView = "CreateOrEdit";
        public TrangThaiLamViecsController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }

       

        [HttpGet]
        // GET: TrangThaiLamViecGiaoViens/Edit/5
        public async Task<IActionResult> CreateOrEdit(int id = 0)
        {
            TrangThaiLamViec TrangThaiLamViecGiaoVien = null;
            if (id == 0)
            {
                @ViewData["SoDong"] = 0;
                TrangThaiLamViecGiaoVien = new TrangThaiLamViec();
                TrangThaiLamViecGiaoVien.IdTrangThaiLamViec = 0;
                TrangThaiLamViecGiaoVien.MienGiamTheoTrangThaiLamViecs = new List<MienGiamTheoTrangThaiLamViec>();
            }
            else
            {
                try
                {
                    TrangThaiLamViecGiaoVien = await _context.TrangThaiLamViecs.
                                       Include(n => n.MienGiamTheoTrangThaiLamViecs)
                                       .FirstOrDefaultAsync(n => n.IdTrangThaiLamViec == id);
                    @ViewData["SoDong"] = TrangThaiLamViecGiaoVien.MienGiamTheoTrangThaiLamViecs.Count();
                }
                catch (Exception ex)
                {

                    throw;
                }

                if (TrangThaiLamViecGiaoVien == null)
                {
                    return NotFound();
                }
            }
            return View(pathView, TrangThaiLamViecGiaoVien);
        }

        // POST: TrangThaiLamViecGiaoViens/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(int id, [Bind("IdTrangThaiLamViec,TenTrangThaiLamViec,MienGiamTheoTrangThaiLamViecs")] TrangThaiLamViec TrangThaiLamViecGiaoVien, int SoDong = 0)
        {
            @ViewData["SoDong"] = SoDong;

            if (id != TrangThaiLamViecGiaoVien.IdTrangThaiLamViec)
            {
                return NotFound();
            }
            if (!string.IsNullOrEmpty(TrangThaiLamViecGiaoVien.TenTrangThaiLamViec) && CheckExist.TenTrangThaiLamViecGiaoVien(TrangThaiLamViecGiaoVien.TenTrangThaiLamViec, id))
            {
                ModelState.AddModelError("", "Tên trạng thái làm việc đã tồn tại");
            }
            if (TrangThaiLamViecGiaoVien.MienGiamTheoTrangThaiLamViecs.Where(n => n.ThoiGianKetThuc == null).Count() > 1)
            {
                ModelState.AddModelError("", @"Mỗi trạng thái chỉ được có 1 giá trị được sử dụng tại thời điểm hiện tại");
            }
            if (ModelState.IsValid)
            {
                try
                {
                    if (TrangThaiLamViecGiaoVien.IdTrangThaiLamViec == 0)
                    {
                        _context.TrangThaiLamViecs.Add(TrangThaiLamViecGiaoVien);
                        foreach (var item in TrangThaiLamViecGiaoVien.MienGiamTheoTrangThaiLamViecs)
                        {
                            _context.MienGiamTheoTrangThaiGiaoViens.Add(item);
                        }
                        _context.Add(TrangThaiLamViecGiaoVien);
                        await _context.SaveChangesAsync();
                        result = Utilities.Message.SuccessCreate(model);
                    }
                    else
                    {
                        //Cap nhat bang chi tiet
                        List<int> listIdHeSoTrangThaiLamViecGiaoVien = TrangThaiLamViecGiaoVien.MienGiamTheoTrangThaiLamViecs.Select(n => n.IdMienGiamTheoTrangThaiLamViec).ToList();
                        List<MienGiamTheoTrangThaiLamViec> Xoa = _context.MienGiamTheoTrangThaiGiaoViens.Where(n => !listIdHeSoTrangThaiLamViecGiaoVien.Contains(n.IdMienGiamTheoTrangThaiLamViec) && n.IdTrangThaiLamViec == TrangThaiLamViecGiaoVien.IdTrangThaiLamViec).ToList();
                        //Xoa
                        _context.MienGiamTheoTrangThaiGiaoViens.RemoveRange(Xoa);
                        //Sua  +  Them
                        foreach (var item in TrangThaiLamViecGiaoVien.MienGiamTheoTrangThaiLamViecs)
                        {
                            if (item.IdMienGiamTheoTrangThaiLamViec == 0)
                            {
                                item.IdTrangThaiLamViec = TrangThaiLamViecGiaoVien.IdTrangThaiLamViec;
                                _context.MienGiamTheoTrangThaiGiaoViens.Add(item);
                            }
                            else
                            {
                                _context.Update(item);
                            }
                        }
                        _context.Update(TrangThaiLamViecGiaoVien);
                        result = Message.SuccessEdit(model);
                        await _context.SaveChangesAsync();
                    }
                    await _context.SaveChangesAsync();
                }
                catch (Exception ex)
                {
                    result = Utilities.Message.Fail(ex, removeSpecialCharacters);
                }
                return Json(new { isValid = true, href = "TrangThaiLamViecsTab", message = result });
            }
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, pathView, TrangThaiLamViecGiaoVien) });
        }

        // POST: TrangThaiLamViecGiaoViens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var TrangThaiLamViecGiaoVien = await _context.TrangThaiLamViecs
                    .Include(n => n.MienGiamTheoTrangThaiLamViecs)
                    .FirstOrDefaultAsync(n => n.IdTrangThaiLamViec == id);
                if (TrangThaiLamViecGiaoVien == null)
                {
                    result = Message.FailNotExist(model);
                }
                else if (TrangThaiLamViecGiaoVien.MienGiamTheoTrangThaiLamViecs.Count > 0)
                {
                    result = Message.FailDataConstraints("Miễn giảm theo trạng thái làm việc");
                }
                else
                {
                    _context.TrangThaiLamViecs.Remove(TrangThaiLamViecGiaoVien);
                    await _context.SaveChangesAsync();
                    result = Message.SuccessDelete(model);
                }
            }
            catch (Exception ex)
            {
                result = Message.Fail(ex);
            }
            return Json(new { isValid = true, href = "TrangThaiLamViecsTab", message = result });
        }
    }
}
