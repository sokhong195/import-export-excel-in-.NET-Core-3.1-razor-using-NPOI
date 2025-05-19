using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Utilities
{
    public static class ProcessFile
    {

        public static void CopyFileToFolder(string folderName, string fileName, IFormFile file, IWebHostEnvironment _hostingEnvironment)
        {
            string webRootPath = _hostingEnvironment.WebRootPath;
            string newPath = Path.Combine(webRootPath, folderName);
            StringBuilder sb = new StringBuilder();
            if (!Directory.Exists(newPath))
            {
                Directory.CreateDirectory(newPath);
            }
            if (file.Length > 0)
            {
                string fullPath = Path.Combine(newPath, fileName);
                using (var stream = new FileStream(fullPath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
            }
        }
        public static async Task<byte[]> DownloadFile(string folderName, string fileName, IWebHostEnvironment _hostingEnvironment)
        {
            string webRootPath = _hostingEnvironment.WebRootPath;
            string newPath = Path.Combine(webRootPath, folderName);
            StringBuilder sb = new StringBuilder();
            if (!Directory.Exists(newPath))
            {
                return null;
            }
            try
            {
                string fullPath = Path.Combine(newPath, fileName);
                using (var stream = new FileStream(fullPath, FileMode.Open))
                {
                    MemoryStream memory = new MemoryStream();
                    await stream.CopyToAsync(memory);
                    return await Task.Run(()=>memory.ToArray());
                }
            }
            catch (System.Exception)
            {
                return null;
            }
        }
        public static async Task<byte[]> DownloadFile(string folderName, string fileName)
        {
            string webRootPath = @"wwwroot"; 
            string newPath = Path.Combine(webRootPath, folderName);
            StringBuilder sb = new StringBuilder();
            if (!Directory.Exists(newPath))
            {
                return null;
            }
            try
            {
                string fullPath = Path.Combine(newPath, fileName);
                using (var stream = new FileStream(fullPath, FileMode.Open))
                {
                    MemoryStream memory = new MemoryStream();
                    await stream.CopyToAsync(memory);
                    return await Task.Run(() => memory.ToArray());
                }
            }
            catch (System.Exception)
            {
                return null;
            }
        }
        internal static async Task<string> DeleteFile(string folderName, string fileName, IWebHostEnvironment _hostingEnvironment)
        {
            string webRootPath = _hostingEnvironment.WebRootPath;
            string newPath = Path.Combine(webRootPath, folderName);
            if (!Directory.Exists(newPath))
            {
                return "Không tồn tại thưc mục" + folderName;
            }
            string fullPath = Path.Combine(newPath, fileName);
            FileInfo file = new FileInfo(fullPath);
            if (file.Exists)//check file exsit or not  
            {
                await Task.Run(()=> file.Delete());
                return "Xóa tập tin thành công";
            }
            else
            {
                return "Không tồn tại tập tin cần xóa";
            }
        }
    }
}
