using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.ModelViews;
using ImportExcelFIle.DotNETCore.Models;
using Microsoft.AspNetCore.Http;
using ImportExcelFIle.DotNETCore.Utilities;
using Newtonsoft.Json;
using AutoMapper;
using ImportExcelFIle.DotNETCore.Classes;
namespace ImportExcelFIle.DotNETCore.Areas.QuanTris.Controllers
{
    [Area("QuanTris")]
    public class DanhSachGiaoViensController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public DanhSachGiaoViensController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> CreateFromFile([Bind("theFile")] IFormFile theFile)
        {
            List<ViewGiaoVien> ViewGiaoViens = new List<ViewGiaoVien>();
            ViewGiaoViens = await ReadDataFromExcelCell.GetGiaoViens(theFile);
            if (ViewGiaoViens != null)
            {
                TempData["ViewGiaoViens"] = JsonConvert.SerializeObject(ViewGiaoViens);
                return RedirectToAction("Index","QuanTris", new { Tab = "DanhSachGiaoViensTab" });
            }
            else
            {
                TempData["msg"] = MessageBox.Fail(ReadDataFromExcelCell.Message);
                return RedirectToAction("Index", "QuanTris", new { Tab = "DanhSachGiaoViensTab" });
            }
        }
        [HttpGet]
        public async Task<IActionResult> SaveFromFile()
        {
            try
            {
                IMapper mapper = AutoMapperProfile.AutoMapperConfig();
                if (TempData["ViewGiaoViens"] != null)
                {
                    List<ViewGiaoVien> viewGiaoViens  = JsonConvert.DeserializeObject<List<ViewGiaoVien>>(TempData["ViewGiaoViens"].ToString());
                    foreach (var item in viewGiaoViens)
                    {
                        GiaoVien giaoVien = mapper.Map<GiaoVien>(item);
                        if (item.ViewChucVuChiTiets!=null)
                        {
                            foreach (var viewChucVu in item.ViewChucVuChiTiets)
                            {
                                GiaoVienChucVu giaoVienChucVu = mapper.Map<GiaoVienChucVu>(viewChucVu);
                                giaoVien.GiaoVienChucVus.Add(giaoVienChucVu);
                            }
                        }
                        if (item.ViewGiaoVienChiTiets != null)
                        {
                            foreach (var viewGiaoVienChiTiet in item.ViewGiaoVienChiTiets)
                            {
                                GiaoVienChiTiet giaoVienChiTiet = mapper.Map<GiaoVienChiTiet>(viewGiaoVienChiTiet);
                                giaoVien.GiaoVienChiTiets.Add(giaoVienChiTiet);
                            }
                        }
                        if (item.CacHeSoLuongs != null)
                        {
                            foreach (var cacHeSoLuong in item.CacHeSoLuongs)
                            {
                                giaoVien.CacHeSoLuongs.Add(cacHeSoLuong);
                            }
                        }
                        if (item.IdGiaoVien == 0)
                        {
                           await _context.GiaoViens.AddAsync(giaoVien);
                           await _context.GiaoVienChiTiets.AddRangeAsync(giaoVien.GiaoVienChiTiets);
                           await _context.CacHeSoLuongs.AddRangeAsync(giaoVien.CacHeSoLuongs);
                            if (item.ViewChucVuChiTiets!=null)
                            {
                                await _context.GiaoVienChucVus.AddRangeAsync(giaoVien.GiaoVienChucVus);
                            }
                        }
                        else
                        {
                            _context.GiaoViens.Update(giaoVien);
                            foreach (var gvct in giaoVien.GiaoVienChiTiets)
                            {
                                if (gvct.IdGiaoVienChiTiet==0)
                                {
                                    await _context.GiaoVienChiTiets.AddAsync(gvct);
                                }
                                else
                                {
                                    _context.GiaoVienChiTiets.Update(gvct);
                                }
                            }
                            foreach (var hsl in giaoVien.CacHeSoLuongs)
                            {
                                if (hsl.IdHeSoLuong == 0)
                                {
                                    await _context.CacHeSoLuongs.AddAsync(hsl);
                                }
                                else
                                {
                                    _context.CacHeSoLuongs.Update(hsl);
                                }
                            }
                            if (item.CacHeSoLuongs != null)
                            {
                                foreach (var cacHeSoLuong in item.CacHeSoLuongs)
                                {
                                    if (cacHeSoLuong.IdHeSoLuong==0)
                                    {
                                        await _context.CacHeSoLuongs.AddAsync(cacHeSoLuong);
                                    }
                                    else
                                    {
                                        _context.CacHeSoLuongs.Update(cacHeSoLuong);
                                    }
                                }
                            }
                            if (giaoVien.GiaoVienChucVus!=null)
                            {
                                foreach (var giaoVienChucVu in giaoVien.GiaoVienChucVus)
                                {
                                    if (giaoVienChucVu.IdGiaoVienChucVu == 0)
                                    {
                                        await _context.GiaoVienChucVus.AddAsync(giaoVienChucVu);
                                    }
                                    else
                                    {
                                        _context.GiaoVienChucVus.Update(giaoVienChucVu);
                                    }
                                }
                            }
                        }
                    }
                    await _context.SaveChangesAsync();
                    TempData["msg"] = MessageBox.Success("Tạo hoặc cập nhật danh sách giáo viên thành công");
                }
            }
            catch (Exception ex)
            {
                TempData["msg"] = MessageBox.Fail(ex);
            }
            TempData["ViewGiaoViens"] = null;
            return RedirectToAction("Index", "QuanTris", new { Tab = "DanhSachGiaoViensTab" });
        }

    }
}
