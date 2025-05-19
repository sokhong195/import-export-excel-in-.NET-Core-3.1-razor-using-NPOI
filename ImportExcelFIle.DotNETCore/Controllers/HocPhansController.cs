using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImportExcelFIle.DotNETCore.Models;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using ImportExcelFIle.DotNETCore.Utilities;
using ImportExcelFIle.DotNETCore.ModelViews;
using ImportExcelFIle.DotNETCore.Classes;

namespace ImportExcelFIle.DotNETCore.Controllers
{
    public class HocPhansController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public bool removeSpecialCharacters = true;
        public readonly string model = "Học phần";
        public string result = "";
        public HocPhansController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }
        [HttpGet]
        // GET: HocPhans
        public async Task<IActionResult> Index(string IdKhoa, int? IdBoMon, int? page, int? pageSizeID, string actionButton, string SearchString, string sortDirection = "asc", string sortField = "Tên học phần")
        {
            List<HocPhan> hocPhans = new List<HocPhan>();
            List<ViewHocPhan> ViewHocPhans = null;
            if (TempData["HocPhans"] != null)
            {
                hocPhans = JsonConvert.DeserializeObject<List<HocPhan>>(TempData["HocPhans"].ToString());
            }
            else
                hocPhans = await _context.HocPhans.ToListAsync();
            TempData["msg"] = TempData["msg"];
            ViewData["IdKhoa"] = await GetList.KhoaSelectList(IdKhoa);
            ViewData["IdBoMon"] = await GetList.BoMonSelectList(IdKhoa,IdBoMon);
            ViewHocPhans = await GetList.ViewHocPhans(hocPhans);

            ViewData["Filtering"] = "btn-outline-dark";
            //Clear the sort/filter/paging URL Cookie
            CookieHelper.CookieSet(HttpContext, "HocPhans", "", -1);
            if (!String.IsNullOrEmpty(IdKhoa) && IdKhoa != "0")
            {
                ViewHocPhans = ViewHocPhans.Where(p => p.IdKhoa == IdKhoa).ToList();
                ViewData["Filtering"] = "btn-danger";
            }
            if (!String.IsNullOrEmpty(SearchString))
            {
                ViewHocPhans = ViewHocPhans.Where(p => p.TenHocPhan.ToUpper().Contains(SearchString.ToUpper())).ToList();
                ViewData["Filtering"] = "btn-danger";
            }
            //Before we sort, see if we have called for a change of filtering or sorting
            if (!String.IsNullOrEmpty(actionButton)) //Form Submitted so lets sort!
            {
                page = 1;//Reset back to first page when sorting or filtering

                if (actionButton == "Tên học phần")//Change of sort is requested
                {
                        sortDirection = sortDirection == "asc" ? "desc" : "asc";
                }
                //Save sort in cookie
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
            if (sortField.Contains("Tên học phần"))
            {
                if (sortDirection == "asc")
                {
                    ViewHocPhans = ViewHocPhans
                        .OrderBy(p => p.TenHocPhan).ToList();
                }
                else
                {
                    ViewHocPhans = ViewHocPhans
                    .OrderByDescending(p => p.TenHocPhan).ToList();
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
            pageSize = (pageSize == 0) ? 20 : pageSize;//Neither Selected or in Cookie so go with default
            ViewData["pageSizeID"] =
                new SelectList(new[] { "5", "10", "20", "30", "40", "50", "100", "500" }, pageSize.ToString());
            if (TempData["HocPhans"] != null) TempData["HocPhans"] = TempData["HocPhans"];
            ViewData["TotalOfRecord"] = ViewHocPhans.Count();
            var pagedData = await Task.Run(() => PaginatedList<ViewHocPhan>.CreateAsync(ViewHocPhans, page ?? 1, pageSize));
            return await Task.Run(() => View(pagedData));
        }

        [HttpGet]
        public async Task<IActionResult> ReadFromFile(string IdKhoa, int? page, int? pageSizeID, string actionButton, string SearchString, string sortDirection = "desc", string sortField = "IdKhoa")
        {
            ViewData["Filtering"] = "btn-outline-dark";
            if (TempData["HocPhans"] != null)
            {
                List<HocPhan> hocPhans = JsonConvert.DeserializeObject<List<HocPhan>>(TempData["HocPhans"].ToString());
                ViewData["IdKhoa"] = Utilities.GetList.KhoaSelectList(IdKhoa);
                ViewData["Filtering"] = "btn-outline-dark";
                if (!String.IsNullOrEmpty(IdKhoa) && IdKhoa != "0")
                {
                    hocPhans = hocPhans.Where(p => p.IdKhoa == IdKhoa).ToList();
                    ViewData["Filtering"] = "btn-danger";
                }
                if (!String.IsNullOrEmpty(SearchString))
                {
                    hocPhans = hocPhans.Where(p => p.TenHocPhan.ToUpper().Contains(SearchString.ToUpper())).ToList();
                    ViewData["Filtering"] = "btn-danger";
                }
                //Before we sort, see if we have called for a change of filtering or sorting
                if (!String.IsNullOrEmpty(actionButton)) //Form Submitted so lets sort!
                {
                    page = 1;//Reset back to first page when sorting or filtering

                    if (actionButton != "Filter")//Change of sort is requested
                    {
                        if (actionButton == sortField) //Reverse order on same field
                        {
                            sortDirection = sortDirection == "asc" ? "desc" : "asc";
                        }
                        sortField = actionButton;//Sort by the button clicked
                    }
                }
                //Now we know which field and direction to sort by, but a Switch is hard to use for 2 criteria
                //so we will use an if() structure instead.
                if (sortField.Contains("Mã khoa"))
                {
                    if (sortDirection == "asc")
                    {
                        hocPhans = hocPhans
                            .OrderBy(p => p.IdKhoa).ToList();
                    }
                    else
                    {
                        hocPhans = hocPhans
                        .OrderByDescending(p => p.IdKhoa).ToList();
                    }
                }
                else //Date
                {
                    if (sortDirection == "asc")
                    {
                        hocPhans = hocPhans.OrderByDescending(p => p.SoTinChi).ToList();
                    }
                    else
                    {
                        hocPhans = hocPhans.OrderBy(p => p.SoTinChi).ToList();
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
                pageSize = (pageSize == 0) ? 20 : pageSize;//Neither Selected or in Cookie so go with default
                ViewData["pageSizeID"] =
                    new SelectList(new[] { "5", "10", "20", "30", "40", "50", "100", "500" }, pageSize.ToString()); TempData["HocPhans"] = TempData["HocPhans"];
                ViewData["TotalOfRecord"] = hocPhans.Count();
                var pagedData = await Task.Run(() => PaginatedList<HocPhan>.CreateAsync(hocPhans, page ?? 1, pageSize));
                return await Task.Run(() => View(pagedData));
            }
            return RedirectToAction("Index");
        }
        // GET: HocPhans/Create
        public async Task<IActionResult> CreateOrEdit(int Id = 0)
        {
            HocPhan hocPhan = new HocPhan();
            VietTat vietTat = new VietTat();
            ViewBag.SoGioLyThuyet1TinChi = GetValue.QuyDinh(VietTat.SoGioLyThuyet1TinChi);
            ViewBag.SoGioHuongDanTuHocCho1TinChi = GetValue.QuyDinh(VietTat.SoGioHuongDanTuHocCho1TinChi);
            ViewBag.SoGioTuHocCho1TinChi = GetValue.QuyDinh(VietTat.SoGioTuHocCho1TinChi);
            ViewBag.SoGioThucHanh1TinChi = GetValue.QuyDinh(VietTat.SoGioThucHanh1TinChi);
            ViewBag.SoGioThucTapDoAnKhoaLuanTotNghiepCho1TinChi = GetValue.QuyDinh(VietTat.SoGioThucTapDoAnKhoaLuanTotNghiepCho1TinChi);
            if (Id == 0)
            {
                hocPhan.ThoiGianBatDau = DateTime.Now;
            }
            else
            {
                hocPhan = await _context.HocPhans.FindAsync(Id);
                if (hocPhan == null)
                {
                    return NotFound();
                }
            }
            await LoadSelectList(hocPhan);
            return View ("CreateOrEdit", hocPhan);
        }

        [HttpPost]
        public async Task<IActionResult> CreateFromFile([Bind("theFile")] IFormFile theFile)
        {
            List<HocPhan> hocPhans = new List<HocPhan>();
            hocPhans = await ReadDataFromExcelCell.GetHocPhans(theFile);
            if (hocPhans != null)
            {
                TempData["HocPhans"] = JsonConvert.SerializeObject(hocPhans);
                return RedirectToAction("Index");
            }
            else
            {
                TempData["msg"] =  MessageBox.Fail( ReadDataFromExcelCell.Message);
                return RedirectToAction("Index");
            }
        }
        [HttpGet]
        public async Task<IActionResult> SaveFromFile()
        {
            result = "";
            try
            {
                if (TempData["HocPhans"] != null)
                {
                    List<HocPhan> hocPhans = JsonConvert.DeserializeObject<List<HocPhan>>(TempData["HocPhans"].ToString());
                    foreach (var item in hocPhans)
                    {
                        if (item.IdHocPhan == 0)
                        {
                            _context.HocPhans.Add(item);
                        }
                        else
                        {
                            _context.HocPhans.Update(item);
                        }
                    }
                    await _context.SaveChangesAsync();
                    TempData["msg"] = MessageBox.Success("Tạo hoặc cập nhật các học phần thành công");
                }
            }
            catch (Exception ex)
            {
                TempData["msg"] = MessageBox.Fail(ex);
            }
            TempData["HocPhans"] = null;
            return RedirectToAction("Index");
        }
        // POST: HocPhans/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit(int Id, [Bind("IdHocPhan,MaHocPhan,TenHocPhan,SoTinChi,ThuocHocKy, IdKhoa,IdBoMon,IdLoaiHocPhan,IdHinhThucThi,ThoiGianThi,CoNganHangDe,SoTietLyThuyet,SoTietThaoLuanThiNghiemThucHanh,SoGioChuanBiTuHoc,HuongDanTuHoc,IdTrinhDo,ThoiGianBatDau,ThoiGianKetThuc, DangLyThuyet, DangThucHanh")] HocPhan HocPhan)
        {
            var str = "";
            if (ModelState.IsValid)
            {
                try
                {
                    List<HocPhan> hocPhans = _context.HocPhans.AsNoTracking().ToList();
                    if (CheckData.CheckDuplicateHocPhan(hocPhans,HocPhan))
                    {
                        removeSpecialCharacters = false;
                        throw new Exception("Môn hoc thêm mới hoặc chỉnh sửa bị trùng với một môn học đã có");
                    }
                    str = CheckData.CheckParametersHocPhan(HocPhan);
                    if (str == "")
                    {
                        if (HocPhan.DangLyThuyet == DangLyThuyet.HocPhanChiCoLyThuyet)
                        {
                            HocPhan.DangLyThuyet = "";
                        }
                        if (HocPhan.DangThucHanh == DangThucHanh.ThucHanhChuyenMon)
                        {
                            HocPhan.DangThucHanh = "";
                        }
                        if (Id == 0)
                        {
                            _context.Add(HocPhan);
                            await _context.SaveChangesAsync();
                            return Json(new { isValid = true, html = Helper.RenderRazorViewToString(this, "Index", _context.HocPhans.ToList()), message = "Thêm học phần thành công" });
                        }
                        else
                        {
                            hocPhans = null;
                            _context.HocPhans.Update(HocPhan);
                            await _context.SaveChangesAsync();
                            return Json(new { isValid = true, html = Helper.RenderRazorViewToString(this, "Index", _context.HocPhans.ToList()), message = "Sửa học phần thành công" });
                        }
                    }
                    else
                    {
                        removeSpecialCharacters = false;
                        throw new Exception(str);
                    }
                }
                catch (Exception ex)
                {
                    await LoadSelectList(HocPhan);
                    return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, "CreateOrEdit", HocPhan), message = Message.Fail(ex, removeSpecialCharacters) });
                }
            }
           await LoadSelectList(HocPhan);
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, "CreateOrEdit", HocPhan)});
        }

        private async Task<int> LoadSelectList(HocPhan HocPhan)
        {
            ViewData["IdKhoa"] = await GetList.KhoaSelectList(HocPhan.IdKhoa);
            ViewData["IdBoMon"] = await GetList.BoMonSelectList(HocPhan.IdKhoa, HocPhan.IdBoMon);
            ViewData["IdHinhThucThi"] = await GetList.HinhThucThiSelectList(HocPhan.IdHinhThucThi);
            ViewData["IdLoaiHocPhan"] = await GetList.LoaiHocPhanSelectList(HocPhan.IdLoaiHocPhan);
            ViewData["IdTrinhDo"] = await GetList.TrinhDoSelectList(HocPhan.IdTrinhDo);
            ViewData["DangThucHanh"] =  DangThucHanh.GetListDangThucHanh(HocPhan.DangThucHanh);
            ViewData["DangLyThuyet"] =  DangLyThuyet.GetListDangLyThuyet(HocPhan.DangLyThuyet);
            return 0;
        }

         // POST: HocPhans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int Id)
        {
            try
            {
                var HocPhan = await _context.HocPhans.FindAsync(Id);
                _context.HocPhans.Remove(HocPhan);
                await _context.SaveChangesAsync();
                return Json(new { isValid = true, html = Helper.RenderRazorViewToString(this, "Index", _context.HocPhans.ToList()), message = "Xóa học phần thành công" });
            }
            catch (Exception ex)
            {
                return Json(new { isValid = true, html = Helper.RenderRazorViewToString(this, "Index", _context.HocPhans.ToList()), message = "Lỗi: " + ex.InnerException.Message });
            }

        }

        [HttpPost, ActionName("DeleteAll")]
        public async Task<IActionResult> DeleteAll([FromBody] List<string> data)
        {
            try
            {
                foreach (var item in data)
                {
                    var HocPhan = await _context.HocPhans
                        .FirstOrDefaultAsync(n => n.IdHocPhan == (int.Parse(item)));
                    if (HocPhan == null)
                    {
                        removeSpecialCharacters = false;
                        throw new Exception(Message.FailNotExist(model));
                    }
                    if (HocPhan.BaoGioGiangDayChiTiets.Count() > 0)
                    {
                        removeSpecialCharacters = false;
                        throw new Exception(Message.FailDataConstraints(model));
                    }
                    _context.HocPhans.Remove(HocPhan);
                }
                await _context.SaveChangesAsync();
                result= Message.SuccessDelete(model);
            }
            catch (Exception ex)
            {
                result = Message.Fail(ex);
            }
            //TempData["msg"] = result;
            return Json(new { message = result });

        }

        [HttpGet]
        // GET: HocPhans
        public async Task<IActionResult> Download(string IdKhoa, int? IdBoMon, int? page, int? pageSizeID, string actionButton, string SearchString, string sortDirection = "asc", string sortField = "Tên học phần")
        {
            List<HocPhan> hocPhans = new List<HocPhan>();
            List<ViewHocPhan> ViewHocPhans = null;
            hocPhans = await _context.HocPhans.ToListAsync();
            ViewData["IdKhoa"] = await GetList.KhoaSelectList(IdKhoa);
            ViewData["IdBoMon"] = await GetList.BoMonSelectList(IdKhoa, IdBoMon);
            ViewHocPhans = await GetList.ViewHocPhans(hocPhans);

            ViewData["Filtering"] = "btn-outline-dark";
            //Clear the sort/filter/paging URL Cookie
            CookieHelper.CookieSet(HttpContext, "HocPhans", "", -1);
            if (!String.IsNullOrEmpty(IdKhoa))
            {
                ViewHocPhans = ViewHocPhans.Where(p => p.IdKhoa == IdKhoa).ToList();
                ViewData["Filtering"] = "btn-danger";
            }
            if (!String.IsNullOrEmpty(SearchString))
            {
                ViewHocPhans = ViewHocPhans.Where(p => p.TenHocPhan.ToUpper().Contains(SearchString.ToUpper())).ToList();
                ViewData["Filtering"] = "btn-danger";
            }
            //Before we sort, see if we have called for a change of filtering or sorting
            if (!String.IsNullOrEmpty(actionButton)) //Form Submitted so lets sort!
            {
                page = 1;//Reset back to first page when sorting or filtering

                if (actionButton == "Tên học phần")//Change of sort is requested
                {
                    sortDirection = sortDirection == "asc" ? "desc" : "asc";
                }
                //Save sort in cookie
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
            if (sortField.Contains("Tên học phần"))
            {
                if (sortDirection == "asc")
                {
                    ViewHocPhans = ViewHocPhans
                        .OrderBy(p => p.TenHocPhan).ToList();
                }
                else
                {
                    ViewHocPhans = ViewHocPhans
                    .OrderByDescending(p => p.TenHocPhan).ToList();
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
            pageSize = (pageSize == 0) ? 20 : pageSize;//Neither Selected or in Cookie so go with default
            ViewData["pageSizeID"] =
                new SelectList(new[] { "5", "10", "20", "30", "40", "50", "100", "500" }, pageSize.ToString());
            if (TempData["HocPhans"] != null) TempData["HocPhans"] = TempData["HocPhans"];
            ViewData["TotalOfRecord"] = ViewHocPhans.Count();
            var pagedData = await Task.Run(() => PaginatedList<ViewHocPhan>.CreateAsync(ViewHocPhans, page ?? 1, pageSize));


            string[] columns = {"IdHocPhan","IdKhoa", "ThuocHocKy", "MaHocPhan", "TenHocPhan", "SoTinChi", "TenLoaiHocPhan","TenTrinhDo" };
            byte[] filecontent = ExcelExportHelper.ExportExcel(ViewHocPhans, "Học phần", true, columns);
            return File(filecontent, ExcelExportHelper.ExcelContentType, "Danh_sach_Hoc_Phan.xlsx");
        }
        [HttpGet]
        public async Task<IActionResult> GetValues(int? idHocPhan)
        {
            var v = await GetModel.HocPhan((int)idHocPhan);
            return Json(new { stc = v.SoTinChi, tlt = v.SoTietLyThuyet, hdth = v.HuongDanTuHoc, cbth = v.SoGioChuanBiTuHoc, tntlth = v.SoTietThaoLuanThiNghiemThucHanh, tenhp = v.TenHocPhan });
        }

    }
}
