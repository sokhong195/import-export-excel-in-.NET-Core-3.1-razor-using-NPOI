using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.Models;
using Newtonsoft.Json;

namespace ImportExcelFIle.DotNETCore.Controllers
{
    public class BoMonsController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;

        public BoMonsController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }

        // GET: BoMons
        public async Task<IActionResult> Index()
        {
            var dbPhanCongThanhToanContext = _context.BoMons.Include(t => t.IdKhoaNavigation);
            return View(await dbPhanCongThanhToanContext.ToListAsync());
        }
        [HttpGet]
        public async Task<JsonResult> GetBoMons(string IdKhoa)
        {
            var list = await Utilities.GetList.BoMonSelectList(IdKhoa, null);
            return Json(list);
        }
       
        // GET: BoMons/Create
        public IActionResult Create(string IdKhoa,int Id =0)
        {
            BoMon BoMon = new BoMon();
            if (Id == 0)
            {
                if (IdKhoa.Length == 1) IdKhoa = "0" + IdKhoa;               
                BoMon.IdKhoa = IdKhoa;
                BoMon.ThoiGianBatDau = DateTime.Now;
                ViewData["IdKhoa"] = new SelectList(_context.Khoas, "IdKhoa", "TenKhoa", IdKhoa);                
            }
            return View("Create", BoMon);
        }
        public async Task<IActionResult> ThemHoacSua(string IdKhoa, int Id = 0)
        {
            BoMon BoMon = new BoMon();
            if (Id == 0)
            {
                if (IdKhoa != null)
                {
                    ViewData["IdKhoa"] = new SelectList(_context.Khoas, "IdKhoa", "TenKhoa", IdKhoa);
                    BoMon.ThoiGianBatDau = DateTime.Now;
                }
                else
                {
                    if (IdKhoa.Length == 1) IdKhoa = "0" + IdKhoa;
                    BoMon.IdKhoa = IdKhoa;
                    BoMon.ThoiGianBatDau = DateTime.Now;
                    ViewData["IdKhoa"] = new SelectList(_context.Khoas, "IdKhoa", "TenKhoa", IdKhoa);
                }
            }
            else
            {
                BoMon = await _context.BoMons.Where(n => n.IdBoMon == Id).FirstOrDefaultAsync();
                if (BoMon == null)
                {
                    return NotFound();
                }
                ViewData["IdKhoa"] = new SelectList(_context.Khoas, "IdKhoa", "TenKhoa", BoMon.IdKhoa);
            }
            return View("ThemHoacSua", BoMon);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ThemHoacSua(int id, [Bind("IdBoMon,IdKhoa,TenBoMon,ThoiGianBatDau,ThoiGianKetThuc")] BoMon bomon)
        {
            string result = "Lỗi: ";
            if (ModelState.IsValid)
            {
                //Insert
                if (id == 0)
                {
                    _context.Add(bomon);
                    await _context.SaveChangesAsync();
                    result = "Thêm mới bộ môn thành công";
                }
                //Update
                else
                {
                    try
                    {
                        _context.Update(bomon);
                        await _context.SaveChangesAsync();
                        result = "Cập nhật bộ môn thành công";
                    }
                    catch (DbUpdateConcurrencyException)
                    {
                        if (!BoMonExists(bomon.IdBoMon))
                        {
                            result += "Không tìm thấy bộ môn";
                        }
                        else
                        { 
                            throw; 
                        }
                    }
                }
                JsonResult json = Json(new { isValid = true,message=result});
                return json;
            }
            ViewData["IdKhoa"] = new SelectList(_context.Khoas, "IdKhoa", "TenKhoa", bomon.IdKhoa);
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, "ThemHoacSua", bomon) });
        }


        [HttpPost]
        public async Task<IActionResult> Create([FromBody] Object ob)
        {
            string result = "Lỗi: ";
            if (ModelState.IsValid)
            {                
                try
                {
                    BoMon BoMon = JsonConvert.DeserializeObject<BoMon>(ob.ToString());
                    if (BoMon != null)
                    {
                        _context.BoMons.Add(BoMon);
                        await _context.SaveChangesAsync();
                        result = "Tạo bộ môn mới thành công!";
                    }
                   
                }
                catch (Exception ex)
                {
                    result += ex.Message;
                }                
            }
            return Json(result);
        }

        // GET: BoMons/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var BoMon = await _context.BoMons.Where(n=>n.IdBoMon == id).FirstOrDefaultAsync();
            if (BoMon == null)
            {
                return NotFound();
            }
            ViewData["IdKhoa"] = new SelectList(_context.Khoas, "IdKhoa", "TenKhoa", BoMon.IdKhoa);
            return PartialView("Edit",BoMon);
        }

        // POST: BoMons/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public async Task<IActionResult> Edit([FromBody]object ob)
        {
            BoMon BoMon = JsonConvert.DeserializeObject<BoMon>(ob.ToString());
            string result = "Lỗi: ";
            if (ModelState.IsValid)
            {
                try
                {
                    if (BoMon!=null && BoMonExists(BoMon.IdBoMon))
                    {
                        _context.BoMons.Update(BoMon);
                        await _context.SaveChangesAsync();
                    }
                    result = "Cập nhật bộ môn thành công";
                }
                catch (Exception ex)
                {
                    result += ex.InnerException.Message;
                }
            }
            return Json(result);
        }

      

        // POST: BoMons/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            string result = "Lỗi xóa! ";
            try
            {
                var BoMon = await _context.BoMons.FindAsync(id);
                _context.BoMons.Remove(BoMon);
                await _context.SaveChangesAsync();
                result = "Xóa dữ liệu khoa thành công!";
            }
            catch (Exception ex)
            { 
                result += Utilities.Message.Fail(ex);
            }
            return Json(new{message=result});
        }

        private bool BoMonExists(int id)
        {
            return _context.BoMons.Any(e => e.IdBoMon == id);
        }
    }
}
