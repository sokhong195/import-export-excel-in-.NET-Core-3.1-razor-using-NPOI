#pragma checksum "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "a4615ad74a75500016c61edb399435340eafc9cb"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Areas_QuanTris_Views_QuanTris__TrangThaiLamViecs), @"mvc.1.0.view", @"/Areas/QuanTris/Views/QuanTris/_TrangThaiLamViecs.cshtml")]
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
#line 1 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\_ViewImports.cshtml"
using ImportExcelFIle.DotNETCore;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\_ViewImports.cshtml"
using ImportExcelFIle.DotNETCore.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"a4615ad74a75500016c61edb399435340eafc9cb", @"/Areas/QuanTris/Views/QuanTris/_TrangThaiLamViecs.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"a198bf34cfc5a93ab6b595e60646d730070c9c29", @"/Areas/QuanTris/Views/_ViewImports.cshtml")]
    public class Areas_QuanTris_Views_QuanTris__TrangThaiLamViecs : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "Delete", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("d-inline"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 1 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml"
  
    ViewData["Model"] = "Trạng thái làm việc";
    ViewData["Controller"] = "TrangThaiLamViecs";


#line default
#line hidden
#nullable disable
            WriteLiteral("<br />\r\n<div class=\"card mb-sm-3\" style=\"min-width: 18rem;\">\r\n    <h4 class=\"card-header\"");
            BeginWriteAttribute("id", " id=\"", 197, "\"", 225, 1);
#nullable restore
#line 8 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml"
WriteAttributeValue("", 202, ViewData["Controller"], 202, 23, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">Bảng ");
#nullable restore
#line 8 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml"
                                                         Write(ViewData["Model"]);

#line default
#line hidden
#nullable disable
            WriteLiteral("</h4>\r\n    <div class=\"card-body\">\r\n        ");
#nullable restore
#line 10 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml"
   Write(Html.DropDownList("Id" + @ViewData["Controller"], null, htmlAttributes: new { @size = 25, @class = "form-control" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n    </div>\r\n    <div class=\"card-footer\">\r\n        <a class=\"btn btn-primary text-white\"");
            BeginWriteAttribute("onclick", " onclick=\"", 501, "\"", 638, 5);
            WriteAttributeValue("", 511, "showInPopup(\'", 511, 13, true);
#nullable restore
#line 13 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml"
WriteAttributeValue("", 524, Url.Action("CreateOrEdit", ""+@ViewData["Controller"], 0, Context.Request.Scheme), 524, 82, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 606, "\',\'Thêm", 606, 7, true);
#nullable restore
#line 13 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml"
WriteAttributeValue(" ", 613, ViewData["Model"], 614, 18, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue(" ", 632, "mới\')", 633, 6, true);
            EndWriteAttribute();
            WriteLiteral("><i class=\"far fa-plus-square\"> Thêm ");
#nullable restore
#line 13 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml"
                                                                                                                                                                                                                       Write(ViewData["Model"]);

#line default
#line hidden
#nullable disable
            WriteLiteral("</i></a> |\r\n        <a class=\"btn btn-success text-white\"");
            BeginWriteAttribute("onclick", " onclick=\"", 751, "\"", 921, 7);
            WriteAttributeValue("", 761, "showInPopupCheckList(\'", 761, 22, true);
#nullable restore
#line 14 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml"
WriteAttributeValue("", 783, ViewData["Controller"], 783, 23, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 806, "\',\'", 806, 3, true);
#nullable restore
#line 14 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml"
WriteAttributeValue("", 809, Url.Action("CreateOrEdit", ""+@ViewData["Controller"], null, Context.Request.Scheme), 809, 85, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 894, "\',\'Sửa", 894, 6, true);
#nullable restore
#line 14 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml"
WriteAttributeValue(" ", 900, ViewData["Model"], 901, 18, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 919, "\')", 919, 2, true);
            EndWriteAttribute();
            WriteLiteral("><i class=\"far fa-edit\"> Sửa ");
#nullable restore
#line 14 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml"
                                                                                                                                                                                                                                                Write(ViewData["Model"]);

#line default
#line hidden
#nullable disable
            WriteLiteral("</i> </a> |\r\n        ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("form", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "a4615ad74a75500016c61edb399435340eafc9cb8772", async() => {
                WriteLiteral("\r\n            <button type=\"submit\" class=\"btn btn-danger text-white\"><i class=\"far fa-trash-alt\">  Xóa ");
#nullable restore
#line 16 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml"
                                                                                                 Write(ViewData["Model"]);

#line default
#line hidden
#nullable disable
                WriteLiteral("</i></button>\r\n        ");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.Action = (string)__tagHelperAttribute_0.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_0);
            BeginWriteTagHelperAttribute();
#nullable restore
#line 15 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml"
                                      WriteLiteral(ViewData["Controller"]);

#line default
#line hidden
#nullable disable
            __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.Controller = __tagHelperStringValueBuffer;
            __tagHelperExecutionContext.AddTagHelperAttribute("asp-controller", __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.Controller, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            BeginAddHtmlAttributeValues(__tagHelperExecutionContext, "onsubmit", 10, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            AddHtmlAttributeValue("", 1067, "return", 1067, 6, true);
            AddHtmlAttributeValue(" ", 1073, "jQueryAjaxDeleteCheckList(\'", 1074, 28, true);
#nullable restore
#line 15 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml"
AddHtmlAttributeValue("", 1101, ViewData["Controller"], 1101, 23, false);

#line default
#line hidden
#nullable disable
            AddHtmlAttributeValue("", 1124, "\',this,\'Xác", 1124, 11, true);
            AddHtmlAttributeValue(" ", 1135, "nhận", 1136, 5, true);
            AddHtmlAttributeValue(" ", 1140, "muốn", 1141, 5, true);
            AddHtmlAttributeValue(" ", 1145, "xóa", 1146, 4, true);
#nullable restore
#line 15 "D:\huhuhu\ImportExcelFIle.DotNETCore\Areas\QuanTris\Views\QuanTris\_TrangThaiLamViecs.cshtml"
AddHtmlAttributeValue(" ", 1149, ViewData["Model"], 1150, 18, false);

#line default
#line hidden
#nullable disable
            AddHtmlAttributeValue(" ", 1168, "này", 1169, 4, true);
            AddHtmlAttributeValue(" ", 1172, "không?\')", 1173, 9, true);
            EndAddHtmlAttributeValues(__tagHelperExecutionContext);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n    </div>\r\n</div>\r\n");
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
