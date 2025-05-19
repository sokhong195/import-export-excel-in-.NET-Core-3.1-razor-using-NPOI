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
    [Area("QuanTris")]
    public class LoaiQuyDinhsController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public readonly string model = "Loại quy định";
        public string result = "";
        public string pathView ="CreateOrEdit";

        public LoaiQuyDinhsController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }

        // GET: LoaiQuyDinhs
        public async Task<IActionResult> Index()
        {
            return View(await _context.LoaiQuyDinhs.ToListAsync());
        }


        [HttpGet]
             // GET: LoaiQuyDinhs/Edit/5
        public async Task<IActionResult> CreateOrEdit(int id=0)
        {
            LoaiQuyDinh loaiQuyDinh = null;
            if (id ==0)
            {
                loaiQuyDinh = new LoaiQuyDinh();
            }
            else
            {
                loaiQuyDinh = await _context.LoaiQuyDinhs.FindAsync(id);
                if (loaiQuyDinh == null)
                {
                    return NotFound();
                }
            }
            return View(pathView, loaiQuyDinh);
        }

        // POST: LoaiQuyDinhs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(int id, [Bind("IdLoaiQuyDinh,TenLoaiQuyDinh")] LoaiQuyDinh loaiQuyDinh)
        {
            if (id != loaiQuyDinh.IdLoaiQuyDinh)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (loaiQuyDinh.IdLoaiQuyDinh == 0)
                    {
                        if (Utilities.CheckExist.TenLoaiQuyDinh(loaiQuyDinh.TenLoaiQuyDinh))
                        {
                            result = Utilities.Message.FailDuplicateName(model,loaiQuyDinh.TenLoaiQuyDinh);
                        }
                        else
                        {
                            _context.Add(loaiQuyDinh);
                            result = Utilities.Message.SuccessCreate(model);
                        }
                    }
                    else
                    {
                        _context.Update(loaiQuyDinh);
                        result = Utilities.Message.SuccessEdit(model);
                    }
                    await _context.SaveChangesAsync();
                }
                catch (Exception ex)
                {
                    result = Utilities.Message.Fail(ex);
                }
               return Json(new { isValid = true, href = "LoaiQuyDinhsTab", message = result });
            }
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, pathView, loaiQuyDinh) });
        }
               
        // POST: LoaiQuyDinhs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var loaiQuyDinh = await _context.LoaiQuyDinhs
                    .Include(n=>n.QuyDinhs)
                    .FirstOrDefaultAsync(n=>n.IdLoaiQuyDinh ==id);
                if (loaiQuyDinh.QuyDinhs.Count > 0)
                {
                    result = Utilities.Message.FailDataConstraints("Quy định");
                }
                else
                {
                    _context.LoaiQuyDinhs.Remove(loaiQuyDinh);
                    await _context.SaveChangesAsync();
                    result = Utilities.Message.SuccessDelete(model);
                }
            }
            catch (Exception ex)
            {
                result = Utilities.Message.Fail(ex);
            }
            return Json(new { isValid = true, href = "LoaiQuyDinhsTab", message = result });
        }

      
    }
}
