#pragma checksum "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "3f56abf91896d387aabe4a51c8931f362b4533e3"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Trainning_Index), @"mvc.1.0.view", @"/Views/Trainning/Index.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\_ViewImports.cshtml"
using ImportExcelFIle.DotNETCore;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\_ViewImports.cshtml"
using ImportExcelFIle.DotNETCore.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"3f56abf91896d387aabe4a51c8931f362b4533e3", @"/Views/Trainning/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"a198bf34cfc5a93ab6b595e60646d730070c9c29", @"/Views/_ViewImports.cshtml")]
    public class Views_Trainning_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("text-danger"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.ValidationSummaryTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_ValidationSummaryTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 1 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml"
  
    ViewData["Title"] = "Quản lý Đào tạo";
    Dictionary<string, string> listTab = new Dictionary<string, string>();
    listTab.Add("NamHocs", "Năm học");
    listTab.Add("HocKies", "Học kỳ");
    listTab.Add("BaoGioGiangDays", "Báo giờ giảng dạy");
    listTab.Add("QuyDinhs", "Quy định");

    string str = "";
    foreach (var item in listTab)
    {
        str += " case '" + item.Key.ToString() + @"Panel': $('#" + item.Key.ToString() + @"Panel').load('/Trainning/" + item.Key.ToString() + @"');break;";
    }

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n<h2>Quản lý Đào tạo</h2>\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("div", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "3f56abf91896d387aabe4a51c8931f362b4533e34147", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_ValidationSummaryTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.ValidationSummaryTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_ValidationSummaryTagHelper);
#nullable restore
#line 17 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml"
__Microsoft_AspNetCore_Mvc_TagHelpers_ValidationSummaryTagHelper.ValidationSummary = global::Microsoft.AspNetCore.Mvc.Rendering.ValidationSummary.ModelOnly;

#line default
#line hidden
#nullable disable
            __tagHelperExecutionContext.AddTagHelperAttribute("asp-validation-summary", __Microsoft_AspNetCore_Mvc_TagHelpers_ValidationSummaryTagHelper.ValidationSummary, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral(@"
<div>
    <!-- Nav tabs -->
    <ul class=""nav nav-tabs"" id=""myTabs"" role=""tablist"">
        <li class=""nav-item"">
            <a href=""#DefaultPanel"" aria-controls=""DefaultTab"" role=""tab"" class=""nav-link active"" name=""DefaultTab"" data-toggle=""tab"" aria-selected=""false""> </a>
        </li>
");
#nullable restore
#line 24 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml"
         foreach (var item in listTab)
        {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <li class=\"nav-item\">\r\n                <a");
            BeginWriteAttribute("href", " href=\"", 1033, "\"", 1066, 3);
            WriteAttributeValue("", 1040, "#", 1040, 1, true);
#nullable restore
#line 27 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml"
WriteAttributeValue("", 1041, item.Key.ToString(), 1041, 20, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 1061, "Panel", 1061, 5, true);
            EndWriteAttribute();
            BeginWriteAttribute("id", " id=\"", 1067, "\"", 1095, 2);
#nullable restore
#line 27 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml"
WriteAttributeValue("", 1072, item.Key.ToString(), 1072, 20, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 1092, "Tab", 1092, 3, true);
            EndWriteAttribute();
            BeginWriteAttribute("aria-controls", " aria-controls=\"", 1096, "\"", 1135, 2);
#nullable restore
#line 27 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml"
WriteAttributeValue("", 1112, item.Key.ToString(), 1112, 20, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 1132, "Tab", 1132, 3, true);
            EndWriteAttribute();
            WriteLiteral(" role=\"tab\" class=\"nav-link\"");
            BeginWriteAttribute("name", " name=\"", 1164, "\"", 1196, 2);
#nullable restore
#line 27 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml"
WriteAttributeValue("", 1171, item.Key.ToString(), 1171, 20, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 1191, "Panel", 1191, 5, true);
            EndWriteAttribute();
            WriteLiteral(" data-toggle=\"tab\" aria-selected=\"false\">");
#nullable restore
#line 27 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml"
                                                                                                                                                                                                                          Write(item.Value);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a>\r\n            </li>\r\n");
#nullable restore
#line 29 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml"
        }

#line default
#line hidden
#nullable disable
            WriteLiteral(@"    </ul>

    <!-- Tab panes -->
    <div class=""tab-content"">
        <div role=""tabpanel"" class=""tab-pane fade ml-3 show active"" id=""DefaultPanel"">
            <br />
            <h4>
                Chọn nhiệm vụ cần thực hiện
            </h4>
        </div>
");
#nullable restore
#line 40 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml"
         foreach (var item in listTab)
        {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <div role=\"tabpanel\" class=\"tab-pane fade ml-3\"");
            BeginWriteAttribute("id", " id=\"", 1669, "\"", 1699, 2);
#nullable restore
#line 42 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml"
WriteAttributeValue("", 1674, item.Key.ToString(), 1674, 20, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 1694, "Panel", 1694, 5, true);
            EndWriteAttribute();
            BeginWriteAttribute("aria-labelledby", " aria-labelledby=\"", 1700, "\"", 1744, 2);
#nullable restore
#line 42 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml"
WriteAttributeValue("", 1718, item.Key.ToString(), 1718, 20, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 1738, "-Panel", 1738, 6, true);
            EndWriteAttribute();
            WriteLiteral(">\r\n                <br />\r\n            </div>\r\n");
#nullable restore
#line 45 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml"
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </div>\r\n</div>\r\n<hr />\r\n<br />\r\n\r\n");
            DefineSection("Scripts", async() => {
                WriteLiteral("\r\n    <script type=\"text/javascript\">\r\n        function refreshTab(activeTab) {\r\n            switch (activeTab) {\r\n                ");
#nullable restore
#line 55 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml"
           Write(Html.Raw(@str));

#line default
#line hidden
#nullable disable
                WriteLiteral(@"
                default: break;
            };
            return;
        };
        $('.nav-link').click( function () {
            var activeTab = $(this).attr(""name"");
            refreshTab(activeTab);
        });
        $("".tab-content"").on(""click"","".linkClick"", function (event) {
            event.preventDefault();
            var address = $(this).attr(""href"");
            var lookup = address.split(""/"")[1];
            var id = $(""#""  + ""Id""+ lookup).val();
            var caption = $(""#"" + lookup).html();
            if (id == null) {
                alert(""Lỗi: chưa chọn giá trị "" + caption + "" trong danh sách!"");
            } else {
                window.location.href = address + ""/"" + id;
            }
        });
        $(function () {
            setTimeout(function () {
                $(""#");
#nullable restore
#line 78 "D:\huhuhu\ImportExcelFIle.DotNETCore\Views\Trainning\Index.cshtml"
               Write(ViewData["Tab"]);

#line default
#line hidden
#nullable disable
                WriteLiteral("\").trigger(\'click\');\r\n            }, 3);\r\n        });\r\n    </script>\r\n");
            }
            );
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591
