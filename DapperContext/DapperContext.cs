using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using Dapper;
using MySql.Data.MySqlClient;

namespace api
{
    public class DapperContext
    {
        private readonly IConfiguration _config;

        public DapperContext(IConfiguration config)
        {
            _config = config;
        }

        public IEnumerable<T> LoadDate<T>()
        {
            using (var connection = new MySqlConnection(_config.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                return connection.Query<T>("SELECT * FROM " + typeof(T).Name);
            }
        }
    }
}