using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ImportExcelFIle.DotNETCore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ImportExcelFIle.DotNETCore.Controllers
{
    [Area("QuanTris")]
    public class PhongTrungTamsController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public readonly string model = "Phòng Trung tâm";
        public string result = "";
        private bool removeSpecialCharacters = true;
        public string pathView =  "CreateOrEdit";

        public PhongTrungTamsController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }
        [HttpGet]
        // GET: PhongTrungTams/Edit/5
        public async Task<IActionResult> CreateOrEdit(int id = 0)
        {
            PhongTrungTam PhongTrungTam = null;
            if (id == 0)
            {
                PhongTrungTam = new PhongTrungTam();
                PhongTrungTam.IdPhongTrungTam = 0;
            }
            else
            {
                PhongTrungTam = await _context.PhongTrungTams
                                       .FirstOrDefaultAsync(n => n.IdPhongTrungTam == id);
                if (PhongTrungTam == null)
                {
                    return NotFound();
                }
            }
            return View(pathView, PhongTrungTam);
        }

        // POST: PhongTrungTams/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(int id, [Bind("IdPhongTrungTam,TenPhongTrungTam")] PhongTrungTam PhongTrungTam)
        {

            if (id != PhongTrungTam.IdPhongTrungTam)
            {
                return NotFound();
            }
            if (Utilities.CheckExist.TenPhongTrungTam(PhongTrungTam.TenPhongTrungTam, id))
            {
                ModelState.AddModelError("", "Tên "+model+" đã tồn tại");
            }
            
            if (ModelState.IsValid)
            {
                try
                {


                    if (PhongTrungTam.IdPhongTrungTam == 0)
                    {
                        _context.PhongTrungTams.Add(PhongTrungTam);
                        await _context.SaveChangesAsync();
                        result = Utilities.Message.SuccessCreate(model);
                    }
                    else
                    {
                        _context.Update(PhongTrungTam);
                        result = Utilities.Message.SuccessEdit(model);
                        await _context.SaveChangesAsync();
                    }
                    await _context.SaveChangesAsync();
                }
                catch (Exception ex)
                {
                    result = Utilities.Message.Fail(ex, removeSpecialCharacters);
                }
                return Json(new { isValid = true, href = "PhongTrungTamsTab", message = result });
            }
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, pathView, PhongTrungTam) });
        }

        // POST: PhongTrungTams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var PhongTrungTam = await _context.PhongTrungTams
                    .Include(n => n.GiaoVienChiTiets)
                    .FirstOrDefaultAsync(n => n.IdPhongTrungTam == id);
                if (PhongTrungTam.GiaoVienChiTiets.Count > 0)
                {
                    result = Utilities.Message.FailDataConstraints(model + " với giáo viên chi tiết");
                }
                else
                {
                    _context.PhongTrungTams.Remove(PhongTrungTam);
                    await _context.SaveChangesAsync();
                    result = Utilities.Message.SuccessDelete(model);
                }
            }
            catch (Exception ex)
            {
                result = Utilities.Message.Fail(ex);
            }
            return Json(new { isValid = true, href = "PhongTrungTamsTab", message = result });
        }
    }
}