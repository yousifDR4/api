using System.Drawing;
namespace api.Services
{
    public class UploadFile
    {
        public string upload(IFormFile file, string folder)
        {
            // Allowed file extensions
            List<string> allowedExtensions = new List<string> { ".jpg", ".jpeg", ".png" };
            string extension = Path.GetExtension(file.FileName);

            // Check if the file extension is allowed
            if (!allowedExtensions.Contains(extension))
            {
                throw new Exception("File not allowed");
            }
            long size = file.Length;
            if (size > 5 * 1024 * 1024) // 5 MB limit
            {
                throw new Exception("File size is too large");
            }
            string fileName = Guid.NewGuid().ToString() + extension;
            string directoryPath = Path.Combine(Directory.GetCurrentDirectory(), "..", "uploads", folder);

            // Ensure the directory exists
            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }
            string filePath = Path.Combine(directoryPath, fileName);

            // Save the file
            using (FileStream stream = new FileStream(filePath, FileMode.Create))
            {
                file.CopyTo(stream);
            }

            // Return the path of the saved file
            return filePath;
        }

        public string Delete(string path)
        {
            try
            {
                using (FileStream stream = new FileStream(path, FileMode.Open))
                {
                    File.Delete(path);
                }
                return "File Deleted";
            }
            catch (System.Exception)
            {

                throw new FileNotFoundException("File not found");
            }

        }
        public byte[] GetFile(string path)
        {
            if (!File.Exists(path))
            {
                throw new FileNotFoundException("File not found", path);
            }

            return File.ReadAllBytes(path);
        }
        public byte[] GetImage(string path)
        {


            if (!System.IO.File.Exists(path))
            {
                throw new FileNotFoundException("File not found");
            }

            if (!System.IO.File.Exists(path))
            {
                throw new FileNotFoundException("File not found");
            }

            return System.IO.File.ReadAllBytes(path);
        }


    }
}