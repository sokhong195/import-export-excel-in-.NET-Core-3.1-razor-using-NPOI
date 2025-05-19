using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using ImportExcelFIle.DotNETCore.Classes;
using ImportExcelFIle.DotNETCore.Models;
using ImportExcelFIle.DotNETCore.ModelViews;
using ImportExcelFIle.DotNETCore.Utilities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ImportExcelFIle.DotNETCore.Controllers
{
    [Area("QuanTris")]
    public class ChucVusController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public readonly string model = "Chức vụ";
        public string result = "";
        private bool removeSpecialCharacters =true;
        public string pathView =  "CreateOrEdit";

        public ChucVusController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }
        [HttpGet]
        // GET: ChucVus/Edit/5
        public async Task<IActionResult> CreateOrEdit(int id = 0)
        {
            ChucVu ChucVu = null;
            if (id == 0)
            {
                @ViewData["SoDong"] = 0;
                ChucVu = new ChucVu();
                ChucVu.IdChucVu = 0;
                ChucVu.HeSoChucVus = new List<HeSoChucVu>();
            }
            else
            {
                try
                {
                    ChucVu = await _context.ChucVus.
                                       Include(n => n.HeSoChucVus)
                                       .FirstOrDefaultAsync(n => n.IdChucVu == id);
                    @ViewData["SoDong"] = ChucVu.HeSoChucVus.Count();
                }
                catch (Exception ex)
                {

                    throw;
                }
                
                if (ChucVu == null)
                {
                    return NotFound();
                }
            }
            return View(pathView, ChucVu);
        }

        // POST: ChucVus/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(int id, [Bind("IdChucVu,TenChucVu,HeSoChucVus")] ChucVu ChucVu, int SoDong = 0)
        {
            @ViewData["SoDong"] = SoDong;

            if (id != ChucVu.IdChucVu)
            {
                return NotFound();
            }
            if (!string.IsNullOrEmpty( ChucVu.TenChucVu) && CheckExist.TenChucVu(ChucVu.TenChucVu, id))
            {
                ModelState.AddModelError("", "Tên chức vụ đã tồn tại");
            }
            if (ChucVu.HeSoChucVus.Where(n => n.ThoiGianKetThuc == null).Count() > 1)
            {
                ModelState.AddModelError("", @"Mỗi chức vụ chỉ được có 1 giá trị được sử dụng tại thời điểm hiện tại");
            }
            if (ModelState.IsValid)
            {
                try
                {
                    if (ChucVu.IdChucVu == 0)
                    {
                            _context.ChucVus.Add(ChucVu);
                            foreach (var item in ChucVu.HeSoChucVus)
                            {
                                _context.HeSoChucVus.Add(item);
                            }
                            _context.Add(ChucVu);
                        await _context.SaveChangesAsync();
                        result = Utilities.Message.SuccessCreate(model);
                    }
                    else
                    {
                        //Cap nhat bang chi tiet
                        List<int> listIdHeSoChucVu = ChucVu.HeSoChucVus.Select(n => n.IdHeSoChucVu).ToList();
                        List<HeSoChucVu> Xoa = _context.HeSoChucVus.Where(n => !listIdHeSoChucVu.Contains(n.IdHeSoChucVu) && n.IdChucVu == ChucVu.IdChucVu).ToList();
                        //Xoa
                        _context.HeSoChucVus.RemoveRange(Xoa);
                        //Sua  +  Them
                        foreach (var item in ChucVu.HeSoChucVus)
                        {
                            if (item.IdHeSoChucVu == 0)
                            {
                                item.IdChucVu = ChucVu.IdChucVu;
                                _context.HeSoChucVus.Add(item);
                            }
                            else
                            {
                                _context.Update(item);
                            }
                        }
                        _context.Update(ChucVu);
                        result = Message.SuccessEdit(model);
                        await _context.SaveChangesAsync();
                    }
                    await _context.SaveChangesAsync();
                }
                catch (Exception ex)
                {
                    result = Utilities.Message.Fail(ex, removeSpecialCharacters);
                }
                return Json(new { isValid = true, href = "ChucVusTab", message = result });
            }
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, pathView, ChucVu) });
        }

        // POST: ChucVus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var ChucVu = await _context.ChucVus
                    .Include(n => n.HeSoChucVus)
                    .FirstOrDefaultAsync(n => n.IdChucVu == id);
                if (ChucVu==null)
                {
                    result = Message.FailNotExist(model);
                }
                else if (ChucVu.HeSoChucVus.Count > 0)
                {
                    result = Message.FailDataConstraints("Hệ số chức vụ");
                }
                else
                {
                    _context.ChucVus.Remove(ChucVu);
                    await _context.SaveChangesAsync();
                    result = Message.SuccessDelete(model);
                }
            }
            catch (Exception ex)
            {
                result = Message.Fail(ex);
            }
            return Json(new { isValid = true, href = "ChucVusTab", message = result });
        }
    }
}