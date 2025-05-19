using System;
using System.Runtime.Serialization;
using System.Text.RegularExpressions;

namespace ImportExcelFIle.DotNETCore.Utilities
{
    internal class Message
    {
        internal static string SuccessCreate(string model)
        {
            return string.Format("Tạo " + model + " thành công");
        }
        internal static string SuccessEdit(string model)
        {
            return string.Format("Sửa " + model + " thành công");
        }
        internal static string SuccessDelete(string model)
        {
            return string.Format("Xóa " + model + " thành công");
        }
        internal static string FailDuplicateName(string model,string name)
        {
            return string.Format("Lỗi: trong " + model + " đã tồn tại tên " + name);
        }
        internal static string FailDataConstraints(string model="")
        {
            return string.Format("Lỗi: Không thể xóa bản ghi này do tồn tại ràng buộc dữ liệu với bảng " + model);
        }
        internal static string Fail(Exception ex, bool removeSpecialCharacters = true)
        {
            string str = ex.InnerException == null ? ex.Message : ex.InnerException.Message;
            if (removeSpecialCharacters)
            return string.Format("Lỗi: " + RemoveSpecialCharacters(str), "error");
            return string.Format("Lỗi: " + str, "error");

        }
        public static string RemoveSpecialCharacters(string str)
        {
            return Regex.Replace(str, @"[^0-9a-zA-Z\._ ]", string.Empty, RegexOptions.Compiled);
        }

        internal static string FailNotExist(string model="")
        {
            return string.Format("Lỗi: không tồn tại " + model);
        }
    }
}