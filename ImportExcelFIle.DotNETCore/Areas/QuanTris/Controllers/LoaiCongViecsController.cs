using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ImportExcelFIle.DotNETCore.Models;
using ImportExcelFIle.DotNETCore.Utilities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace ImportExcelFIle.DotNETCore.Controllers
{
    [Area("QuanTris")]

    public class LoaiCongViecsController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public readonly string model = "Loại công việc";
        public string result = "";
        public bool removeSpecialCharacters = true;
        public string pathView = "CreateOrEdit";
        public LoaiCongViecsController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }

        // GET: LoaiCongViecs
        public async Task<IActionResult> Index()
        {
            return View(await _context.LoaiCongViecs.ToListAsync());
        }


        [HttpGet]
        // GET: LoaiCongViecs/Edit/5
        public async Task<IActionResult> CreateOrEdit(int id = 0)
        {
            LoaiCongViec LoaiCongViec = null;
            try
            {
                if (id == 0)
                {
                    LoaiCongViec = new LoaiCongViec();
                }
                else
                {
                    LoaiCongViec = await _context.LoaiCongViecs
                        .FirstOrDefaultAsync(n => n.IdLoaiCongViec == id);
                    if (LoaiCongViec == null)
                    {
                        return NotFound();
                    }
                }
            }
            catch (Exception ex)
            {
                return NotFound(Message.Fail(ex));
            }
            return View(pathView, LoaiCongViec);
        }

        // POST: LoaiCongViecs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(int id, [Bind("IdLoaiCongViec", "TenLoaiCongViec")] LoaiCongViec LoaiCongViec)
        {

            if (id != LoaiCongViec.IdLoaiCongViec)
            {
                return NotFound();
            }
            if (CheckExist.TenLoaiCongViec(LoaiCongViec.TenLoaiCongViec, id))
            {
                ModelState.AddModelError("TenLoaiCongViec", "Tên "+model+" đã tồn tại");
            }
            if (ModelState.IsValid)
            {
                try
                {
                    if (LoaiCongViec.IdLoaiCongViec == 0)
                    {
                        _context.LoaiCongViecs.Add(LoaiCongViec);
                        await _context.SaveChangesAsync();
                        result = Message.SuccessCreate(model);
                    }
                    else
                    {
                        _context.Update(LoaiCongViec);
                        result = Message.SuccessEdit(model);
                        await _context.SaveChangesAsync();
                    }
                }
                catch (Exception ex)
                {
                    result = Message.Fail(ex, removeSpecialCharacters);
                }
                return Json(new { isValid = true, href = "LoaiCongViecsTab", message = result });
            }
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, pathView, LoaiCongViec) });
        }

        // POST: LoaiCongViecs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var LoaiCongViec = await _context.LoaiCongViecs
                    .Include(n => n.GiaoVienChiTiets)
                    .FirstOrDefaultAsync(n => n.IdLoaiCongViec == id);
                if (LoaiCongViec.GiaoVienChiTiets.Count > 0)
                {
                    result = Message.FailDataConstraints(model + " với giáo viên chi tiết");
                }
                else
                {
                    _context.LoaiCongViecs.Remove(LoaiCongViec);
                    await _context.SaveChangesAsync();
                    result = Message.SuccessDelete(model);
                }
            }
            catch (Exception ex)
            {
                result = Message.Fail(ex, removeSpecialCharacters);
            }
            return Json(new { isValid = true, href = "LoaiCongViecsTab", message = result });
        }
           }
}