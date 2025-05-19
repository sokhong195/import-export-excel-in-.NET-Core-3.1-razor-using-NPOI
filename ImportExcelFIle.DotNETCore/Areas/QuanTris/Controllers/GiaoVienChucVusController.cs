using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.Models;
using ImportExcelFIle.DotNETCore.Utilities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Hosting;
using System.IO;
using ImportExcelFIle.DotNETCore.Classes;

namespace ImportExcelFIle.DotNETCore.Areas.QuanTris.Controllers
{
    [Area("QuanTris")]
    public class GiaoVienChucVusController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public readonly string model = "Chức vụ giáo viên";
        public string result = "";
        private bool removeSpecialCharacters = true;
        public string pathView = "CreateOrEdit";
        public IWebHostEnvironment hostingEnvironment;

        public GiaoVienChucVusController(dbPhanCongThanhToanContext context, IWebHostEnvironment _environment)
        {
            _context = context;
            hostingEnvironment = _environment;
        }

        // GET: QuanTris/GiaoVienChucVus/Create
        public async Task<IActionResult> CreateOrEdit(int IdGiaoVien = 0, int IdGiaoVienChucVu = 0)
        {
            GiaoVienChucVu GiaoVienChucVu = new GiaoVienChucVu();
            if (!CheckExist.IdGiaoVien(IdGiaoVien))
            {
                return NotFound();
            }
            if (IdGiaoVienChucVu != 0)
            {
                GiaoVienChucVu = await GetModel.GiaoVienChucVu(IdGiaoVienChucVu);
                if (GiaoVienChucVu == null)
                {
                    return NotFound();
                }
            }
            else
            {
                GiaoVienChucVu.ThoiGianBatDau = DateTime.Now;
                GiaoVienChucVu.IdGiaoVien = IdGiaoVien;
                GiaoVienChucVu.TinhTrang = TinhTrang.ChoXacNhan;
            }
            ViewData["IdChucVu"] = await GetList.ChucVuSelectList(GiaoVienChucVu.IdChucVu);
            ViewData["TinhTrang"] = TinhTrang.GetListTinhTrang(GiaoVienChucVu.TinhTrang);
            return View(pathView, GiaoVienChucVu);
        }

        // POST: QuanTris/GiaoVienChucVus/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(int id, [Bind("IdGiaoVienChucVu,IdGiaoVien,IdChucVu,ThoiGianBatDau,ThoiGianKetThuc,QuyetDinh,TinhTrang")] GiaoVienChucVu giaoVienChucVu, List<IFormFile> fileuploads)
        {
            if (giaoVienChucVu.IdGiaoVienChucVu == 0 && (fileuploads == null || fileuploads.Count() == 0))
            {
                ModelState.AddModelError("", "Chưa chọn tập tin thông tin quyết định chức vụ");
            }
            if (ModelState.IsValid)
            {
                try
                {
                    if (fileuploads != null && fileuploads.Count() > 0)
                        {
                        //Xóa ảnh đã có trước đấy
                        if (giaoVienChucVu.IdGiaoVienChucVu!=0 && !string.IsNullOrEmpty( giaoVienChucVu.QuyetDinh))
                        {
                            string[] fileNames = giaoVienChucVu.QuyetDinh.Split(' ');
                            foreach (var fileName in fileNames)
                            {
                               await ProcessFile.DeleteFile("ChucVus", fileName, hostingEnvironment);
                            }
                        }
                        giaoVienChucVu.QuyetDinh = "";
                        int index = 0;
                        foreach (var file in fileuploads)
                        {
                            index++;
                            string tenTep = giaoVienChucVu.IdGiaoVien.ToString() + "_" + giaoVienChucVu.IdChucVu.ToString()+"_"+DateTime.Now.ToString("dd-MM-yyyy") + "_" + index.ToString() + Path.GetExtension(file.FileName).ToLower();
                            if (giaoVienChucVu.QuyetDinh == "")
                            {
                                giaoVienChucVu.QuyetDinh = tenTep;
                            }
                            else
                            {
                                giaoVienChucVu.QuyetDinh += " " + tenTep;
                            }
                            ProcessFile.CopyFileToFolder("ChucVus", tenTep, file, hostingEnvironment);
                        }
                        giaoVienChucVu.TinhTrang = TinhTrang.ChoXacNhan;
                    }
                    if (giaoVienChucVu.IdGiaoVienChucVu == 0)
                    {
                        _context.Add(giaoVienChucVu);
                        await _context.SaveChangesAsync();
                        result = Message.SuccessCreate(model);
                    }
                    else
                    {
                        _context.Update(giaoVienChucVu);
                        await _context.SaveChangesAsync();
                        result = Message.SuccessEdit(model);
                    }
                }
                catch (Exception ex)
                {
                    result = Message.Fail(ex, removeSpecialCharacters);
                }
                return Json(new { isValid = true, href = "GiaoViensTab&IdGiaoVien=" + giaoVienChucVu.IdGiaoVien, message = result });
            }
            ViewData["IdChucVu"] = await GetList.ChucVuSelectList(giaoVienChucVu.IdChucVu);
            ViewData["TinhTrang"] = TinhTrang.GetListTinhTrang(giaoVienChucVu.TinhTrang);
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, pathView, giaoVienChucVu) });
        }

        // POST: QuanTris/GiaoVienChucVus/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int Id)
        {
            try
            {
                var GiaoVienChucVu = await _context.GiaoVienChucVus.FindAsync(Id);

                if (GiaoVienChucVu == null)
                {
                    result = Message.FailNotExist(model);
                }
                else
                {
                    _context.GiaoVienChucVus.Remove(GiaoVienChucVu);
                    await _context.SaveChangesAsync();
                    result = Message.SuccessDelete(model);
                }
            }
            catch (Exception ex)
            {
                result = Message.Fail(ex);
            }
            return Json(new { isValid = true, href = "GiaoViensTab", message = result });
        }
    }
}
