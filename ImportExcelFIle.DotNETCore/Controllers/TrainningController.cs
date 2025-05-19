using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ImportExcelFIle.DotNETCore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace ImportExcelFIle.DotNETCore.Controllers
{
    public class TrainningController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public TrainningController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }

        public IActionResult Index(string Tab)
        {
            ViewData["Tab"] = Tab;
            return View();
        }
        public PartialViewResult NamHocs()
        {
            ViewData["IdNamHocs"] = new
                SelectList(_context.NamHocs
                .OrderByDescending(a => a.TenNamHoc), "IdNamHoc", "TenNamHoc");
            return PartialView("_NamHocs");
        }
        public PartialViewResult HocKies()
        {
            ViewData["IdHocKies"] = new
                SelectList(_context.HocKies
                .OrderByDescending(a => a.TenHocKy), "IdHocKy", "TenHocKy");
            return PartialView("_HocKies");
        }
        public PartialViewResult BaoGioGiangDays()
        {
            ViewData["IdBaoGioGiangDays"] = new
                SelectList(_context.BaoGioGiangDays
                .OrderByDescending(a => a.ThoiGianBatDau).Where(n=>n.IdBaoGioGiangDay !=0), "IdBaoGioGiangDay", "TenPhanCongGiangDay");
            return PartialView("_BaoGioGiangDays");
        }
        public PartialViewResult LoaiQuyDinhs()
        {
            ViewData["IdLoaiQuyDinhs"] = new
                SelectList(_context.LoaiQuyDinhs
                .OrderByDescending(a => a.TenLoaiQuyDinh), "IdLoaiQuyDinh", "TenLoaiQuyDinh");
            return PartialView("_LoaiQuyDinhs");
        }
        public PartialViewResult QuyDinhs()
        {
            ViewData["IdQuyDinhs"] = new
                SelectList(_context.QuyDinhs
                .OrderByDescending(a => a.TenQuyDinh), "IdQuyDinh", "TenQuyDinh");
            return PartialView("_QuyDinhs");
        }
    }
}