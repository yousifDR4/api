namespace api.Models
{
    public class UsersModels 
    {
        public DapperContext dapperContext;
        public UsersModels(IConfiguration configuration)
        {

            dapperContext = new DapperContext(configuration);
        }
    }
}