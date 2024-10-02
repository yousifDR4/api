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

        public IEnumerable<T> Query<T>(string query, object? parameters)
        {
            using (connection)
            {
                connection.Open();
                return connection.Query<T>(query, parameters);
            }
        }
        public T QuerySingle<T>(string query, object? parameters)
        {
            using (connection)
            {
                connection.Open();
                return connection.QuerySingle<T>(query, parameters);
            }
        }

        public int Execute(string query, object? parameters)
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
        public IEnumerable<T1> GetBykey<T1, T2>(string key, T2 id)
        {
            string query = $"SELECT * FROM {typeof(T1).Name} WHERE {key} = @Id";
            using (connection)
            {
                connection.Open();
                return connection.Query<T1>(query, new
                {
                    Id = id
                });
            }
        }
        public int Insert<T>(T parameters)
        {
            if (parameters != null)
            {
                List<string> keys = parameters.GetType().GetProperties().Select(p => p.Name).ToList();
                string keysString = string.Join(",", keys);
                string values = string.Join(",@", keys);
                string query = $"INSERT INTO {typeof(T).Name} ({keysString}) VALUES (@{values}); SELECT LAST_INSERT_ID();";
                using (connection)
                {
                    connection.Open();
                    return connection.QuerySingle<int>(query, parameters);
                }
            }
            else
            {
                return 0;
            }
        }

    }
}