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

namespace ImportExcelFIle.DotNETCore.Areas.QuanTris.Controllers
{
    [Area("QuanTris")]
    public class GiaoVienChiTietsController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public readonly string model = "Vị trí công việc";
        public string result = "";
        private bool removeSpecialCharacters = true;
        public string pathView = "CreateOrEdit";
        public IWebHostEnvironment hostingEnvironment;
        public GiaoVienChiTietsController(dbPhanCongThanhToanContext context, IWebHostEnvironment _environment)
        {
            _context = context;
            hostingEnvironment = _environment;
        }

        // GET: QuanTris/GiaoVienChiTiets/Create
        public async Task<IActionResult> CreateOrEdit(int IdGiaoVien = 0,int IdGiaoVienChiTiet=0)
        {
            GiaoVienChiTiet giaoVienChiTiet = new GiaoVienChiTiet();
            if (!Utilities.CheckExist.IdGiaoVien(IdGiaoVien))
            {
                return NotFound();
            }
            var IdKhoa = "";
            if (IdGiaoVienChiTiet!=0)
            {
                giaoVienChiTiet = await Utilities.GetModel.GiaoVienChiTiet(IdGiaoVienChiTiet);
                if (giaoVienChiTiet==null)
                {
                    return NotFound();
                }
                IdKhoa = GetID.IdKhoaTheoBoMon(giaoVienChiTiet.IdBoMon);
            }
            else
            {
                giaoVienChiTiet.ThoiGianBatDau = DateTime.Now;
                giaoVienChiTiet.IdGiaoVien = IdGiaoVien;
                giaoVienChiTiet.TinhTrang = TinhTrang.ChoXacNhan;

            }
            ViewData["TinhTrang"] = TinhTrang.GetListTinhTrang(giaoVienChiTiet.TinhTrang);

            ViewData["IdKhoa"] = await GetList.KhoaSelectList(IdKhoa);
            ViewData["IdBoMon"] = await GetList.BoMonSelectList(IdKhoa, giaoVienChiTiet.IdBoMon);
            ViewData["IdLoaiCongViec"] = await GetList.LoaiCongViecSelectList(giaoVienChiTiet.IdLoaiCongViec); 
            ViewData["IdPhongTrungTam"] = await GetList.PhongTrungTamSelectList(giaoVienChiTiet.IdPhongTrungTam);
            return View(pathView,giaoVienChiTiet);
        }

        // POST: QuanTris/GiaoVienChiTiets/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit([Bind("IdGiaoVienChiTiet,IdGiaoVien,IdLoaiCongViec,IdPhongTrungTam,IdBoMon,ThoiGianBatDau,ThoiGianKetThuc,QuyetDinh,TinhTrang")] GiaoVienChiTiet giaoVienChiTiet, List<IFormFile> fileuploads)
        {
            if (giaoVienChiTiet.IdBoMon==0 && giaoVienChiTiet.IdPhongTrungTam == 0)
            {
                ModelState.AddModelError("", "Hãy chọn đơn vị công tác là phòng, trung tâm hoặc bộ môn");
            }
            if (giaoVienChiTiet.IdGiaoVienChiTiet == 0 && (fileuploads == null || fileuploads.Count() == 0))
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
                        if (giaoVienChiTiet.IdGiaoVienChiTiet != 0 && !string.IsNullOrEmpty(giaoVienChiTiet.QuyetDinh))
                        {
                            string[] fileNames = giaoVienChiTiet.QuyetDinh.Split(' ');
                            foreach (var fileName in fileNames)
                            {
                                await ProcessFile.DeleteFile("GiaoVienChiTiets", fileName, hostingEnvironment);
                            }
                        }
                        giaoVienChiTiet.QuyetDinh = "";
                        int index = 0;
                        foreach (var file in fileuploads)
                        {
                            index++;
                            string tenTep = giaoVienChiTiet.IdGiaoVien.ToString() + "_" + giaoVienChiTiet.IdGiaoVienChiTiet.ToString() + "_" + DateTime.Now.ToString("dd-MM-yyyy") + "_" + index.ToString() + Path.GetExtension(file.FileName).ToLower();
                            if (giaoVienChiTiet.QuyetDinh == "")
                            {
                                giaoVienChiTiet.QuyetDinh = tenTep;
                            }
                            else
                            {
                                giaoVienChiTiet.QuyetDinh += " " + tenTep;
                            }
                            ProcessFile.CopyFileToFolder("GiaoVienChiTiets", tenTep, file, hostingEnvironment);
                        }
                        giaoVienChiTiet.TinhTrang = TinhTrang.ChoXacNhan;
                    }
                    if (giaoVienChiTiet.IdPhongTrungTam==0)
                    {
                        giaoVienChiTiet.IdPhongTrungTam = null;
                    }
                    if (giaoVienChiTiet.IdBoMon == 0)
                    {
                        giaoVienChiTiet.IdBoMon = null;
                    }
                    if (giaoVienChiTiet.IdGiaoVienChiTiet == 0)
                    {
                        _context.Add(giaoVienChiTiet);
                        await _context.SaveChangesAsync();
                        result = Message.SuccessCreate(model);
                    }
                    else
                    {
                        _context.Update(giaoVienChiTiet);
                        await _context.SaveChangesAsync();
                        result = Message.SuccessEdit(model);
                    }
                }
                catch (Exception ex)
                {
                    result = Message.Fail(ex, removeSpecialCharacters);
                }
                return Json(new { isValid = true, href = "GiaoViensTab&IdGiaoVien=" +giaoVienChiTiet.IdGiaoVien, message = result });
            }
            var IdKhoa = "";
            if (giaoVienChiTiet.IdBoMon!=null)
            {
                IdKhoa = GetID.IdKhoaTheoBoMon(giaoVienChiTiet.IdBoMon);
            }
            ViewData["IdKhoa"] = await GetList.KhoaSelectList(IdKhoa);
            ViewData["IdBoMon"] = await GetList.BoMonSelectList(IdKhoa, giaoVienChiTiet.IdBoMon);
            ViewData["IdLoaiCongViec"] = await GetList.LoaiCongViecSelectList(giaoVienChiTiet.IdLoaiCongViec);
            ViewData["IdPhongTrungTam"] = await GetList.PhongTrungTamSelectList(giaoVienChiTiet.IdPhongTrungTam);
            ViewData["TinhTrang"] = TinhTrang.GetListTinhTrang(giaoVienChiTiet.TinhTrang);
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, pathView, giaoVienChiTiet) });
        }

                // POST: QuanTris/GiaoVienChiTiets/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int Id)
        {
            try
            {
                var giaoVienChiTiet = await _context.GiaoVienChiTiets.FindAsync(Id);
               
                if (giaoVienChiTiet == null)
                {
                    result = Message.FailNotExist(model);
                }
                else
                {
                    _context.GiaoVienChiTiets.Remove(giaoVienChiTiet);
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
