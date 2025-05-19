using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.Models;
using Newtonsoft.Json;
using ImportExcelFIle.DotNETCore.Utilities;

namespace ImportExcelFIle.DotNETCore.Controllers
{
    public class KhoasController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        string result = "";
        string model = "Khoa";
        bool removeSpecialCharacters = true;
        public KhoasController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }

        // GET: Khoas1
        public async Task<IActionResult> Index()
        {
            return View(await _context.Khoas.Include(x => x.BoMons).ToListAsync());
        }

       
        [HttpGet]
        // GET: Khoas/Edit/5
        public async Task<IActionResult> CreateOrEdit(string id = "")
        {
            Khoa Khoa = null;
            try
            {
                if (id == "")
                {
                    @ViewData["SoDong"] = 0;
                    @ViewData["Mode"] = 0;
                    Khoa = new Khoa();
                    Khoa.IdKhoa = "00";
                    Khoa.ThoiGianBatDau = DateTime.Now;
                    Khoa.BoMons = new List<BoMon>();
                }
                else
                {
                    @ViewData["Mode"] = 1;
                    Khoa = await _context.Khoas.
                        Include(n => n.BoMons)
                        .FirstOrDefaultAsync(n => n.IdKhoa == id);
                    @ViewData["SoDong"] = Khoa.BoMons.Count();
                    if (Khoa == null)
                    {
                        return NotFound();
                    }
                }
            }
            catch (Exception ex)
            {
                return NotFound(Message.Fail(ex));
            }
           
            return View("CreateOrEdit", Khoa);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(string Id, [Bind("IdKhoa", "TenKhoa","ThoiGianBatDau","ThoiGianKetThuc", "BoMons")] Khoa Khoa, int SoDong = 0, int Mode = 0)
        {
            @ViewData["SoDong"] = SoDong;
            @ViewData["Mode"] = Mode;
            if (Id != Khoa.IdKhoa && Mode ==1)
            {
                return NotFound();
            }
            if (Mode==0)//tạo
            {
                if (CheckExist.TrungKhoaTaoMoi(Khoa.TenKhoa, Khoa.IdKhoa))
                {
                    ModelState.AddModelError("", "Tên khoa hoặc mã khoa đã tồn tại");
                }
            }
            else
            {
                if (CheckExist.TrungKhoaSua(Khoa.TenKhoa, Khoa.IdKhoa))
                {
                    ModelState.AddModelError("", "Tên khoa đã tồn tại");
                }
            }
            if (ModelState.IsValid)
            {
                try
                {
                    if (Mode==0)
                    {
                        _context.Add(Khoa);
                        string idKhoa = Khoa.IdKhoa;
                        foreach (var item in Khoa.BoMons)
                        {
                            item.IdKhoa = idKhoa;
                            _context.BoMons.Add(item);
                        }
                        await _context.SaveChangesAsync();
                        result = Message.SuccessCreate(model);
                    }
                    else
                    {
                        //Cap nhat bang chi tiet
                        List<int> listIdKhoaChiTiet = Khoa.BoMons.Select(n => n.IdBoMon).ToList();
                        List<BoMon> Xoa = _context.BoMons.Where(n => !listIdKhoaChiTiet.Contains(n.IdBoMon) && n.IdKhoa == Khoa.IdKhoa).ToList();
                        //Xoa
                        _context.BoMons.RemoveRange(Xoa);
                        //Sua  +  Them
                        foreach (var item in Khoa.BoMons)
                        {
                            if (item.IdBoMon == 0)
                            {
                                item.IdKhoa = Khoa.IdKhoa;
                                _context.BoMons.Add(item);
                            }
                            else
                            {
                                _context.Update(item);
                            }
                        }
                        _context.Update(Khoa);
                        result = Message.SuccessEdit(model);
                        await _context.SaveChangesAsync();
                    }
                }
                catch (Exception ex)
                {
                    result = Message.Fail(ex, removeSpecialCharacters);
                }
                return Json(new { isValid = true,  message = result });
            }
            
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, "CreateOrEdit", Khoa) });
        }
        
      
        // POST: Khoas1/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            try
            {
                if (id.Length == 1) id = "0" + id;
                var Khoa = await _context.Khoas.Include(n=>n.BoMons).Where(n=>n.IdKhoa == id).FirstOrDefaultAsync();
                if( Khoa !=null && Khoa.BoMons.Count==0)
                {
                    _context.Khoas.Remove(Khoa);
                    await _context.SaveChangesAsync();
                    result = Message.SuccessDelete(model);
                }
                else if (Khoa.BoMons.Count > 0)
                {
                    result = Message.FailDataConstraints("Bộ môn");
                }
            }
            catch (Exception ex)
            {
                result = Message.Fail(ex);
            }         
            return Json( new { message = result });
        }

        
    }
}
