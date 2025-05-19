using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;


public static class TinhTrang
{
    public static string XacNhan = "Xác nhận";
    public static string ChoXacNhan = "Chờ xác nhận";
    public static string Huy = "Hủy xác nhận";

  public static SelectList GetListTinhTrang(string tinhTrang)
    {
        List<string> list = new List<string>();
        list.Add(ChoXacNhan);
        list.Add(XacNhan);
        list.Add(Huy);
        return new SelectList(list, tinhTrang);
    }
}