using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.Models;
using Microsoft.AspNetCore.Hosting;
using ImportExcelFIle.DotNETCore.Utilities;
using Microsoft.AspNetCore.Http;
using System.IO;

namespace ImportExcelFIle.DotNETCore.Areas.QuanTris.Controllers
{
    [Area("QuanTris")]
    public class CacHeSoLuongsController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public readonly string model = "Các hệ số lương";
        public string result = "";
        private bool removeSpecialCharacters = true;
        public string pathView = "CreateOrEdit";
        public IWebHostEnvironment hostingEnvironment;

        public CacHeSoLuongsController(dbPhanCongThanhToanContext context, IWebHostEnvironment _environment)
        {
            _context = context;
            hostingEnvironment = _environment;
        }

        // GET: QuanTris/CacHeSoLuongs/Create
        public async Task<IActionResult> CreateOrEdit(int IdGiaoVien = 0, int IdHeSoLuong = 0)
        {
            CacHeSoLuong CacHeSoLuong = new CacHeSoLuong();
            if (!CheckExist.IdGiaoVien(IdGiaoVien))
            {
                return NotFound();
            }
            if (IdHeSoLuong != 0)
            {
                CacHeSoLuong = await GetModel.CacHeSoLuong(IdHeSoLuong);
                if (CacHeSoLuong == null)
                {
                    return NotFound();
                }
            }
            else
            {
                CacHeSoLuong.ThoiGianBatDau = DateTime.Now;
                CacHeSoLuong.IdGiaoVien = IdGiaoVien;
                CacHeSoLuong.TinhTrang = TinhTrang.ChoXacNhan;
            }
            ViewData["TinhTrang"] = TinhTrang.GetListTinhTrang(CacHeSoLuong.TinhTrang);
            return View(pathView, CacHeSoLuong);
        }

        // POST: QuanTris/CacHeSoLuongs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(int id, [Bind("IdHeSoLuong,IdGiaoVien,HeSoLuong,PhuCapChucVu,PhuCapNgheNghiep,ThoiGianBatDau,ThoiGianKetThuc,QuyetDinh,TinhTrang")] CacHeSoLuong CacHeSoLuong, List<IFormFile> fileuploads)
        {
            if (CacHeSoLuong.IdHeSoLuong == 0 && (fileuploads == null || fileuploads.Count() == 0))
            {
                ModelState.AddModelError("", "Chưa chọn tập tin thông tin quyết định lương");
            }
            if (ModelState.IsValid)
            {
                try
                {
                    if (fileuploads != null && fileuploads.Count() > 0)
                    {
                        //Xóa ảnh đã có trước đấy
                        if (CacHeSoLuong.IdHeSoLuong != 0 && !string.IsNullOrEmpty(CacHeSoLuong.QuyetDinh))
                        {
                            string[] fileNames = CacHeSoLuong.QuyetDinh.Split(' ');
                            foreach (var fileName in fileNames)
                            {
                                await ProcessFile.DeleteFile("CacHeSoLuongs", fileName, hostingEnvironment);
                            }
                        }
                        CacHeSoLuong.QuyetDinh = "";
                        int index = 0;
                        foreach (var file in fileuploads)
                        {
                            index++;
                            string tenTep = CacHeSoLuong.IdGiaoVien.ToString() + "_" + CacHeSoLuong.IdHeSoLuong.ToString() + "_" + DateTime.Now.ToString("dd-MM-yyyy") + "_" + index.ToString() + Path.GetExtension(file.FileName).ToLower();
                            if (CacHeSoLuong.QuyetDinh == "")
                            {
                                CacHeSoLuong.QuyetDinh = tenTep;
                            }
                            else
                            {
                                CacHeSoLuong.QuyetDinh += " " + tenTep;
                            }
                            ProcessFile.CopyFileToFolder("CacHeSoLuongs", tenTep, file, hostingEnvironment);
                        }
                        CacHeSoLuong.TinhTrang = TinhTrang.ChoXacNhan;
                    }
                    if (CacHeSoLuong.IdHeSoLuong == 0)
                    {
                        _context.Add(CacHeSoLuong);
                        await _context.SaveChangesAsync();
                        result = Message.SuccessCreate(model);
                    }
                    else
                    {
                        _context.Update(CacHeSoLuong);
                        await _context.SaveChangesAsync();
                        result = Message.SuccessEdit(model);
                    }
                }
                catch (Exception ex)
                {
                    result = Message.Fail(ex, removeSpecialCharacters);
                }
                return Json(new { isValid = true, href = "GiaoViensTab&IdGiaoVien=" + CacHeSoLuong.IdGiaoVien, message = result });
            }
            ViewData["TinhTrang"] = TinhTrang.GetListTinhTrang(CacHeSoLuong.TinhTrang);
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, pathView, CacHeSoLuong) });
        }

        // POST: QuanTris/CacHeSoLuongs/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int Id)
        {
            try
            {
                var CacHeSoLuong = await _context.CacHeSoLuongs.FindAsync(Id);

                if (CacHeSoLuong == null)
                {
                    result = Message.FailNotExist(model);
                }
                else
                {
                    _context.CacHeSoLuongs.Remove(CacHeSoLuong);
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
