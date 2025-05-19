using ImportExcelFIle.DotNETCore.Models;
using ImportExcelFIle.DotNETCore.Utilities;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Areas.QuanTris.Controllers
{
    [Area("QuanTris")]

    public class GiaoVienTrinhDoesController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public readonly string model = "Trình đô giáo viên";
        public string result = "";
        private bool removeSpecialCharacters = true;
        public string pathView = "CreateOrEdit";
        public IWebHostEnvironment hostingEnvironment;

        public GiaoVienTrinhDoesController(dbPhanCongThanhToanContext context, IWebHostEnvironment _environment)
        {
            _context = context;
            hostingEnvironment = _environment;
        }

        // GET: QuanTris/GiaoVienTrinhDos/Create
        public async Task<IActionResult> CreateOrEdit(int IdGiaoVien = 0, int IdGiaoVienTrinhDo = 0)
        {
            GiaoVienTrinhDo GiaoVienTrinhDo = new GiaoVienTrinhDo();
            if (!CheckExist.IdGiaoVien(IdGiaoVien))
            {
                return NotFound();
            }
            if (IdGiaoVienTrinhDo != 0)
            {
                GiaoVienTrinhDo = await GetModel.GiaoVienTrinhDo(IdGiaoVienTrinhDo);
                if (GiaoVienTrinhDo == null)
                {
                    return NotFound();
                }
            }
            else
            {
                GiaoVienTrinhDo.ThoiGianBatDau = DateTime.Now;
                GiaoVienTrinhDo.IdGiaoVien = IdGiaoVien;
                GiaoVienTrinhDo.TinhTrang = TinhTrang.ChoXacNhan;
            }
            ViewData["IdTrinhDo"] = await GetList.TrinhDoSelectList(GiaoVienTrinhDo.IdTrinhDo);
            ViewData["TinhTrang"] = TinhTrang.GetListTinhTrang(GiaoVienTrinhDo.TinhTrang);
            return View(pathView, GiaoVienTrinhDo);
        }

        // POST: QuanTris/GiaoVienTrinhDos/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(int id, [Bind("IdGiaoVienTrinhDo,IdGiaoVien,IdTrinhDo,ThoiGianBatDau,ThoiGianKetThuc,QuyetDinh,TinhTrang")] GiaoVienTrinhDo GiaoVienTrinhDo, List<IFormFile> fileuploads)
        {
            if (GiaoVienTrinhDo.IdGiaoVienTrinhDo == 0 && (fileuploads == null || fileuploads.Count() == 0))
            {
                ModelState.AddModelError("", "Chưa chọn tập tin thông tin trình độ");
            }
            if (ModelState.IsValid)
            {
                try
                {
                    if (fileuploads != null && fileuploads.Count() > 0)
                    {
                        //Xóa ảnh đã có trước đấy
                        if (GiaoVienTrinhDo.IdGiaoVienTrinhDo != 0 && !string.IsNullOrEmpty(GiaoVienTrinhDo.QuyetDinh))
                        {
                            string[] fileNames = GiaoVienTrinhDo.QuyetDinh.Split(' ');
                            foreach (var fileName in fileNames)
                            {
                                await ProcessFile.DeleteFile("TrinhDoes", fileName, hostingEnvironment);
                            }
                        }
                        GiaoVienTrinhDo.QuyetDinh = "";
                        int index = 0;
                        foreach (var file in fileuploads)
                        {
                            index++;
                            string tenTep = GiaoVienTrinhDo.IdGiaoVien.ToString() + "_" + GiaoVienTrinhDo.IdTrinhDo.ToString() + "_" + DateTime.Now.ToString("dd-MM-yyyy") + "_" + index.ToString() + Path.GetExtension(file.FileName).ToLower();
                            if (GiaoVienTrinhDo.QuyetDinh == "")
                            {
                                GiaoVienTrinhDo.QuyetDinh = tenTep;
                            }
                            else
                            {
                                GiaoVienTrinhDo.QuyetDinh += " " + tenTep;
                            }
                            ProcessFile.CopyFileToFolder("TrinhDoes", tenTep, file, hostingEnvironment);
                        }
                        GiaoVienTrinhDo.TinhTrang = TinhTrang.ChoXacNhan;
                    }
                    if (GiaoVienTrinhDo.IdGiaoVienTrinhDo == 0)
                    {
                        _context.Add(GiaoVienTrinhDo);
                        await _context.SaveChangesAsync();
                        result = Message.SuccessCreate(model);
                    }
                    else
                    {
                        _context.Update(GiaoVienTrinhDo);
                        await _context.SaveChangesAsync();
                        result = Message.SuccessEdit(model);
                    }
                }
                catch (Exception ex)
                {
                    result = Message.Fail(ex, removeSpecialCharacters);
                }
                return Json(new { isValid = true, href = "GiaoViensTab&IdGiaoVien=" + GiaoVienTrinhDo.IdGiaoVien, message = result });
            }
            ViewData["IdTrinhDo"] = await GetList.ChucVuSelectList(GiaoVienTrinhDo.IdTrinhDo);
            ViewData["TinhTrang"] = TinhTrang.GetListTinhTrang(GiaoVienTrinhDo.TinhTrang);
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, pathView, GiaoVienTrinhDo) });
        }

        // POST: QuanTris/GiaoVienTrinhDos/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int Id)
        {
            try
            {
                var GiaoVienTrinhDo = await _context.GiaoVienTrinhDoes.FindAsync(Id);

                if (GiaoVienTrinhDo == null)
                {
                    result = Message.FailNotExist(model);
                }
                else
                {
                    _context.GiaoVienTrinhDoes.Remove(GiaoVienTrinhDo);
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
