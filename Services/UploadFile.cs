namespace api.Seeders
{
    public class UploadFile
    {
        public string upload(IFormFile file, string folder)
        {
            List<string> allowedExtensions = new List<string> { ".jpg", ".jpeg", ".png" };
            string extension = Path.GetExtension(file.FileName);
            if (!allowedExtensions.Contains(extension))
            {
                throw new Exception("File not allowed");
            }
            long size = file.Length;
            if (size > 5 * 1024 * 1024)
            {
                throw new Exception("File size is too large");
            }
            string fileName = Guid.NewGuid().ToString() + extension;
            string filePath = Path.Combine(Directory.GetCurrentDirectory(), "..", "uploads", folder);
            string dir = Path.GetDirectoryName(filePath) ?? "";
            if (!File.Exists(filePath) && dir != "")
            {
                Directory.CreateDirectory(dir);

            }
            filePath = Path.Combine(filePath, fileName);
            // Save the file
            using (FileStream stream = new FileStream(filePath, FileMode.Create))
            {
                file.CopyTo(stream);
            }

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

                throw new Exception("File not found");
            }

        }

    }
}