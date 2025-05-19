using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.Models;
using System;
using ImportExcelFIle.DotNETCore.Utilities;
using System.Linq.Dynamic.Core;
using System.Linq;
using Newtonsoft.Json;
using ImportExcelFIle.DotNETCore.Classes;

namespace ImportExcelFIle.DotNETCore.Areas.QuanTris.Controllers
{
    [Area("QuanTris")]
    public class QuyDinhSiSoLopHocPhansController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public readonly string model = "Quy định về sĩ số lớp học phần";
        public string result = "";
        private bool removeSpecialCharacters = true;
        public string pathView = "CreateOrEdit";

        public QuyDinhSiSoLopHocPhansController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> GetData()
        {
            try
            {
                var draw = Request.Form["draw"].FirstOrDefault();
                var start = Request.Form["start"].FirstOrDefault();
                var length = Request.Form["length"].FirstOrDefault();
                var sortColumn = Request.Form["columns[" + Request.Form["order[0][column]"].FirstOrDefault() + "][name]"].FirstOrDefault();
                var sortColumnDirection = Request.Form["order[0][dir]"].FirstOrDefault();
                var searchValue = Request.Form["search[value]"].FirstOrDefault();
                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                int skip = start != null ? Convert.ToInt32(start) : 0;
                int recordsTotal = 0;
                var quyDinhSiSoLopHocPhans = await GetList.QuyDinhSiSoLopHocPhans(null);

                if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDirection)))
                {
                    var colSortName = "ThoiGianKetThuc";
                    switch (sortColumn)
                    {
                       case "Dạng học phần":
                            colSortName = "DangHocPhan";break;
                        case "Thời gian bắt đầu":
                            colSortName = "ThoiGianBatDau"; break;
                        default: colSortName = "ThoiGianKetThuc"; break;
                    }

                        quyDinhSiSoLopHocPhans = quyDinhSiSoLopHocPhans.AsQueryable().OrderBy(colSortName + " " + sortColumnDirection).ToList();
                }
                if (!string.IsNullOrEmpty(searchValue))
                {
                    quyDinhSiSoLopHocPhans = quyDinhSiSoLopHocPhans.Where(m => m.DangHocPhan.Contains(searchValue)).ToList();
                }
                recordsTotal = quyDinhSiSoLopHocPhans.Count();
                var data = quyDinhSiSoLopHocPhans.Skip(skip).Take(pageSize).ToList();
                var jsonData = new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = JsonConvert.SerializeObject(data) };
                return Json(jsonData);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
       

        // GET: QuanTris/QuyDinhSiSoLopHocPhans/Edit/5
        public async Task<IActionResult> CreateOrEdit(int? id=0)
        {
            QuyDinhSiSoLopHocPhan quyDinhSiSoLopHocPhan = null;
            if (id==0)
            {
                quyDinhSiSoLopHocPhan = new QuyDinhSiSoLopHocPhan();
                quyDinhSiSoLopHocPhan.IdQuyDinhSiSoLopHocPhan = 0;
                quyDinhSiSoLopHocPhan.DangHocPhan = DangHocPhanTinhHeSo.HocPhanLyThuyet;
                quyDinhSiSoLopHocPhan.ThoiGianBatDau = DateTime.Now;
            }
            else
            {
                quyDinhSiSoLopHocPhan = await _context.QuyDinhSiSoLopHocPhans.FindAsync(id);
                if (quyDinhSiSoLopHocPhan == null)
                {
                    return NotFound();
                }
            }
            ViewData["DangHocPhanTinhHeSo"] = DangHocPhanTinhHeSo.GetListDangHocPhanTinhHeSo(quyDinhSiSoLopHocPhan.DangHocPhan);
            return View(pathView,quyDinhSiSoLopHocPhan);
        }

        // POST: QuanTris/QuyDinhSiSoLopHocPhans/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(int id, [Bind("IdQuyDinhSiSoLopHocPhan,CanDuoi,CanTren,HeSoSiSo,ThoiGianBatDau,ThoiGianKetThuc,DangHocPhan")] QuyDinhSiSoLopHocPhan quyDinhSiSoLopHocPhan)
        {
            if (id != quyDinhSiSoLopHocPhan.IdQuyDinhSiSoLopHocPhan)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (id==0)
                    {
                        await _context.AddAsync(quyDinhSiSoLopHocPhan);
                        result = Message.SuccessCreate(model);
                    }
                    else
                    {
                        _context.Update(quyDinhSiSoLopHocPhan);
                        result = Message.SuccessEdit(model);
                    }
                    await _context.SaveChangesAsync();
                }
                catch (Exception ex)
                {
                    result = Message.Fail(ex, removeSpecialCharacters);
                }
                return Json(new { isValid = true, href = "QuyDinhSiSoLopHocPhansTab", message = result });
            }
            ViewData["DangHocPhanTinhHeSo"] = DangHocPhanTinhHeSo.GetListDangHocPhanTinhHeSo(quyDinhSiSoLopHocPhan.DangHocPhan); return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, pathView, quyDinhSiSoLopHocPhan) });
        }

       

        // POST: QuanTris/QuyDinhSiSoLopHocPhans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]

        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var quyDinhSiSoLopHocPhan = await _context.QuyDinhSiSoLopHocPhans
                    .FirstOrDefaultAsync(n => n.IdQuyDinhSiSoLopHocPhan == id);
     
                    _context.QuyDinhSiSoLopHocPhans.Remove(quyDinhSiSoLopHocPhan);
                    await _context.SaveChangesAsync();
                    result = Message.SuccessDelete(model);
            }
            catch (Exception ex)
            {
                result = Message.Fail(ex);
            }
            return Json(new { isValid = true, href = "QuyDinhSiSoLopHocPhansTab", message = result });
        }
    }
}
