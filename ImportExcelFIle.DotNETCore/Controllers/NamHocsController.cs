using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.Models;
using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace ImportExcelFIle.DotNETCore.Controllers
{
    public class NamHocsController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;

        public NamHocsController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }

        // GET: NamHocs
        public async Task<IActionResult> Index()
        {
            return View(await _context.NamHocs.ToListAsync());
        }

        // GET: NamHocs/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var NamHoc = await _context.NamHocs
                .FirstOrDefaultAsync(m => m.IdNamHoc == id);
            if (NamHoc == null)
            {
                return NotFound();
            }

            return View(NamHoc);
        }

        // GET: NamHocs/Create
        public IActionResult Create()
        {
            ViewNamHocHocKys viewNamHocHocKys = new ViewNamHocHocKys();
            List<HocKy> hocKies = _context.HocKies.ToList();
            foreach(HocKy hocKy in hocKies)
            {
                viewNamHocHocKys.hocKies.Add(hocKy);
                viewNamHocHocKys.thoiGianBatDaus.Add(null);
                viewNamHocHocKys.thoiGianKetThucs.Add(null);
            }
            return View(viewNamHocHocKys);
        }

        // POST: NamHocs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("namHoc", "hocKies","thoiGianBatDaus","thoiGianKetThucs")]ViewNamHocHocKys viewNamHocHocKys)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _context.NamHocs.Add(viewNamHocHocKys.namHoc);
                    await _context.SaveChangesAsync();
                    _context.Entry(viewNamHocHocKys.namHoc).GetDatabaseValues();

                    int IdNamHoc = viewNamHocHocKys.namHoc.IdNamHoc;
                    for (int i = 0; i < viewNamHocHocKys.hocKies.Count; i++)
                    {
                        NamHocHocKy namHocHocKy = new NamHocHocKy();
                        namHocHocKy.IdHocKy = viewNamHocHocKys.hocKies[i].IdHocKy;
                        namHocHocKy.IdNamHoc = IdNamHoc;
                        namHocHocKy.ThoiGianBatDau = (DateTime)viewNamHocHocKys.thoiGianBatDaus[i];
                        namHocHocKy.ThoiGianKetThuc = (DateTime)viewNamHocHocKys.thoiGianKetThucs[i];
                        namHocHocKy.SoTuan = 44;
                        _context.NamHocHocKies.Add(namHocHocKy);
                    }
                    await _context.SaveChangesAsync();
                    return RedirectToAction(nameof(Index), "Trainning", new { Tab = "NamHocsTab" });
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("Loi", ex.InnerException.Message);
                    ;
                }
            }
            return View(viewNamHocHocKys);
        }

        // GET: NamHocs/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var namHoc = await _context.NamHocs.Include(x=>x.NamHocHocKies).Where(x=>x.IdNamHoc == id).FirstAsync();
            ViewNamHocHocKys viewNamHocHocKys = new ViewNamHocHocKys();
            viewNamHocHocKys.namHoc = namHoc;
           var query = viewNamHocHocKys.namHoc.NamHocHocKies.Join(
                _context.HocKies,
                p => p.IdHocKy,
                q => q.IdHocKy,
                (p, q) => new
                {
                    q
                }
                ).ToList();
            if (namHoc == null)
            {
                return NotFound();
            }
            for (int i = 0; i < query.Count; i++)
            {
                viewNamHocHocKys.hocKies.Add(new HocKy { IdHocKy = query[i].q.IdHocKy, TenHocKy = query[i].q.TenHocKy });
                viewNamHocHocKys.thoiGianBatDaus.Add(namHoc.NamHocHocKies.ElementAt(i).ThoiGianBatDau);
                viewNamHocHocKys.thoiGianKetThucs.Add(namHoc.NamHocHocKies.ElementAt(i).ThoiGianKetThuc);
            }
            return View(viewNamHocHocKys);
        }

        // POST: NamHocs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("namHoc", "hocKies", "thoiGianBatDaus", "thoiGianKetThucs")] ViewNamHocHocKys viewNamHocHocKys)
        {
            if (id != viewNamHocHocKys.namHoc.IdNamHoc)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    NamHoc namHoc = await _context.NamHocs.Include(x => x.NamHocHocKies).Where(x => x.IdNamHoc == id).FirstOrDefaultAsync();
                    namHoc.TenNamHoc = viewNamHocHocKys.namHoc.TenNamHoc;
                    for (int i = 0; i < viewNamHocHocKys.hocKies.Count; i++)
                    {
                        namHoc.NamHocHocKies.ElementAt(i).ThoiGianBatDau = (DateTime)viewNamHocHocKys.thoiGianBatDaus[i];
                        namHoc.NamHocHocKies.ElementAt(i).ThoiGianKetThuc = (DateTime)viewNamHocHocKys.thoiGianKetThucs[i];
                    }
                    _context.Update(namHoc);
                    await _context.SaveChangesAsync();
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("Loi",ex.InnerException.Message);
                }
                return RedirectToAction(nameof(Index), "Trainning", new { Tab = "NamHocsTab" });
            }
            return View(viewNamHocHocKys);
        }

        // GET: NamHocs/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var NamHoc = await _context.NamHocs
                .FirstOrDefaultAsync(m => m.IdNamHoc == id);
            if (NamHoc == null)
            {
                return NotFound();
            }

            return View(NamHoc);
        }

        // POST: NamHocs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var NamHoc = await _context.NamHocs.FindAsync(id);

            try
            {
                _context.NamHocs.Remove(NamHoc);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index), "Trainning", new { Tab = "NamHocsTab" });
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.InnerException.Message);
            }
            return View(NamHoc);
        }

        private bool NamHocExists(int id)
        {
            return _context.NamHocs.Any(e => e.IdNamHoc == id);
        }
    }
}
