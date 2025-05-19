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
    public class GiaoVienTrangThaiLamViecsController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public readonly string model = "Trạng thái làm việc của giáo viên";
        public string result = "";
        private bool removeSpecialCharacters = true;
        public string pathView = "CreateOrEdit";
        public IWebHostEnvironment hostingEnvironment;

        public GiaoVienTrangThaiLamViecsController(dbPhanCongThanhToanContext context, IWebHostEnvironment _environment)
        {
            _context = context;
            hostingEnvironment = _environment;
        }

        // GET: QuanTris/GiaoVienTrangThaiLamViecs/Create
        public async Task<IActionResult> CreateOrEdit(int IdGiaoVien = 0, int IdGiaoVienTrangThaiLamViec = 0)
        {
            GiaoVienTrangThaiLamViec GiaoVienTrangThaiLamViec = new GiaoVienTrangThaiLamViec();
            if (!CheckExist.IdGiaoVien(IdGiaoVien))
            {
                return NotFound();
            }
            if (IdGiaoVienTrangThaiLamViec != 0)
            {
                GiaoVienTrangThaiLamViec = await GetModel.GiaoVienTrangThaiLamViec(IdGiaoVienTrangThaiLamViec);
                if (GiaoVienTrangThaiLamViec == null)
                {
                    return NotFound();
                }
            }
            else
            {
                GiaoVienTrangThaiLamViec.ThoiGianBatDau = DateTime.Now;
                GiaoVienTrangThaiLamViec.IdGiaoVien = IdGiaoVien;
                GiaoVienTrangThaiLamViec.TinhTrang = TinhTrang.ChoXacNhan;
            }
            ViewData["IdTrangThaiLamViec"] = await GetList.TrangThaiLamViecSelectList(GiaoVienTrangThaiLamViec.IdTrangThaiLamViec);
            ViewData["TinhTrang"] = TinhTrang.GetListTinhTrang(GiaoVienTrangThaiLamViec.TinhTrang);
            return View(pathView, GiaoVienTrangThaiLamViec);
        }

        // POST: QuanTris/GiaoVienTrangThaiLamViecs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(int id, [Bind("IdGiaoVienTrangThaiLamViec,IdGiaoVien,IdTrangThaiLamViec,ThoiGianBatDau,ThoiGianKetThuc,QuyetDinh,TinhTrang")] GiaoVienTrangThaiLamViec GiaoVienTrangThaiLamViec, List<IFormFile> fileuploads)
        {
            if (GiaoVienTrangThaiLamViec.IdGiaoVienTrangThaiLamViec == 0 && (fileuploads == null || fileuploads.Count() == 0))
            {
                ModelState.AddModelError("", "Chưa chọn tập tin thông tin quyết định về trạng thái làm việc");
            }
            if (ModelState.IsValid)
            {
                try
                {
                    if (fileuploads != null && fileuploads.Count() > 0)
                    {
                        //Xóa ảnh đã có trước đấy
                        if (GiaoVienTrangThaiLamViec.IdGiaoVienTrangThaiLamViec != 0 && !string.IsNullOrEmpty(GiaoVienTrangThaiLamViec.QuyetDinh))
                        {
                            string[] fileNames = GiaoVienTrangThaiLamViec.QuyetDinh.Split(' ');
                            foreach (var fileName in fileNames)
                            {
                                await ProcessFile.DeleteFile("TrangThaiLamViecs", fileName, hostingEnvironment);
                            }
                        }
                        GiaoVienTrangThaiLamViec.QuyetDinh = "";
                        int index = 0;
                        foreach (var file in fileuploads)
                        {
                            index++;
                            string tenTep = GiaoVienTrangThaiLamViec.IdGiaoVien.ToString() + "_" + GiaoVienTrangThaiLamViec.IdGiaoVienTrangThaiLamViec.ToString() + "_" + DateTime.Now.ToString("dd-MM-yyyy") + "_" + index.ToString() + Path.GetExtension(file.FileName).ToLower();
                            if (GiaoVienTrangThaiLamViec.QuyetDinh == "")
                            {
                                GiaoVienTrangThaiLamViec.QuyetDinh = tenTep;
                            }
                            else
                            {
                                GiaoVienTrangThaiLamViec.QuyetDinh += " " + tenTep;
                            }
                            ProcessFile.CopyFileToFolder("TrangThaiLamViecs", tenTep, file, hostingEnvironment);
                        }
                        GiaoVienTrangThaiLamViec.TinhTrang = TinhTrang.ChoXacNhan;
                    }
                    if (GiaoVienTrangThaiLamViec.IdGiaoVienTrangThaiLamViec == 0)
                    {
                        _context.Add(GiaoVienTrangThaiLamViec);
                        await _context.SaveChangesAsync();
                        result = Message.SuccessCreate(model);
                    }
                    else
                    {
                        _context.Update(GiaoVienTrangThaiLamViec);
                        await _context.SaveChangesAsync();
                        result = Message.SuccessEdit(model);
                    }
                }
                catch (Exception ex)
                {
                    result = Message.Fail(ex, removeSpecialCharacters);
                }
                return Json(new { isValid = true, href = "GiaoViensTab&IdGiaoVien=" + GiaoVienTrangThaiLamViec.IdGiaoVien, message = result });
            }
            ViewData["IdTrangThaiLamViec"] = await GetList.TrangThaiLamViecSelectList(GiaoVienTrangThaiLamViec.IdTrangThaiLamViec);
            ViewData["TinhTrang"] = TinhTrang.GetListTinhTrang(GiaoVienTrangThaiLamViec.TinhTrang);
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, pathView, GiaoVienTrangThaiLamViec) });
        }

        // POST: QuanTris/GiaoVienTrangThaiLamViecs/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int Id)
        {
            try
            {
                var GiaoVienTrangThaiLamViec = await _context.GiaoVienTrangThaiLamViecs.FindAsync(Id);

                if (GiaoVienTrangThaiLamViec == null)
                {
                    result = Message.FailNotExist(model);
                }
                else
                {
                    _context.GiaoVienTrangThaiLamViecs.Remove(GiaoVienTrangThaiLamViec);
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
