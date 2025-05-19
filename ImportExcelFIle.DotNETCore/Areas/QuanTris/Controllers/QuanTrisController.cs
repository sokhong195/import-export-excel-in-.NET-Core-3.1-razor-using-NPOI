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
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace ImportExcelFIle.DotNETCore.Controllers
{
    [Area("QuanTris")]
    public class QuanTrisController : Controller
    {
        private readonly dbPhanCongThanhToanContext _context;
        public QuanTrisController(dbPhanCongThanhToanContext context)
        {
            _context = context;
        }

        public IActionResult Index(string Tab)
        {
            ViewData["Tab"] = Tab;
            Dictionary<string, string> parameters = HttpContext.Request.Query.Keys.Cast<string>().ToDictionary(k => k, v => HttpContext.Request.Query[v].ToString());
            TempData["QueryString"] = JsonConvert.SerializeObject(parameters);
            if (TempData["ViewGiaoViens"] != null) 
               TempData["ViewGiaoViens"] = TempData["ViewGiaoViens"];
            return View();
        }
        public async Task<PartialViewResult> GiaoViens()
        {
            int idGiaoVien = 0;
            ViewGiaoVien viewGiaoVien= new ViewGiaoVien();
            if (TempData["QueryString"] != null)
            {
                var a = JsonConvert.DeserializeObject<Dictionary<string, string>>(TempData["QueryString"].ToString());
                var strIdGiaoVien = "";
                a.TryGetValue("IdGiaoVien", out strIdGiaoVien);
                if (int.TryParse(strIdGiaoVien,out idGiaoVien))
                {
                    viewGiaoVien =await GetModel.ViewGiaoVien(idGiaoVien);
                }
                if (viewGiaoVien == null)
                {
                    viewGiaoVien = new ViewGiaoVien();
                }
            }
            if (idGiaoVien==0)
            {
                viewGiaoVien.NgaySinh = DateTime.Now;
               
            }
            return PartialView("_GiaoViens", viewGiaoVien);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrEdit([Bind("IdGiaoVien,HoTenGiaoVien,NgaySinh,IdNguoiDung,DienThoai,Email,GioiTinh")] GiaoVien giaoVien)
        {
            var result = "";
            if (ModelState.IsValid)
            {
                try
                {
                    if (giaoVien.IdGiaoVien == 0)
                    {
                        _context.Add(giaoVien);
                        await _context.SaveChangesAsync();
                        result = Message.SuccessCreate("Giáo viên");
                    }
                    else
                    {
                        _context.Update(giaoVien);
                        await _context.SaveChangesAsync();
                        result = Message.SuccessEdit("Giáo viên");
                    }
                }
                catch (Exception ex)
                {
                    result = Message.Fail(ex);
                }
                return Json(new { isValid = true, href = "GiaoViensTab&IdGiaoVien=" + giaoVien.IdGiaoVien, message = result });
            }
            IMapper mapper = AutoMapperProfile.AutoMapperConfig();
             ViewGiaoVien viewGiaoVien = mapper.Map<ViewGiaoVien>(giaoVien);
            return Json(new { isValid = false, html = Helper.RenderRazorViewToString(this, "_GiaoViens", viewGiaoVien) });
        }
        public async Task< PartialViewResult> ChucVus()
        {
                ViewData["IdChucVus"] = await GetList.HeSoChucVus();
            return PartialView("_ChucVus");
        }
        public async Task<PartialViewResult> QuyDinhSiSoLopHocPhans()
        {
            var quyDinhSiSoLopHocPhans = await GetList.QuyDinhSiSoLopHocPhans();
            return PartialView("_QuyDinhSiSoLopHocPhans", quyDinhSiSoLopHocPhans);
        }

        public async Task<PartialViewResult> QuyDinhGioChuanThucHanhs()
        {
            var quyDinhGioChuanThucHanhs = await GetList.QuyDinhGioChuanThucHanhs();
            return PartialView("_QuyDinhGioChuanThucHanhs", quyDinhGioChuanThucHanhs);
        }

        public PartialViewResult PhongTrungTams()
        {
            ViewData["IdPhongTrungTams"] = new
                SelectList(_context.PhongTrungTams
                .OrderBy(a => a.TenPhongTrungTam), "IdPhongTrungTam", "TenPhongTrungTam");
            return PartialView("_PhongTrungTams");
        }
        public PartialViewResult LoaiCongViecs()
        {
            ViewData["IdLoaiCongViecs"] = new
                SelectList(_context.LoaiCongViecs
                .OrderBy(a => a.TenLoaiCongViec), "IdLoaiCongViec", "TenLoaiCongViec");
            return PartialView("_LoaiCongViecs");
        }
        public PartialViewResult LoaiQuyDinhs()
        {
            ViewData["IdLoaiQuyDinhs"] = new
                SelectList(_context.LoaiQuyDinhs
                .OrderBy(a => a.TenLoaiQuyDinh), "IdLoaiQuyDinh", "TenLoaiQuyDinh");
            return PartialView("_LoaiQuyDinhs");
        }
        public async Task<PartialViewResult> QuyDinhs()
        {
            ViewData["IdLoaiQuyDinhs"] = new
                SelectList(_context.LoaiQuyDinhs
                .OrderBy(a => a.TenLoaiQuyDinh), "IdLoaiQuyDinh", "TenLoaiQuyDinh");
            ViewData["IdQuyDinhs"] = await GetList.QuyDinhValue(null,null, null);
            return PartialView("_QuyDinhs");
        }
        public async Task<PartialViewResult> DanhSachGiaoViens()
        {
            try
            {
                string IdKhoa = "", actionButton = "", SearchString = "", sortDirection = "asc", sortField = "Họ tên giáo viên";
                int? IdBoMon = null, page = null, pageSizeID = null, IdPhongTrungTam = null, IdChucVu=null, IdLoaiCongViec = null;
                string text = "";
                DateTime? thoiGian = null;
                if (TempData["QueryString"] != null)
                {
                    var a = JsonConvert.DeserializeObject<Dictionary<string, string>>(TempData["QueryString"].ToString());
                    a.TryGetValue("IdKhoa", out IdKhoa);
                    a.TryGetValue("actionButton", out actionButton);
                    a.TryGetValue("SearchString", out SearchString);
                    a.TryGetValue("sortDirection", out sortDirection);
                    if (sortDirection == null)
                    {
                        sortDirection = "asc";
                    }
                    a.TryGetValue("sortField", out sortField);
                    if (sortField == null)
                    {
                        sortField = "Họ tên giáo viên";
                    }
                    a.TryGetValue("IdBoMon", out text);
                    CheckData.IsPositiveInteger(text, out IdBoMon);

                    a.TryGetValue("IdPhongTrungTam", out text);
                    CheckData.IsPositiveInteger(text, out IdPhongTrungTam);

                    a.TryGetValue("IdChucVu", out text);
                    CheckData.IsPositiveInteger(text, out IdChucVu);

                    a.TryGetValue("IdLoaiCongViec", out text);
                    CheckData.IsPositiveInteger(text, out IdLoaiCongViec);

                    a.TryGetValue("page", out text);
                    CheckData.IsPositiveInteger(text, out page);

                    a.TryGetValue("pageSizeID", out text);
                    CheckData.IsPositiveInteger(text, out pageSizeID);
                    a.TryGetValue("thoiGian", out text);
                    CheckData.IsDate(text, out thoiGian);
                }
                List<ViewGiaoVien> ViewGiaoViens = null;
                if (TempData["ViewGiaoViens"] != null)
                {
                    ViewGiaoViens = JsonConvert.DeserializeObject<List<ViewGiaoVien>>(TempData["ViewGiaoViens"].ToString());
                }
                else
                {
                    ViewGiaoViens = await GetList.ViewGiaoViens(null,0,thoiGian);
                }
                TempData["msg"] = TempData["msg"];
                ViewData["IdKhoa"] = await GetList.KhoaSelectList(IdKhoa);
                ViewData["IdBoMon"] = await GetList.BoMonSelectList(IdKhoa, IdBoMon);
                ViewData["IdPhongTrungTam"] = await GetList.PhongTrungTamSelectList(IdPhongTrungTam);
                ViewData["IdLoaiCongViec"] = await GetList.LoaiCongViecSelectList(IdLoaiCongViec);
                ViewData["IdChucVu"] = await GetList.TrangThaiLamViecSelectList(IdChucVu);
                ViewData["thoiGian"] = thoiGian != null ? ((DateTime)thoiGian).ToString("yyyy-MM-dd") : "";
                ViewData["Filtering"] = "btn-outline-dark";
                //Clear the sort/filter/paging URL Cookie
                CookieHelper.CookieSet(HttpContext, "GiaoVienChiTiets", "", -1);
                if (!String.IsNullOrEmpty(IdKhoa))
                {
                    if (IdKhoa !="0")
                    {
                        ViewGiaoViens = ViewGiaoViens.Where(n => (n.ViewGiaoVienChiTiets != null && n.ViewGiaoVienChiTiets.Where(m => m.IdKhoa == IdKhoa).FirstOrDefault() != null)).ToList();
                        ViewData["Filtering"] = "btn-danger";
                    }
                }

                if (IdBoMon.HasValue)
                {
                    ViewGiaoViens = ViewGiaoViens.Where(n => (n.ViewGiaoVienChiTiets != null && n.ViewGiaoVienChiTiets.Where(m => m.IdBoMon == IdBoMon).FirstOrDefault() != null)).ToList();
                    ViewData["Filtering"] = "btn-danger";
                }

                if (IdPhongTrungTam.HasValue)
                {
                    ViewGiaoViens = ViewGiaoViens.Where(n => (n.ViewGiaoVienChiTiets != null && n.ViewGiaoVienChiTiets.Where(m => m.IdPhongTrungTam == IdPhongTrungTam).FirstOrDefault() != null)).ToList();
                    ViewData["Filtering"] = "btn-danger";
                }

                if (IdLoaiCongViec.HasValue)
                {
                    ViewGiaoViens = ViewGiaoViens.Where(n => (n.ViewGiaoVienChiTiets != null && n.ViewGiaoVienChiTiets.Where(m => m.IdLoaiCongViec == IdLoaiCongViec).FirstOrDefault() != null)).ToList(); ViewData["Filtering"] = "btn-danger";
                }
                if (IdChucVu.HasValue)
                {
                    ViewGiaoViens = ViewGiaoViens.Where(n => (n.ViewChucVuChiTiets!=null && n.ViewChucVuChiTiets.Where(m=>m.IdChucVu==IdChucVu).FirstOrDefault()!=null)).ToList();
                    ViewData["Filtering"] = "btn-danger";
                }
                if (!String.IsNullOrEmpty(SearchString))
                {
                    ViewGiaoViens = ViewGiaoViens.Where(p => p.HoTenGiaoVien.ToUpper().Contains(SearchString.ToUpper())).ToList();
                    ViewData["Filtering"] = "btn-danger";
                }
                //Before we sort, see if we have called for a change of filtering or sorting
                if (!String.IsNullOrEmpty(actionButton)) //Form Submitted so lets sort!
                {
                    page = 1;//Reset back to first page when sorting or filtering

                    if (actionButton == "Họ tên giáo viên")//Change of sort is requested
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
                if (!String.IsNullOrEmpty(sortField) && sortField.Contains("Họ tên giáo viên"))
                {
                    if (sortDirection == "asc")
                    {
                        ViewGiaoViens = ViewGiaoViens
                            .OrderBy(p => p.HoTenGiaoVien).ToList();
                    }
                    else
                    {
                        ViewGiaoViens = ViewGiaoViens
                        .OrderByDescending(p => p.HoTenGiaoVien).ToList();
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
                if (TempData["ViewGiaoViens"] != null) 
                    TempData["ViewGiaoViens"] = TempData["ViewGiaoViens"];
                ViewData["TotalOfRecord"] = ViewGiaoViens.Count();
                var pagedData = await Task.Run(() => PaginatedList<ViewGiaoVien>.CreateAsync(ViewGiaoViens, page ?? 1, pageSize));
                return await Task.Run(() => PartialView("_DanhSachGiaoViens", pagedData));
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public async Task<PartialViewResult> TrangThaiLamViecs()
        {
            ViewData["IdTrangThaiLamViecs"] =await Task.Run(()=> new
               SelectList(_context.TrangThaiLamViecs
               .OrderBy(a => a.TenTrangThaiLamViec), "IdTrangThaiLamViec", "TenTrangThaiLamViec"));
            return  PartialView("_TrangThaiLamViecs");
        }
    }
}