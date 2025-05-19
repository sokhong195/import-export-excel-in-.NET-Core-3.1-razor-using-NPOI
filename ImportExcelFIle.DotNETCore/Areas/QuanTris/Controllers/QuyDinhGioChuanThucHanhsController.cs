using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.Models;
using ImportExcelFIle.DotNETCore.Utilities;
using System.Linq.Dynamic.Core;
using Newtonsoft.Json;
using ImportExcelFIle.DotNETCore.Classes;

namespace ImportExcelFIle.DotNETCore.Areas.QuanTris.Controllers
{
    [Area("QuanTris")]
    public class QuyDinhGioChuanThucHanhsController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public readonly string model = "Quy định giờ chuẩn thực hành";
        public string result = "";
        private bool removeSpecialCharacters = true;
        public string pathView = "CreateOrEdit";


        public QuyDinhGioChuanThucHanhsController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }

        // GET: QuanTris/QuyDinhGioChuanThucHanhs
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
                var quyDinhGioChuanThucHanhs = await GetList.QuyDinhGioChuanThucHanhs(null);

                if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDirection)))
                {
                    var colSortName = "ThoiGianKetThuc";
                    switch (sortColumn)
                    {
                        case "Nội dung thực hành":
                            colSortName = "TenNoiDungGiangDay"; break;
                        case "Thời gian bắt đầu":
                            colSortName = "ThoiGianBatDau"; break;
                        default: colSortName = "ThoiGianKetThuc"; break;
                    }

                    quyDinhGioChuanThucHanhs = quyDinhGioChuanThucHanhs.AsQueryable().OrderBy(colSortName + " " + sortColumnDirection).ToList();
                }
                if (!string.IsNullOrEmpty(searchValue))
                {
                    quyDinhGioChuanThucHanhs = quyDinhGioChuanThucHanhs.Where(m => m.TenNoiDungGiangDay.Contains(searchValue)).ToList();
                }
                recordsTotal = quyDinhGioChuanThucHanhs.Count();
                var data = quyDinhGioChuanThucHanhs.Skip(skip).Take(pageSize).ToList();
                var jsonData = new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = JsonConvert.SerializeObject(data) };
                return Json(jsonData);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(int id, [Bind("TenNoiDungGiangDay,IdQuyDinhGioChuanThucHanh,IdKhoa,CanDuoi,CanTren,SoGioChuan,ThoiGianBatDau,ThoiGianKetThuc")] QuyDinhGioChuanThucHanh quyDinhGioChuanThucHanh)
        {
            if (id != quyDinhGioChuanThucHanh.IdQuyDinhGioChuanThucHanh)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (id == 0)
                    {
                        await _context.AddAsync(quyDinhGioChuanThucHanh);
                        result = Message.SuccessCreate(model);
                    }
                    else
                    {
                        _context.Update(quyDinhGioChuanThucHanh);
                        result = Message.SuccessEdit(model);
                    }
                    await _context.SaveChangesAsync();
                }
                catch (Exception ex)
                {
                    result = Message.Fail(ex, removeSpecialCharacters);
                }
                return Json(new { isValid = true, href = "QuyDinhGioChuanThucHanhsTab", message = result });
            }
            ViewData["NoiDungThucHanh"] = NoiDungThucHanh.GetListNoiDungThucHanh(quyDinhGioChuanThucHanh.TenNoiDungGiangDay);
            ViewData["IdKhoa"] = await GetList.KhoaSelectList(quyDinhGioChuanThucHanh.IdKhoa);
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, pathView, quyDinhGioChuanThucHanh) });
        }

        // GET: QuanTris/QuyDinhGioChuanThucHanhs/Edit/5
        public async Task<IActionResult> CreateOrEdit(int? id=0)
        {
            QuyDinhGioChuanThucHanh quyDinhGioChuanThucHanh = null;
          if (id == 0)
            {
                quyDinhGioChuanThucHanh = new QuyDinhGioChuanThucHanh();
                quyDinhGioChuanThucHanh.IdQuyDinhGioChuanThucHanh = 0;
                quyDinhGioChuanThucHanh.TenNoiDungGiangDay = NoiDungThucHanh.GiangDayThucHanh;
                quyDinhGioChuanThucHanh.ThoiGianBatDau = DateTime.Now;
            }
            else
            {
                quyDinhGioChuanThucHanh = await _context.QuyDinhGioChuanThucHanhs.FindAsync(id);
                if (quyDinhGioChuanThucHanh == null)
                {
                    return NotFound();
                }
            }
            ViewData["NoiDungThucHanh"] = NoiDungThucHanh.GetListNoiDungThucHanh(quyDinhGioChuanThucHanh.TenNoiDungGiangDay);
            ViewData["IdKhoa"] = await GetList.KhoaSelectList(quyDinhGioChuanThucHanh.IdKhoa);
            return View(pathView, quyDinhGioChuanThucHanh);
        }

            

        // POST: QuanTris/QuyDinhGioChuanThucHanhs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var quyDinhGioChuanThucHanh = await _context.QuyDinhGioChuanThucHanhs
                    .FirstOrDefaultAsync(n => n.IdQuyDinhGioChuanThucHanh == id);

                _context.QuyDinhGioChuanThucHanhs.Remove(quyDinhGioChuanThucHanh);
                await _context.SaveChangesAsync();
                result = Message.SuccessDelete(model);
            }
            catch (Exception ex)
            {
                result = Message.Fail(ex);
            }
            return Json(new { isValid = true, href = "QuyDinhGioChuanThucHanhsTab", message = result });
        }

    }
}
