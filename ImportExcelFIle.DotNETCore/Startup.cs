using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ImportExcelFIle.DotNETCore.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Newtonsoft.Json.Serialization;
using FluentValidation.AspNetCore;
using FluentValidation;
using Microsoft.AspNetCore.Http.Features;
using ImportExcelFIle.DotNETCore.Classes;

namespace ImportExcelFIle.DotNETCore
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddTransient<IValidator<ViewNamHocHocKys>, ViewNamHocHocKysValidator>();
            services.AddControllersWithViews().AddSessionStateTempDataProvider();
            services.AddControllers().AddFluentValidation(fv => fv.RegisterValidatorsFromAssemblyContaining<ViewNamHocHocKysValidator>());
            services.AddDbContext<dbPhanCongThanhToanContext>(options =>
            options.UseSqlServer(Configuration.GetConnectionString("PhanCongThanhToanConnection")), ServiceLifetime.Transient);
            services.AddAutoMapper(typeof(AutoMapperProfile).Assembly);
            services.Configure<IISServerOptions>(options =>
            {
                options.MaxRequestBodySize = int.MaxValue;
            });
            services.AddSession();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }
            app.UseStaticFiles();
            app.UseSession();
            app.UseRouting();
            app.Use(async (context, next) =>
            {
                context.Features.Get<IHttpMaxRequestBodySizeFeature>().MaxRequestBodySize = 4294967295;
                await next.Invoke();
            });
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                   name: "abc",
                   pattern: "{controller=PhanCongGiangDays}/{action=Index}/{id?}");
                endpoints.MapAreaControllerRoute(
                    name: "default",
                    areaName: "QuanTris",
                    pattern: "{controller=QuanTris}/{action=Index}/{id?}");
                endpoints.MapAreaControllerRoute(name: "QuanTris_route",
                                     areaName: "QuanTris",
                                      pattern: "{controller=QuanTris}/{action=Index}/{id?}");


            });
        }
    }
}
