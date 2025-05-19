using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.Models;

namespace ImportExcelFIle.DotNETCore.Controllers
{
    public class HocKiesController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public readonly string model = "Học kỳ";
        public string result = "";

        public HocKiesController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }

        // GET: HocKies
        public async Task<IActionResult> Index()
        {
            return View(await _context.HocKies.ToListAsync());
        }

        [HttpGet]
        // GET: HocKies/Edit/5
        public async Task<IActionResult> CreateOrEdit(int id = 0)
        {
            HocKy HocKy = null;
            if (id == 0)
            {
                HocKy = new HocKy();
            }
            else
            {
                HocKy = await _context.HocKies.FindAsync(id);
                if (HocKy == null)
                {
                    return NotFound();
                }
            }
            return View("CreateOrEdit", HocKy);
        }

        // POST: HocKies/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(int id, [Bind("IdHocKy,TenHocKy")] HocKy HocKy)
        {
            if (id != HocKy.IdHocKy)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (HocKy.IdHocKy == 0)
                    {
                        if (Utilities.CheckExist.TenHocKy(HocKy.TenHocKy))
                        {
                            result = Utilities.Message.FailDuplicateName(model, HocKy.TenHocKy);
                        }
                        else
                        {
                            _context.Add(HocKy);
                            result = Utilities.Message.SuccessCreate(model);
                        }
                    }
                    else
                    {
                        _context.Update(HocKy);
                        result = Utilities.Message.SuccessEdit(model);
                    }
                    await _context.SaveChangesAsync();
                }
                catch (Exception ex)
                {
                    result = Utilities.Message.Fail(ex);
                }
                return Json(new { isValid = true, href = "HocKiesTab", message = result });
            }
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, "CreateOrEdit", HocKy) });
        }

        // POST: HocKies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var HocKy = await _context.HocKies
                    .Include(n => n.NamHocHocKies)
                    .FirstOrDefaultAsync(n => n.IdHocKy == id);
                if (HocKy.NamHocHocKies.Count > 0)
                {
                    result = Utilities.Message.FailDataConstraints("Năm học học kỳ");
                }
                else
                {
                    _context.HocKies.Remove(HocKy);
                    await _context.SaveChangesAsync();
                    result = Utilities.Message.SuccessDelete(model);
                }
            }
            catch (Exception ex)
            {
                result = Utilities.Message.Fail(ex);
            }
            return Json(new { isValid = true, href = "HocKiesTab", message = result });
        }
    }
}
