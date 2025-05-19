using ImportExcelFIle.DotNETCore.ModelViews;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Linq;
namespace ImportExcelFIle.DotNETCore.Utilities
{
    public class ExcelExportHelper
    {
        public static string ExcelContentType
        {
            get
            { return "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"; }
        }
        /// <summary>
        /// Tạo phân công cho bộ môn
        /// </summary>
        /// <param name="viewPhanCongSoGioCuaGiaoViens"></param>
        /// <param name="tenKhoa"></param>
        /// <param name="tenBoMon"></param>
        /// <param name="tenHocKy"></param>
        /// <param name="tenTruongBoMon"></param>
        /// <param name="folderName"></param>
        /// <param name="file"></param>
        public static void ExportPhanCongGiangDay(List<ViewPhanCongSoGioCuaGiaoVien> viewPhanCongSoGioCuaGiaoViens, string tenKhoa, string tenBoMon, string tenHocKy, string tenTruongBoMon="", string folderName = @"MauBieu\PhanCongGiangDay", string file = "PhanCongGiangDayHocKy2BanDau.xlsx")
        {
            try
            {
               
                ExcelPackage.LicenseContext = OfficeOpenXml.LicenseContext.NonCommercial;
                //Xác định mẫu biểu phân công
                if (tenHocKy.ToUpper().StartsWith("HỌC KỲ 1"))
                {
                    file = "PhanCongGiangDayHocKy1BanDau.xlsx";
                }
                else if (tenHocKy.ToUpper().StartsWith("HỌC KỲ 2"))
                {
                    file = "PhanCongGiangDayHocKy2BanDau.xlsx";
                }
                else
                {
                    file = "PhanCongGiangDayHocKyHeBanDau.xlsx";
                }
                //Xác định có phải là phân công bổ sung

                FileInfo fileInfo = Function.CheckExistFile(folderName, file);
                if (fileInfo != null)
                {
                    using (ExcelPackage package = new ExcelPackage())
                    {
                        using (FileStream stream = new FileStream(fileInfo.FullName, FileMode.Open))
                        {
                            package.Load(stream);
                            ExcelWorksheet workSheet = package.Workbook.Worksheets[0];
                            //Điền thông tin mẫu biểu phân công
                            workSheet.Cells["A2"].Value = "KHOA " + tenKhoa.ToUpper() ;
                            workSheet.Cells["A3"].Value = "BỘ MÔN " + tenBoMon.ToUpper();
                            workSheet.Cells["A5"].Value = tenHocKy;
                            int rowDuLieu = 10;
                            int rowGhi = rowDuLieu;
                            workSheet.Column(3).Style.WrapText = true;
                            workSheet.Column(2).Style.WrapText = true;
                            int count = 1;
                            Dictionary<string, float> sums = new Dictionary<string, float>();
                            sums["QuyDoiGioChuan"] = 0;
                            sums["TongSoGioThucHien"] = 0;
                            sums["SoGioDinhMucCongTac"] = 0;
                            sums["SoGioVuotDinhMucCongTacKy1"] = 0;
                            sums["SoGioVuotDinhMucCongTacKy2"] = 0;
                            sums["SoGioVuotDinhMucCongTacCaNam"] = 0;
                            //Thông tin cho từng giáo viên
                            foreach (var giaoVien in viewPhanCongSoGioCuaGiaoViens)
                            {
                                workSheet.Cells["B" + rowGhi.ToString()].Value = giaoVien.TenTrinhDo + ". " + giaoVien.HoTenGiaoVien + " - " + "GV";
                                workSheet.Cells[rowGhi, 1].Value = count++;
                                workSheet.Cells["O" + rowGhi.ToString()].Value = giaoVien.TongSoGioThucHien;
                                sums["TongSoGioThucHien"]+= giaoVien.TongSoGioThucHien;
                                var rowBatDau = rowGhi;
                                for (int i = 0; i < giaoVien.ViewBaoGioGiangDayChiTiets.Count(); i++)
                                {
                                    var pcgd = giaoVien.ViewBaoGioGiangDayChiTiets[i];
                                    workSheet.Cells["C" + rowGhi.ToString()].Value = pcgd.TenLopHocPhan;
                                    workSheet.Cells["D" + rowGhi.ToString()].Value = pcgd.HinhThuThi;
                                    workSheet.Cells["E" + rowGhi.ToString()].Value = pcgd.SoTinChi;
                                    workSheet.Cells["F" + rowGhi.ToString()].Value = pcgd.SiSo;
                                    workSheet.Cells["G" + rowGhi.ToString()].Value = (pcgd.SoTietLyThuyet == 0 ? pcgd.SoTietThaoLuanThiNghiemThucHanh : pcgd.SoTietLyThuyet);
                                    workSheet.Cells["H" + rowGhi.ToString()].Value = pcgd.SoNhom;
                                    workSheet.Cells["I" + rowGhi.ToString()].Value = pcgd.HuongDanTuHoc;
                                    workSheet.Cells["J" + rowGhi.ToString()].Value = pcgd.HeSoSiSoLTTHMDDA;
                                    workSheet.Cells["K" + rowGhi.ToString()].Value = pcgd.HeSoSiSoBTTNTL;
                                    workSheet.Cells["L" + rowGhi.ToString()].Value = pcgd.HeSoHDTH;
                                    workSheet.Cells["M" + rowGhi.ToString()].Value = 1.0;
                                    workSheet.Cells["N" + rowGhi.ToString()].Value = giaoVien.SoGio[i];
                                    sums["QuyDoiGioChuan"] += giaoVien.SoGio[i];
                                    rowGhi++;
                                    workSheet.InsertRow(rowGhi, 1);
                                }
                                //Gộp cột A, B, C theo hàng
                                HashSet<int> hashset1 = new HashSet<int>() { 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 };
                                foreach (var col in hashset1)
                                {
                                    if (col < 4 || col > 14)
                                    {
                                        workSheet.Cells[rowBatDau, col, rowGhi - 1, col].Merge = true;
                                    }
                                    workSheet.Cells[rowBatDau, col, rowGhi - 1, col].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                                    workSheet.Cells[rowBatDau, col, rowGhi - 1, col].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                                    if(col >= 14)
                                    {
                                        workSheet.Cells[rowBatDau, col, rowGhi - 1, col].Style.Numberformat.Format = "0.00";
                                    }
                                    if (col ==13)
                                    {
                                        workSheet.Cells[rowBatDau, col, rowGhi - 1, col].Style.Numberformat.Format = "0.0";
                                    }
                                }
                            }
                                //Xoá dòng thừa
                                workSheet.DeleteRow(rowGhi);
                                //Border
                                workSheet.Cells[rowDuLieu, 1, rowGhi, 20].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                                workSheet.Cells[rowDuLieu, 1, rowGhi, 20].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                                workSheet.Cells[rowDuLieu, 1, rowGhi, 20].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                                workSheet.Cells[rowDuLieu, 1, rowGhi, 20].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                            //Tổng 
                            workSheet.Cells[rowGhi, 14].Value = sums["QuyDoiGioChuan"];
                            workSheet.Cells[rowGhi, 15].Value = sums["TongSoGioThucHien"];
                        }
                        var filePath = Path.Combine(fileInfo.DirectoryName, tenBoMon + ".xlsx");
                        FileInfo fileInfoNew = new FileInfo(filePath);
                        package.SaveAs(fileInfoNew);
                    }
                }
                else
                {
                    throw new Exception("Không tìm thấy tập tin");
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public static System.Data.DataTable ListToDataTableHocPhan<T>(List<T> data, params string[] columnsToTake)
        {
            PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(T));
            System.Data.DataTable dataTable = new System.Data.DataTable();
            try
            {
                for (int i = 0; i < columnsToTake.Length; i++)
                {
                    PropertyDescriptor property = properties.Find(columnsToTake[i], true);
                    if (property != null)
                    {
                        if (columnsToTake[i] != "SoTinChi")
                            dataTable.Columns.Add(property.Name, Nullable.GetUnderlyingType(property.PropertyType) ?? property.PropertyType);
                        else
                        {
                            Type t = typeof(string);
                            dataTable.Columns.Add(property.Name, Nullable.GetUnderlyingType(t) ?? t);
                        }
                    }
                    else
                    {
                        throw new Exception();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
            object[] values = new object[columnsToTake.Length];
            foreach (T item in data)
            {
                for (int i = 0; i < columnsToTake.Length; i++)
                {
                    if (columnsToTake[i] != "SoTinChi")
                    {
                        values[i] = properties[columnsToTake[i]].GetValue(item);
                    }
                    else
                    {
                        values[i] = properties[columnsToTake[i]].GetValue(item).ToString() + "(" + properties["SoTietLyThuyet"].GetValue(item).ToString() + "," + properties["SoTietThaoLuanThiNghiemThucHanh"].GetValue(item).ToString() + "," + properties["SoGioChuanBiTuHoc"].GetValue(item).ToString() + ")";
                    }
                }
                dataTable.Rows.Add(values);
            }
            return dataTable;
        }
        public static byte[] ExportExcel(System.Data.DataTable dataTable, string heading = "", bool showSrNo = false, params string[] columnsToTake)
        {

            byte[] result = null;
            ExcelPackage.LicenseContext = OfficeOpenXml.LicenseContext.NonCommercial;

            using (ExcelPackage package = new ExcelPackage())
            {
                ExcelWorksheet workSheet = package.Workbook.Worksheets.Add(String.Format("{0} Data", heading));
                int startRowFrom = String.IsNullOrEmpty(heading) ? 1 : 3;

                if (showSrNo)
                {
                    DataColumn dataColumn = dataTable.Columns.Add("STT", typeof(int));
                    dataColumn.SetOrdinal(0);
                    int index = 1;
                    foreach (DataRow item in dataTable.Rows)
                    {
                        item[0] = index;
                        index++;
                    }
                }


                // add the content into the Excel file  
                workSheet.Cells["A" + startRowFrom].LoadFromDataTable(dataTable, true);

                // autofit width of cells with small content  
                int columnIndex = 1;
                foreach (DataColumn column in dataTable.Columns)
                {
                    ExcelRange columnCells;
                    try
                    {
                        columnCells = workSheet.Cells[workSheet.Dimension.Start.Row, columnIndex, workSheet.Dimension.End.Row, columnIndex];
                        int maxLength = columnCells.Max(cell => cell.Value != null ? cell.Value.ToString().Count() : 0);
                        if (maxLength < 150)
                        {
                            workSheet.Column(columnIndex).AutoFit();
                        }
                    }
                    catch (Exception ex)
                    {
                        throw;
                    }
                    columnIndex++;
                }

                // format header - bold, yellow on black  
                using (ExcelRange r = workSheet.Cells[startRowFrom, 1, startRowFrom, dataTable.Columns.Count])
                {
                    r.Style.Font.Color.SetColor(System.Drawing.Color.White);
                    r.Style.Font.Bold = true;
                    r.Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    r.Style.Fill.BackgroundColor.SetColor(System.Drawing.ColorTranslator.FromHtml("#1fb5ad"));
                }

                // format cells - add borders  
                using (ExcelRange r = workSheet.Cells[startRowFrom + 1, 1, startRowFrom + dataTable.Rows.Count, dataTable.Columns.Count])
                {
                    r.Style.Border.Top.Style = ExcelBorderStyle.Thin;
                    r.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                    r.Style.Border.Left.Style = ExcelBorderStyle.Thin;
                    r.Style.Border.Right.Style = ExcelBorderStyle.Thin;

                    r.Style.Border.Top.Color.SetColor(System.Drawing.Color.Black);
                    r.Style.Border.Bottom.Color.SetColor(System.Drawing.Color.Black);
                    r.Style.Border.Left.Color.SetColor(System.Drawing.Color.Black);
                    r.Style.Border.Right.Color.SetColor(System.Drawing.Color.Black);
                }
                if (!String.IsNullOrEmpty(heading))
                {
                    workSheet.Cells["A1"].Value = heading;
                    workSheet.Cells["A1"].Style.Font.Size = 20;
                    workSheet.Cells["A1:I1"].Merge = true;
                    workSheet.Cells[$"A1:I1"].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    workSheet.Cells[$"A1:I1"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    //workSheet.InsertColumn(1, 1);
                    //workSheet.InsertRow(1, 1);
                    //workSheet.Column(1).Width = 5;
                }

                result = package.GetAsByteArray();
            }

            return result;
        }
        public static byte[] ExportExcel<T>(List<T> data, string Heading = "", bool showSlno = false, params string[] ColumnsToTake)
        {
            return ExportExcel(ListToDataTableHocPhan<T>(data, ColumnsToTake), Heading, showSlno, ColumnsToTake);
        }
    }
}
