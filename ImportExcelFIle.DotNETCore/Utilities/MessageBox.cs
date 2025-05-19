using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Utilities
{
    public class MessageBox
    {
        internal static string SuccessCreate(string model)
        {
           return string.Format("MessageBox('{0}');", "Tạo "+model+" thành công");
        }
        internal static string SuccessEdit(string model)
        {
            return string.Format("MessageBox('{0}');", "Cập nhật " + model + " thành công");
        }
        internal static string SuccessDelete(string model)
        {
            return string.Format("MessageBox('{0}');", "Xóa " + model + " thành công");
        }
        internal static string Fail(Exception ex)
        {
            string str = ex.InnerException==null? ex.Message: ex.InnerException.Message;
            return string.Format("MessageBox('{0}','{1}');", @"Lỗi: " + RemoveSpecialCharacters(str),"error");
        }
        public static string RemoveSpecialCharacters(string str)
        {
            return Regex.Replace(str, @"[^0-9a-zA-Z\._ ]", string.Empty, RegexOptions.Compiled);
        }
        internal static string Fail(string msg)
        {
            return string.Format("MessageBox('{0}','error');", msg);
        }

        internal static object Success(string msg)
        {
            return string.Format("MessageBox('{0}');", msg);

        }
    }
}
