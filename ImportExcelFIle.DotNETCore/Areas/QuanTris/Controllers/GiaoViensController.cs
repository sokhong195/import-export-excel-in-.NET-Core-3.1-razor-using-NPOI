using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.Models;
using ImportExcelFIle.DotNETCore.Utilities;

namespace ImportExcelFIle.DotNETCore.Areas.QuanTris.Controllers
{
    [Area("QuanTris")]
    public class GiaoViensController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public readonly string model = "Giáo viên";
        public string result = "";
        public string pathView = "CreateOrEdit";
        public GiaoViensController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }

        // GET: QuanTris/GiaoViens/Create
        public IActionResult CreateOrEdit(int IdGiaoVien = 0)
        {
            ViewData["IdNguoiDung"] = new SelectList(_context.NguoiDungs, "IdNguoiDung", "Email");
            return View();
        }

        // POST: QuanTris/GiaoViens/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
       
        // POST: QuanTris/GiaoViens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var giaoVien = await _context.GiaoViens.FindAsync(id);
            _context.GiaoViens.Remove(giaoVien);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool GiaoVienExists(int id)
        {
            return _context.GiaoViens.Any(e => e.IdGiaoVien == id);
        }
    }
}
