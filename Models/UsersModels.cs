namespace api.Models
{
    public class UsersModels
    {
        public DapperContext _dapperContext;
        public UsersModels(DapperContext dapperContext)
        {

            _dapperContext = dapperContext;
        }
    }
}