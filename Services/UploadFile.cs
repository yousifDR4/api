namespace api.Seeders
{
    public class UploadFile()
    {
        public string uplaod(IFormFile file)
        {
            List<string> allowedExtensions = new List<string> { ".jpg", ".jpeg", ".png" };
            string extension = Path.GetExtension(file.FileName);
            if (!allowedExtensions.Contains(extension))
            {
                throw new Exception("file not allowed");
            }
            long size = file.Length;
            if (size > 5 * 1024 * 1024)
            {
                throw new Exception("file size is too large");
            }
            string fileName = Guid.NewGuid().ToString() + extension;
            string filePath = Path.Combine(Directory.GetCurrentDirectory(), "..", "uploads", fileName);
            using (FileStream stream = new FileStream(filePath + fileName, FileMode.Create))
            {
                file.CopyTo(stream);
                return filePath;
            }

        }
    }
}