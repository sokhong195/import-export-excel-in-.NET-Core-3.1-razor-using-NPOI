using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.Models;
using ImportExcelFIle.DotNETCore.Utilities;
using ImportExcelFIle.DotNETCore.ModelViews;
using Newtonsoft.Json;
using ImportExcelFIle.DotNETCore.Classes;
using Newtonsoft.Json.Linq;
using Microsoft.AspNetCore.Hosting;

namespace ImportExcelFIle.DotNETCore.Controllers
{
    public class PhanCongGiangDaysController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        private string result = "";

        public PhanCongGiangDaysController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }
 
       
        public async Task< IActionResult> GetData()
        {
            try
            {
                var draw = Request.Form["draw"].FirstOrDefault();
                var start = Request.Form["start"].FirstOrDefault();
                var length = Request.Form["length"].FirstOrDefault();
                var sortColumn = Request.Form["columns[" + Request.Form["order[0][column]"].FirstOrDefault() + "][name]"].FirstOrDefault();
                var sortColumnDirection = Request.Form["order[0][dir]"].FirstOrDefault();
                var searchValue = Request.Form["search[value]"].FirstOrDefault();
                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                int skip = start != null ? Convert.ToInt32(start) : 0;
                int recordsTotal = 0;
                var viewPhanCongGiangDays = await GetList.ViewPhanCongGiangDays(0);

                if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDirection)))
                {
                    if (sortColumn == "Tên lớp học phần")
                    {
                        if (sortColumnDirection=="asc")
                        {
                            viewPhanCongGiangDays = viewPhanCongGiangDays.OrderBy(n => n.ViewBaoGioGiangDayChiTiet.TenLopHocPhan).ToList();

                        }
                        else
                        {
                            viewPhanCongGiangDays = viewPhanCongGiangDays.OrderByDescending(n => n.ViewBaoGioGiangDayChiTiet.TenLopHocPhan).ToList();
                        }
                    }
                }
                if (!string.IsNullOrEmpty(searchValue))
                {
                    viewPhanCongGiangDays = viewPhanCongGiangDays.Where(m => m.ViewBaoGioGiangDayChiTiet.TenLopHocPhan.Contains(searchValue)).ToList();
                }
                recordsTotal = viewPhanCongGiangDays.Count();
                var data = viewPhanCongGiangDays.Skip(skip).Take(pageSize).ToList();
                var jsonData = new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = JsonConvert.SerializeObject ( data)};
                return Json( jsonData);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [HttpGet]
        // GET: PhanCongGiangDays
        public async Task<IActionResult> Index(int? IdBoMon, int? page, int? pageSizeID, string SearchString, string actionButton, string IdKhoa = "05", int? IdBaoGioGiangDay = 6, int? IdNamHocHocKy = 12, int? IdGiaoVien = 0, string sortDirection = "desc", string sortField = "Tên lớp học phần")
        {
            ViewData["IdKhoa"] = await GetList.KhoaSelectList(IdKhoa);
            ViewData["IdBoMon"] = await GetList.BoMonSelectList(IdKhoa, IdBoMon);
            ViewData["IdNamHocHocKy"] = GetList.NamHocHocKySelectList(IdNamHocHocKy, DateTime.Now);
            ViewData["IdBaoGioGiangDay"] = await GetList.BaoGioGiangDaySelectList(IdNamHocHocKy, IdBaoGioGiangDay);
            ViewData["IdGiaoVien"] = await GetList.GiaoVienSelectList(IdKhoa, IdBoMon, IdGiaoVien, DateTime.Now, false);
            ViewData["sortField"] = sortField;
            ViewData["sortDirection"] = sortDirection;
            if (IdBaoGioGiangDay == null)
            {
                ViewData["pageSizeID"] =
                    new SelectList(new[] { "10", "20", "30", "40", "50", "100", "500" }, 20.ToString());
                @ViewData["SoMon"] = 0;
                return View("Index", null);
            }
            List<ViewPhanCongGiangDay> viewPhanCongGiangDays = await  GetList.ViewPhanCongGiangDays(IdBaoGioGiangDay);

            if (viewPhanCongGiangDays == null)
            {
                return NotFound();
            }
            ViewData["Filtering"] = "btn-outline-dark";
            //Get the URL with the last filter, sort and page parameters from the Patients Index View
            ViewData["returnURL"] = MaintainURL.ReturnURL(HttpContext, "PhanCongGiangDays");

            //Clear the sort/filter/paging URL Cookie for Patient Appointments Master/Details
            CookieHelper.CookieSet(HttpContext, "PhanCongGiangDaysChiTiet", "", -1);

            if (!String.IsNullOrEmpty(IdKhoa))
            {
                viewPhanCongGiangDays = viewPhanCongGiangDays.Where(p => p.ViewBaoGioGiangDayChiTiet.IdKhoa == IdKhoa).ToList();
                ViewData["Filtering"] = "btn-danger";
            }
            if (!String.IsNullOrEmpty(SearchString))
            {
                viewPhanCongGiangDays = viewPhanCongGiangDays.Where(p => p.ViewBaoGioGiangDayChiTiet.TenLopHocPhan.ToUpper().Contains(SearchString.ToUpper())).ToList();
                ViewData["Filtering"] = "btn-danger";
            }

            ViewData["TongSoMon"] = viewPhanCongGiangDays.Count();
            //Before we sort, see if we have called for a change of filtering or sorting
            if (!String.IsNullOrEmpty(actionButton)) //Form Submitted so lets sort!
            {
                page = 1;//Reset back to first page when sorting or filtering

                if (actionButton == "Tên lớp học phần")//Change of sort is requested
                {
                    if (actionButton == sortField) //Reverse order on same field
                    {
                        sortDirection = sortDirection == "asc" ? "desc" : "asc";
                    }
                    sortField = actionButton;//Sort by the button clicked
                    CookieHelper.CookieSet(HttpContext, "cookieSort", sortField, 30);
                    CookieHelper.CookieSet(HttpContext, "cookieSortDirection", sortDirection, 30);
                }
                if (actionButton == "Tín chỉ")//Change of sort is requested
                {
                    if (actionButton == sortField) //Reverse order on same field
                    {
                        sortDirection = sortDirection == "asc" ? "desc" : "asc";
                    }
                    sortField = actionButton;//Sort by the button clicked
                    CookieHelper.CookieSet(HttpContext, "cookieSort", sortField, 30);
                    CookieHelper.CookieSet(HttpContext, "cookieSortDirection", sortDirection, 30);
                }
            }
            else
            {
                //May be coming back to the page so see if sort is in cookie
                string cookieSort = HttpContext.Request.Cookies["cookieSort"];
                if (!String.IsNullOrEmpty(cookieSort))
                {
                    sortField = cookieSort;
                    sortDirection = HttpContext.Request.Cookies["cookieSortDirection"];
                }
            }
            //Now we know which field and direction to sort by, but a Switch is hard to use for 2 criteria
            //so we will use an if() structure instead.
            if (sortField.Contains("Tên lớp học phần"))
            {
                if (sortDirection == "asc")
                {
                    viewPhanCongGiangDays = viewPhanCongGiangDays
                        .OrderBy(p => p.ViewBaoGioGiangDayChiTiet.TenLopHocPhan).ToList();
                }
                else
                {
                    viewPhanCongGiangDays = viewPhanCongGiangDays
                        .OrderByDescending(p => p.ViewBaoGioGiangDayChiTiet.TenLopHocPhan).ToList();
                }
            }
            else //Date
            {
                if (sortDirection == "asc")
                {
                    viewPhanCongGiangDays = viewPhanCongGiangDays
                        .OrderByDescending(p => p.ViewBaoGioGiangDayChiTiet.SoTinChi).ToList();
                }
                else
                {
                    viewPhanCongGiangDays = viewPhanCongGiangDays
                        .OrderBy(p => p.ViewBaoGioGiangDayChiTiet.SoTinChi).ToList();
                }
            }
            //Set sort for next time
            ViewData["sortField"] = sortField;
            ViewData["sortDirection"] = sortDirection;

            //Handle Paging
            int pageSize;//This is the value we will pass to PaginatedList
            if (pageSizeID.HasValue)
            {
                //Value selected from DDL so use and save it to Cookie
                pageSize = pageSizeID.GetValueOrDefault();
                CookieHelper.CookieSet(HttpContext, "pageSizeValue", pageSize.ToString(), 30);
            }
            else
            {
                //Not selected so see if it is in Cookie
                pageSize = Convert.ToInt32(HttpContext.Request.Cookies["pageSizeValue"]);
            }
           
            pageSize = (pageSize == 0) ? 5 : pageSize;//Neither Selected or in Cookie so go with default
            ViewData["pageSizeID"] =
                new SelectList(new[] {"1", "2", "5", "10", "20", "30", "40", "50", "100", "500" }, pageSize.ToString());
            @ViewData["SoMon"] = viewPhanCongGiangDays.Count();
            var pagedData = PaginatedList<ViewPhanCongGiangDay>.CreateAsync(viewPhanCongGiangDays, page ?? 1, pageSize);
            @ViewData["SoMon"] = pagedData.Count();
            return View(pagedData);
        }


        // GET: PhanCongGiangDays/Create
        public IActionResult Create()
        {
            ViewData["IdBaoGioGiangDayChiTiet"] = new SelectList(_context.BaoGioGiangDayChiTiets, "IdBaoGioGiangDayChiTiet", "TenLopHocPhan");
            ViewData["IdGiaoVien"] = new SelectList(_context.GiaoViens, "IdGiaoVien", "IdGiaoVien");
            return View();
        }

        // POST: PhanCongGiangDays/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdPhanCongGiangDay,IdBaoGioGiangDayChiTiet,IdGiaoVien,SoGioHoacTuanHoacSoNguoi,GhiChu,IdNamHocHocKy")] PhanCongGiangDay phanCongGiangDay)
        {
            if (ModelState.IsValid)
            {
                _context.Add(phanCongGiangDay);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdBaoGioGiangDayChiTiet"] = new SelectList(_context.BaoGioGiangDayChiTiets, "IdBaoGioGiangDayChiTiet", "TenLopHocPhan", phanCongGiangDay.IdBaoGioGiangDayChiTiet);
            ViewData["IdGiaoVien"] = new SelectList(_context.GiaoViens, "IdGiaoVien", "IdGiaoVien", phanCongGiangDay.IdGiaoVien);
            return View(phanCongGiangDay);
        }

        // GET: PhanCongGiangDays/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var phanCongGiangDay = await _context.PhanCongGiangDays.FindAsync(id);
            if (phanCongGiangDay == null)
            {
                return NotFound();
            }
            ViewData["IdBaoGioGiangDayChiTiet"] = new SelectList(_context.BaoGioGiangDayChiTiets, "IdBaoGioGiangDayChiTiet", "TenLopHocPhan", phanCongGiangDay.IdBaoGioGiangDayChiTiet);
            ViewData["IdGiaoVien"] = new SelectList(_context.GiaoViens, "IdGiaoVien", "DienThoai", phanCongGiangDay.IdGiaoVien);
            return View(phanCongGiangDay);
        }

        // POST: PhanCongGiangDays/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdPhanCongGiangDay,IdBaoGioGiangDayChiTiet,IdGiaoVien,SoGioHoacTuanHoacSoNguoi,GhiChu,IdNamHocHocKy")] PhanCongGiangDay phanCongGiangDay)
        {
            if (id != phanCongGiangDay.IdPhanCongGiangDay)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(phanCongGiangDay);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PhanCongGiangDayExists(phanCongGiangDay.IdPhanCongGiangDay))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdBaoGioGiangDayChiTiet"] = new SelectList(_context.BaoGioGiangDayChiTiets, "IdBaoGioGiangDayChiTiet", "TenLopHocPhan", phanCongGiangDay.IdBaoGioGiangDayChiTiet);
            ViewData["IdGiaoVien"] = new SelectList(_context.GiaoViens, "IdGiaoVien", "DienThoai", phanCongGiangDay.IdGiaoVien);
            return View(phanCongGiangDay);
        }

        // GET: PhanCongGiangDays/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var phanCongGiangDay = await _context.PhanCongGiangDays
                .Include(p => p.IdBaoGioGiangDayChiTietNavigation)
                .Include(p => p.IdGiaoVienNavigation)
                .FirstOrDefaultAsync(m => m.IdPhanCongGiangDay == id);
            if (phanCongGiangDay == null)
            {
                return NotFound();
            }

            return View(phanCongGiangDay);
        }

        // POST: PhanCongGiangDays/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var phanCongGiangDay = await _context.PhanCongGiangDays.FindAsync(id);
            _context.PhanCongGiangDays.Remove(phanCongGiangDay);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        [HttpPost]
        
        public async Task<IActionResult> LuuPhanCong([FromBody]List<PhanGioHocPhan> arrData)
        {
            try
            {
                if (!Function.ListIsNullOrEmpty(arrData))
                {
                    foreach (var item in arrData)
                    {
                        if (item.IdGiaoViens.Count() == 1)
                        {
                            if (item.ChiaGios[0] != item.SoGio)
                            {
                                item.ChiaGios[0] = item.SoGio;
                            }
                        }
                        else if (item.IdGiaoViens.Count() > 1)
                        {
                            float soGioChoCacNguoiTruoc =0;
                            if (item.IdGiaoViens.Count()==item.ChiaGios.Count())
                            {
                                soGioChoCacNguoiTruoc = item.ChiaGios.SkipLast(1).Sum();
                                item.ChiaGios.RemoveAt(item.ChiaGios.Count() - 1);
                            }
                            else
                            {
                                soGioChoCacNguoiTruoc = item.ChiaGios.Sum();
                            }
                            float soGioChoNguoiCuoi = item.SoGio - soGioChoCacNguoiTruoc;
                            item.ChiaGios.Add(soGioChoNguoiCuoi);
                        }
                        //Xóa
                        var phanCongGiangDays = await GetList.PhanCongGiangDays(item.IdBaoGioGiangDayChiTiet);
                        if (!Function.ListIsNullOrEmpty(phanCongGiangDays))
                        {
                            var phanCongGiangDaysXoa = phanCongGiangDays.Where(n => !item.IdGiaoViens.Contains(n.IdGiaoVien)).ToList();
                            _context.RemoveRange(phanCongGiangDaysXoa);
                        }
                        for (int i = 0; i < item.IdGiaoViens.Count(); i++)
                        {

                            PhanCongGiangDay phanCongGiangDay = await GetModel.PhanCongGiangDay(item.IdBaoGioGiangDayChiTiet, item.IdGiaoViens[i]);
                            if (phanCongGiangDay==null)
                            {
                                phanCongGiangDay = new PhanCongGiangDay();
                                phanCongGiangDay.IdPhanCongGiangDay = 0;
                                phanCongGiangDay.IdBaoGioGiangDayChiTiet = item.IdBaoGioGiangDayChiTiet;
                                phanCongGiangDay.IdGiaoVien = item.IdGiaoViens[i];
                            }
                            phanCongGiangDay.SoGioHoacTuanHoacSoNguoi = item.ChiaGios[i];
                            if (phanCongGiangDay.IdPhanCongGiangDay==0)
                            {
                                await _context.AddAsync(phanCongGiangDay);
                            }
                            else
                            {
                                _context.PhanCongGiangDays.Update(phanCongGiangDay);
                            }
                        }
                    }
                    await _context.SaveChangesAsync();
                    return Json(new { message= Message.SuccessEdit("Phân công giảng dạy") });
                }
            }
            catch (Exception ex)
            {
                return Json(new { message = Message.Fail(ex) });
            }
            return RedirectToAction("Index", "PhanCongGiangDays");
        }
        [HttpPost]
        public async Task<IActionResult> XuatPhanCong([FromBody] object data)
        {
            try
            {
                var details = JObject.Parse(data.ToString());
                int IdBoMon = int.Parse(details["IdBoMon"].ToString());
                string IdKhoa = details["IdKhoa"].ToString();
                
                int IdNamHocHocKy = int.Parse(details["IdNamHocHocKy"].ToString());
                int IdBaoGioGiangDay = int.Parse(details["IdBaoGioGiangDay"].ToString());

                List<ViewPhanCongSoGioCuaGiaoVien> viewPhanCongSoGioCuaGiaoViens = new List<ViewPhanCongSoGioCuaGiaoVien>();
                viewPhanCongSoGioCuaGiaoViens = await GetList.ViewPhanCongGiangDaysTheoBoMon(IdNamHocHocKy, IdBaoGioGiangDay, IdKhoa, IdBoMon);
                string tenBoMon = GetName.TenBoMon(IdBoMon);
                string tenKhoa = GetName.TenKhoa(IdKhoa);
                string tenHocKy = GetName.NamHocHocKy(IdNamHocHocKy);
                ExcelExportHelper.ExportPhanCongGiangDay(viewPhanCongSoGioCuaGiaoViens,tenKhoa, tenBoMon,tenHocKy,"Nguyễn Văn Trung");
                return Json(new { message = Message.SuccessEdit("Tải Phân công giảng dạy!") ,fileName =tenBoMon+".xlsx"});
            }
            catch (Exception ex)
            {
                return Json(new { message = Message.Fail(ex) });
            }
        }
        [HttpGet]
        public async Task<IActionResult> TaiPhanCong(string fileName)
        {
            byte[] fileContent = await ProcessFile.DownloadFile(@"MauBieu\PhanCongGiangDay", fileName);
            return File(fileContent, ExcelExportHelper.ExcelContentType, fileName);
        }
        private bool PhanCongGiangDayExists(int id)
        {
            return _context.PhanCongGiangDays.Any(e => e.IdPhanCongGiangDay == id);
        }
       
    }
}
