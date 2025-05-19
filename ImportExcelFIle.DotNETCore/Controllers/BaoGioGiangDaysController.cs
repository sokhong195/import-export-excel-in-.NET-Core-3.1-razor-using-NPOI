using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.Models;
using ImportExcelFIle.DotNETCore.Utilities;
using System;
using OfficeOpenXml;
using System.IO;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Hosting;
using ImportExcelFIle.DotNETCore.ModelViews;

namespace ImportExcelFIle.DotNETCore.Controllers
{
    public class BaoGioGiangDaysController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public IWebHostEnvironment hostingEnvironment;
        public BaoGioGiangDaysController(dbPhanCongThanhToanContext context, IWebHostEnvironment _environment)
        {
            _context = context;
            hostingEnvironment = _environment;
        }

        // GET: BaoGioGiangDays
        public async Task<IActionResult> Index()
        {
            return View(await _context.BaoGioGiangDays.Where(n=>n.IdBaoGioGiangDay!=0).ToListAsync());
        }
        // GET: BaoGioGiangDays/Create
        public async Task<IActionResult> Create()
        {
            BaoGioGiangDay BaoGioGiangDay = null;
           //if (TempData["BaoGioGiangDay"] == null)
            {
                BaoGioGiangDay = new BaoGioGiangDay();
                BaoGioGiangDay.ThoiGianBatDau = DateTime.Now;
                BaoGioGiangDay.ThoiGianKetThuc = null;
                BaoGioGiangDay.BaoGioGiangDayChiTiets = new List<BaoGioGiangDayChiTiet>(1);
                BaoGioGiangDay.TenTepBaoGio = "";
            }
           // else
            //{
           //     BaoGioGiangDay = JsonConvert.DeserializeObject<BaoGioGiangDay>(TempData["BaoGioGiangDay"].ToString());
           // }           
            await Task.Run(()=> PopulateDropDownLists(BaoGioGiangDay));
            return View(BaoGioGiangDay);
        }

        // POST: BaoGioGiangDays/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [RequestFormLimits(ValueCountLimit = int.MaxValue)]
        public async Task<IActionResult> Create([Bind("IdBaoGioGiangDay,TenPhanCongGiangDay,IdNamHocHocKy,ThoiGianBatDau,ThoiGianKetThuc,TenTepBaoGio,BaoGioGiangDayChiTiets")] BaoGioGiangDay baoGioGiangDay,[Bind("theFile")] IFormFile theFile)
        {
            if (ModelState.IsValid)
            {
                _context.Add(baoGioGiangDay);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            await Task.Run(() => PopulateDropDownLists(baoGioGiangDay));
            return View(baoGioGiangDay);
        }
        [HttpGet]
        // GET: BaoGioGiangDays/Edit/5
        public async Task<IActionResult> Edit(int? id, string IdKhoa, int? page, int? pageSizeID , string actionButton , string SearchString, string sortDirection = "desc", string sortField = "Mã khoa")
        {
            if (id == null)
            {
                return NotFound();
            }
            BaoGioGiangDay BaoGioGiangDay = _context.BaoGioGiangDays.Include(n => n.BaoGioGiangDayChiTiets).Where(n => n.IdBaoGioGiangDay == id).FirstOrDefault();
            if (BaoGioGiangDay == null)
            {
                return NotFound();
            }
            ViewData["BaoGioGiangDay"] = BaoGioGiangDay;
            PopulateDropDownLists();
            ViewData["IdKhoa"] = await GetList.KhoaSelectList(IdKhoa);
            ViewData["Filtering"] = "btn-outline-dark";
            //Get the URL with the last filter, sort and page parameters from the Patients Index View
            ViewData["returnURL"] = MaintainURL.ReturnURL(HttpContext, "BaoGioGiangDays");

            //Clear the sort/filter/paging URL Cookie for Patient Appointments Master/Details
            CookieHelper.CookieSet(HttpContext, "BaoGioGiangDaysChiTiet", "", -1);

            var bggdChitiets = await GetList.ViewBaoGioGiangDayChiTiets(BaoGioGiangDay.IdBaoGioGiangDay);
            
            if (!String.IsNullOrEmpty(IdKhoa)&& IdKhoa!="0")
            {
                bggdChitiets = bggdChitiets.Where(p => p.IdKhoa == IdKhoa).ToList();
                ViewData["Filtering"] = "btn-danger";
            }
            if (!String.IsNullOrEmpty(SearchString))
            {
                bggdChitiets = bggdChitiets.Where(p => p.TenLopHocPhan.ToUpper().Contains(SearchString.ToUpper())).ToList();
                ViewData["Filtering"] = "btn-danger";
            }

            @ViewData["TongSoMon"] = bggdChitiets.Count();
            //Before we sort, see if we have called for a change of filtering or sorting
            if (!String.IsNullOrEmpty(actionButton)) //Form Submitted so lets sort!
            {
                page = 1;//Reset back to first page when sorting or filtering

                if (actionButton == "Mã khoa")//Change of sort is requested
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
                if (sortField.Contains("Mã khoa"))
            {
                if (sortDirection == "asc")
                {
                    bggdChitiets = bggdChitiets
                        .OrderBy(p => p.IdKhoa).ToList();
                }
                else
                {
                    bggdChitiets = bggdChitiets
                        .OrderByDescending(p => p.IdKhoa).ToList();
                }
            }
            else //Date
            {
                if (sortDirection == "asc")
                {
                    bggdChitiets = bggdChitiets
                        .OrderByDescending(p => p.SoTinChi).ToList();
                }
                else
                {
                    bggdChitiets = bggdChitiets
                        .OrderBy(p => p.SoTinChi).ToList();
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
                new SelectList(new[] { "5", "10", "20", "30", "40", "50", "100", "500" }, pageSize.ToString());
            @ViewData["SoMon"] = bggdChitiets.Count();
            var pagedData = PaginatedList<ViewBaoGioGiangDayChiTiet>.CreateAsync(bggdChitiets, page ?? 1, pageSize);
            @ViewData["SoMon"] = pagedData.Count();
            return View(pagedData);
        }

        // POST: BaoGioGiangDays/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdBaoGioGiangDay,TenPhanCongGiangDay,IdNamHocHocKy,ThoiGianBatDau,ThoiGianKetThuc,TenTepBaoGio")] BaoGioGiangDay BaoGioGiangDay)
        {
            if (id != BaoGioGiangDay.IdBaoGioGiangDay)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(BaoGioGiangDay);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BaoGioGiangDayExists(BaoGioGiangDay.IdBaoGioGiangDay))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index), "Trainning", new { Tab = "BaoGioGiangDaysTab" });
            }
            return View(BaoGioGiangDay);
        }

        // GET: BaoGioGiangDays/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var BaoGioGiangDay = await _context.BaoGioGiangDays
                .FirstOrDefaultAsync(m => m.IdBaoGioGiangDay == id);
            if (BaoGioGiangDay == null)
            {
                return NotFound();
            }

            return View(BaoGioGiangDay);
        }

        // POST: BaoGioGiangDays/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var BaoGioGiangDay = await _context.BaoGioGiangDays.Include(n => n.BaoGioGiangDayChiTiets).FirstOrDefaultAsync(n => n.IdBaoGioGiangDay == id);
                if (BaoGioGiangDay == null)
                {
                    TempData["msg"] = string.Format("MessageBox('{0}');", "Không tồn tại báo giờ này!");
                    return RedirectToAction(nameof(Index), "Trainning", new { Tab = "BaoGioGiangDaysTab" });
                }
                if (BaoGioGiangDay.BaoGioGiangDayChiTiets.Count > 0)
                {
                    TempData["msg"] = string.Format("MessageBox('{0}');", "Lỗi: Không xóa được do giàng buộc dữ liệu!");
                    return RedirectToAction(nameof(Index), "Trainning", new { Tab = "BaoGioGiangDaysTab" });
                }
                _context.BaoGioGiangDays.Remove(BaoGioGiangDay);
                await _context.SaveChangesAsync();
                TempData["msg"] = string.Format("MessageBox('{0}');", "Xóa báo giờ giảng dạy thành công!");
                return RedirectToAction(nameof(Index), "Trainning", new { Tab = "BaoGioGiangDaysTab" });
            }
            catch (Exception ex)
            {
                TempData["msg"] = string.Format("MessageBox('{0}');", "Lỗi: " + ex.InnerException.Message);
                return RedirectToAction(nameof(Index), "Trainning", new { Tab = "BaoGioGiangDaysTab" });
            }
        }
        [HttpPost, ActionName("DeleteAll")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteAll(int id)
        {
            try
            {
                var BaoGioGiangDay = await _context.BaoGioGiangDays.Include(n => n.BaoGioGiangDayChiTiets).FirstOrDefaultAsync(n => n.IdBaoGioGiangDay == id);
                if (BaoGioGiangDay == null)
                {
                    TempData["msg"] = string.Format("MessageBox('{0}');", "Không tồn tại báo giờ này!");
                    return RedirectToAction(nameof(Index), "Trainning", new { Tab = "BaoGioGiangDaysTab" });
                }
                _context.BaoGioGiangDayChiTiets.RemoveRange(BaoGioGiangDay.BaoGioGiangDayChiTiets);
                _context.BaoGioGiangDays.Remove(BaoGioGiangDay);
                await _context.SaveChangesAsync();
                TempData["msg"] = string.Format("MessageBox('{0}');", "Xóa báo giờ giảng dạy thành công!");
                return RedirectToAction(nameof(Index), "Trainning", new { Tab = "BaoGioGiangDaysTab" });
            }
            catch (Exception ex)
            {
                TempData["msg"] = string.Format("MessageBox('{0}');", "Lỗi: " + ex.InnerException.Message);
                return RedirectToAction(nameof(Index), "Trainning", new { Tab = "BaoGioGiangDaysTab" });
            }
        }
        private bool BaoGioGiangDayExists(int id)
        {
            return _context.BaoGioGiangDays.Any(e => e.IdBaoGioGiangDay == id);
        }


        private void PopulateDropDownLists(BaoGioGiangDay BaoGioGiangDay = null)
        {
            if ((BaoGioGiangDay?.IdNamHocHocKy).HasValue)
            {
                ViewData["IdNamHocHocKy"] = GetList.NamHocHocKySelectList(BaoGioGiangDay.IdNamHocHocKy);
            }
            else
            {               
                ViewData["IdNamHocHocKy"] = GetList.NamHocHocKySelectList(null);
            }
        }
        [HttpPost]

        public async Task<IActionResult> TaiBaoGio([Bind("IdBaoGioGiangDay,TenPhanCongGiangDay,IdNamHocHocKy,ThoiGianBatDau,ThoiGianKetThuc,TenTepBaoGio,BaoGioGiangDayChiTiets")]BaoGioGiangDay BaoGioGiangDay, [Bind("theFile")]IFormFile theFile)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    string tenNamHocHocKy = GetName.NamHocHocKy(BaoGioGiangDay.IdNamHocHocKy);
                    string tenTep = "BGGD_" + tenNamHocHocKy.Trim().Replace(' ', '_') + ".xlsx";
                    BaoGioGiangDay.TenTepBaoGio = tenTep;
                    ProcessFile.CopyFileToFolder("BaoGioGiangDays", tenTep, theFile, hostingEnvironment);
                    List<BaoGioGiangDayChiTiet> gioGiangDayChiTiets = await ReadDataFromExcelCell.GetBaoGioGiangDayChiTiets(theFile);
                    if (gioGiangDayChiTiets==null)
                    {
                        throw new Exception(ReadDataFromExcelCell.Message);
                    }
                    //_context.BaoGioGiangDayChiTiets.AddRange(gioGiangDayChiTiets);
                    //await _context.SaveChangesAsync();
                    TempData["BaoGioGiangDay"] = JsonConvert.SerializeObject(BaoGioGiangDay);
                    TempData["BaoGioGiangDayChiTiets"] = JsonConvert.SerializeObject(gioGiangDayChiTiets);

                    return RedirectToAction("Preview");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", Message.Fail(ex,false));
                    PopulateDropDownLists(BaoGioGiangDay);
                    return View("Create", BaoGioGiangDay);
                }
            }
            PopulateDropDownLists(BaoGioGiangDay);
            return View(BaoGioGiangDay);
        }
        [HttpGet]
        public async Task<IActionResult> Preview([Bind("TenPhanCongGiangDay", "IdNamHocHocKy", "ThoiGianBatDau", "ThoiGianKetThuc", "TenTepBaoGio")] BaoGioGiangDay BaoGioGiangDay , string IdKhoa, int? page, int? pageSizeID, string actionButton,
             string SearchString, string sortDirection = "desc", string sortField = "IdKhoa")
        {
            PopulateDropDownLists();
            ViewData["IdKhoa"] =await GetList.KhoaSelectList(IdKhoa);          
            ViewData["Filtering"] = "btn-outline-dark";
            if (TempData["BaoGioGiangDay"] != null)
                ViewData["BaoGioGiangDay"] = JsonConvert.DeserializeObject<BaoGioGiangDay>(TempData["BaoGioGiangDay"].ToString());
            else
            {
                ViewData["BaoGioGiangDay"] = BaoGioGiangDay;
            }
            List<BaoGioGiangDayChiTiet> baoGioGiangDayChiTiets = JsonConvert.DeserializeObject<List<BaoGioGiangDayChiTiet>>(TempData["BaoGioGiangDayChiTiets"].ToString());
            ViewData["SoMon"] = baoGioGiangDayChiTiets.ToList().Count;
            //Get the URL with the last filter, sort and page parameters from the Patients Index View
            ViewData["returnURL"] = MaintainURL.ReturnURL(HttpContext, "BaoGioGiangDays");

            //Clear the sort/filter/paging URL Cookie for Patient Appointments Master/Details
            CookieHelper.CookieSet(HttpContext, "BaoGioGiangDaysChiTiet", "", -1);

            var bggdChitiets = await GetList.ViewBaoGioGiangDayChiTiets(baoGioGiangDayChiTiets,BaoGioGiangDay);

            if (!String.IsNullOrEmpty(IdKhoa))
            {
                bggdChitiets = bggdChitiets.Where(p => p.IdKhoa == IdKhoa).ToList();
                ViewData["Filtering"] = "btn-danger";
            }
            if (!String.IsNullOrEmpty(SearchString))
            {
                bggdChitiets = bggdChitiets.Where(p => p.TenLopHocPhan.ToUpper().Contains(SearchString.ToUpper())).ToList();
                ViewData["Filtering"] = "btn-danger";
            }
            //Before we sort, see if we have called for a change of filtering or sorting
            if (!String.IsNullOrEmpty(actionButton)) //Form Submitted so lets sort!
            {
                page = 1;//Reset back to first page when sorting or filtering

                if (actionButton == "IdKhoa")//Change of sort is requested
                {
                    if (actionButton == sortField) //Reverse order on same field
                    {
                        sortDirection = sortDirection == "asc" ? "desc" : "asc";
                    }
                    sortField = actionButton;//Sort by the button clicked
                }
                CookieHelper.CookieSet(HttpContext, "cookieSort", sortField, 30);
                CookieHelper.CookieSet(HttpContext, "cookieSortDirection", sortDirection, 30);
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
            if (sortField.Contains("IdKhoa"))
            {
                if (sortDirection == "asc")
                {
                    bggdChitiets = bggdChitiets
                        .OrderBy(p => p.IdKhoa).ToList();
                }
                else
                {
                    bggdChitiets = bggdChitiets
                        .OrderByDescending(p => p.IdKhoa).ToList();
                }
            }
            else //Date
            {
                if (sortDirection == "asc")
                {
                    bggdChitiets = bggdChitiets
                        .OrderByDescending(p => p.SoTinChi).ToList();
                }
                else
                {
                    bggdChitiets = bggdChitiets
                        .OrderBy(p => p.SoTinChi).ToList();
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
                new SelectList(new[] { "5","10", "20", "30", "40", "50", "100", "500" }, pageSize.ToString());
            var pagedData = await Task.Run(() => PaginatedList<ViewBaoGioGiangDayChiTiet>.CreateAsync(bggdChitiets, page ?? 1, pageSize));
            TempData.Keep("BaoGioGiangDayChiTiets");
            return await Task.Run(() => View(pagedData));
        }
        [HttpGet]
        public async Task<IActionResult> Save([Bind("TenPhanCongGiangDay", "IdNamHocHocKy", "ThoiGianBatDau", "ThoiGianKetThuc", "TenTepBaoGio")] BaoGioGiangDay BaoGioGiangDay)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _context.BaoGioGiangDays.Add(BaoGioGiangDay);
                    await _context.SaveChangesAsync();
                    int IdBaoGioGiangDay = BaoGioGiangDay.IdBaoGioGiangDay;
                    List<BaoGioGiangDayChiTiet> baoGioGiangDayChiTiets = JsonConvert.DeserializeObject<List<BaoGioGiangDayChiTiet>>(TempData["BaoGioGiangDayChiTiets"].ToString());
                    foreach (var item in baoGioGiangDayChiTiets)
                    {
                        item.IdBaoGioGiangDay = IdBaoGioGiangDay;
                        _context.BaoGioGiangDayChiTiets.Add(item);
                    }
                    await _context.SaveChangesAsync();
                    TempData["msg"] = string.Format("MessageBox('{0}');", "Tạo báo giờ giảng dạy thành công");
                    return RedirectToAction(nameof(Index), "Trainning", new { Tab = "BaoGioGiangDaysTab" });
                }
                catch (Exception ex)
                {
                    TempData["msg"] = string.Format("MessageBox('{0}');", "Lỗi: " + ex.InnerException.Message);
                    ModelState.AddModelError("", "Lỗi: " + ex.InnerException.Message);
                    PopulateDropDownLists(BaoGioGiangDay);
                    return View(BaoGioGiangDay);
                }
            }
            TempData.Keep("BaoGioGiangDayChiTiets");
            return View("Preview", BaoGioGiangDay);
        }
        private async void XoaDuLieuBangBaoGioGiangDayChiTiet()
        {
            var q = await _context.BaoGioGiangDayChiTiets.Where(n => n.IdBaoGioGiangDay == 0).ToListAsync();
            _context.BaoGioGiangDayChiTiets.RemoveRange(q);
            await _context.SaveChangesAsync();
        }
        [HttpPost]
        public async Task<IActionResult> Download([Bind("id", "TenTepBaoGio")]  int id)
        {
            BaoGioGiangDay baoGioGiangDay = await _context.BaoGioGiangDays.FindAsync(id);
            var stream = await ProcessFile.DownloadFile("BaoGioGiangDays", baoGioGiangDay.TenTepBaoGio, hostingEnvironment);
            if (stream==null)
            {
                ModelState.AddModelError("", "Tệp không tồn tại");
                return Redirect("Index");
            }
            return await Task.Run(()=> File(stream, ExcelExportHelper.ExcelContentType, baoGioGiangDay.TenTepBaoGio));
        }
        [HttpGet]
        public async Task<JsonResult> GetBaoGioGiangDays(int? IdNamHocHocKy)
        {
            var list = await GetList.BaoGioGiangDaySelectList(IdNamHocHocKy, null);
            return Json(list);
        }

    }
}
