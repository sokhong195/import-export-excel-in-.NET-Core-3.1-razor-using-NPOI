using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.Models;
using AutoMapper;
using ImportExcelFIle.DotNETCore.ModelViews;
using ImportExcelFIle.DotNETCore.Classes;
using ImportExcelFIle.DotNETCore.Utilities;

namespace ImportExcelFIle.DotNETCore.Controllers
{
    public class BaoGioGiangDayChiTietsController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        private IMapper mapper;
        string result = "";
        public BaoGioGiangDayChiTietsController(dbPhanCongThanhToanContext context)
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile(new AutoMapperProfile());
            });
            mapper = config.CreateMapper();
            _context = context;
            
        }

        // GET: BaoGioGiangDayChiTiets
        public async Task<IActionResult> Index()
        {
            var dbPhanCongThanhToanContext = await _context.BaoGioGiangDayChiTiets.ToListAsync();
            return View(dbPhanCongThanhToanContext);
        }

        [HttpGet]
        // GET: BaoGioGiangDayChiTiets/CreateOrEdit
        public async Task<IActionResult> CreateOrEdit(int? id, int? IdBaoGioGiangDay)
        {
            if (id == null)
            {
                return NotFound();
            }
            ViewBaoGioGiangDayChiTiet viewBaoGioGiangDayChiTiet = new ViewBaoGioGiangDayChiTiet(); 
            if (id == 0)
            {
                viewBaoGioGiangDayChiTiet.IdBaoGioGiangDay = (int)IdBaoGioGiangDay;
                ViewData["IdHocPhan"] = await Utilities.GetList.MaHocPhan(0);
            }
            else
            {
                viewBaoGioGiangDayChiTiet = await Utilities.GetModel.ViewBaoGioGiangDayChiTiet(id);
                if (viewBaoGioGiangDayChiTiet == null)
                {
                    return NotFound();
                }
                ViewData["IdHocPhan"] = await Utilities.GetList.MaHocPhan(viewBaoGioGiangDayChiTiet.IdHocPhan);
            }
            return View("CreateOrEdit", viewBaoGioGiangDayChiTiet);
        }

        // POST: BaoGioGiangDayChiTiets/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(int? id, [Bind("IdBaoGioGiangDayChiTiet,TenLopHocPhan,SiSo,SoNhom,GhiChu,IdBaoGioGiangDay,IdHocPhan")] ViewBaoGioGiangDayChiTiet viewBaoGioGiangDayChiTiet)
        {
            if (id == null)
            {
                return NotFound();
            }
            if (ModelState.IsValid)
            {
                try
                {
                    var baoGioGiangDayChiTiet  = mapper.Map<BaoGioGiangDayChiTiet>(viewBaoGioGiangDayChiTiet);
                    if (baoGioGiangDayChiTiet.IdBaoGioGiangDayChiTiet == 0)
                    {
                        _context.Add(baoGioGiangDayChiTiet);
                        await _context.SaveChangesAsync();
                        return Json(new { isValid = true, message = Utilities.Message.SuccessEdit("Lớp học phần") });
                    }
                    else
                    {
                        _context.Update(baoGioGiangDayChiTiet);
                        await _context.SaveChangesAsync();
                        return Json(new { isValid = true, message = Utilities.Message.SuccessEdit("Lớp học phần") });
                    }
                }
                catch (Exception ex)
                {
                    ViewData["IdHocPhan"] = await Utilities.GetList.MaHocPhan(viewBaoGioGiangDayChiTiet.IdHocPhan);
                    return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, "CreateOrEdit", viewBaoGioGiangDayChiTiet) , message = Utilities.Message.Fail(ex)});
                }
            }
            ViewData["IdHocPhan"] = await Utilities.GetList.MaHocPhan(viewBaoGioGiangDayChiTiet.IdHocPhan);
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, "CreateOrEdit", viewBaoGioGiangDayChiTiet) });
        }

        // GET: BaoGioGiangDayChiTiets/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var BaoGioGiangDayChiTiet = await _context.BaoGioGiangDayChiTiets
                .Include(t => t.IdBaoGioGiangDayNavigation)
                .FirstOrDefaultAsync(m => m.IdBaoGioGiangDayChiTiet == id);
            if (BaoGioGiangDayChiTiet == null)
            {
                return NotFound();
            }

            return View(BaoGioGiangDayChiTiet);
        }

        // POST: BaoGioGiangDayChiTiets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var BaoGioGiangDayChiTiet = await _context.BaoGioGiangDayChiTiets.FindAsync(id);
                _context.BaoGioGiangDayChiTiets.Remove(BaoGioGiangDayChiTiet);
                await _context.SaveChangesAsync();
                result = Message.SuccessDelete("Lớp học phần");
            }
            catch (Exception ex)
            {
                result = Message.Fail(ex);
            }
            return Json(new { message = result });
        }
    }
}
