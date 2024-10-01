using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using Dapper;
using MySql.Data.MySqlClient;

namespace api
{
    public class DapperContext
    {
        private readonly IConfiguration _config;
        private MySqlConnection connection;

        public DapperContext(IConfiguration config)
        {
            _config = config;
            connection = new MySqlConnection(_config.GetConnectionString("DefaultConnection"));

        }

        public IEnumerable<T> LoadData<T>()
        {
            using (connection)
            {
                connection.Open();
                return connection.Query<T>("SELECT * FROM " + typeof(T).Name);
            }
        }

        public IEnumerable<T> Query<T>(string query, object parameters = null)
        {
            using (connection)
            {
                connection.Open();
                return connection.Query<T>(query, parameters);
            }
        }

        public int Execute(string query, object parameters = null)
        {
            using (connection)
            {
                connection.Open();
                return connection.Execute(query, parameters);
            }
        }
        public T GetById<T>(int id)
        {
            string query = $"SELECT * FROM {typeof(T).Name} WHERE Id = @Id";
            using (connection)
            {
                connection.Open();
                return connection.QuerySingle<T>(query, new { Id = id });
            }
        }
    }
}