using System.Data;
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

        public async Task<IEnumerable<T>> LoadDataAsync<T>()
        {
            if (connection.State == ConnectionState.Closed)
            {
                await connection.OpenAsync();
            }

            return await connection.QueryAsync<T>("SELECT * FROM " + typeof(T).Name);
        }

        public async Task<IEnumerable<T>> QueryAsync<T>(string query, object? parameters)
        {
            if (connection.State == ConnectionState.Closed)
            {
                await connection.OpenAsync();
            }
            return await connection.QueryAsync<T>(query, parameters);
        }

        public async Task<T> QuerySingleAsync<T>(string query, object? parameters)
        {
            if (connection.State == ConnectionState.Closed)
            {
                await connection.OpenAsync();
            }
            return await connection.QuerySingleAsync<T>(query, parameters);
        }

        public async Task<int> ExecuteAsync(string query, object? parameters)
        {
            if (connection.State == ConnectionState.Closed)
            {
                await connection.OpenAsync();
            }
            return await connection.ExecuteAsync(query, parameters);
        }

        public async Task<T> GetByIdAsync<T>(int id)
        {
            string query = $"SELECT * FROM {typeof(T).Name} WHERE Id = @Id";
            if (connection.State == ConnectionState.Closed)
            {
                await connection.OpenAsync();
            }
            return await connection.QuerySingleAsync<T>(query, new { Id = id });
        }

        public async Task<IEnumerable<T1>> GetByKeyAsync<T1, T2>(string key, T2 id)
        {
            string query = $"SELECT * FROM {typeof(T1).Name} WHERE {key} = @Id";
            if (connection.State == ConnectionState.Closed)
            {
                await connection.OpenAsync();
            }
            return await connection.QueryAsync<T1>(query, new { Id = id });
        }

        public async Task<int> InsertAsync<T>(T parameters)
        {
            if (parameters != null)
            {
                List<string> keys = parameters.GetType().GetProperties().Select(p => p.Name).ToList();
                string keysString = string.Join(",", keys);

                string values = string.Join(",@", keys);
                string query = $"INSERT INTO {typeof(T).Name} ({keysString}) VALUES (@{values}); SELECT LAST_INSERT_ID();";
                if (connection.State == ConnectionState.Closed)
                {
                    await connection.OpenAsync();
                }
                return await connection.QuerySingleAsync<int>(query, parameters);
            }
            else
            {
                return 0;
            }
        }
        public async Task<int> UpdateAsync<T>(T parameters, int Id)
        {
            if (parameters != null)
            {
                List<string> keys = parameters.GetType().GetProperties().Select(p => p.Name).ToList();
                List<string> setClauses = new List<string>();
                for (int i = 0; i < keys.Count; i++)
                {
                    if (keys[i] != "Id")
                        setClauses.Add($"{keys[i]} = @{keys[i]}");
                }
                string setClause = string.Join(", ", setClauses);
                string query = $"UPDATE {typeof(T).Name} SET {setClause} WHERE Id = @Id";
                if (connection.State == ConnectionState.Closed)
                {
                    await connection.OpenAsync();
                }

                var parametersWithId = parameters.GetType().GetProperties().ToDictionary(p => p.Name, p => p.GetValue(parameters));
                parametersWithId["Id"] = Id;

                var sqlParameters = parametersWithId.Select(p => new MySqlParameter($"@{p.Key}", p.Value ?? DBNull.Value)).ToArray();

                return await connection.ExecuteAsync(query, parametersWithId);
            }
            else
            {
                return 0;
            }
        }
        public async Task<int> DeleteAsync<T>(int Id)
        {
            string query = $"DELETE FROM {typeof(T).Name} WHERE Id = @Id";
            if (connection.State == ConnectionState.Closed)
            {
                await connection.OpenAsync();
            }
            return await connection.ExecuteAsync(query, new { Id });
        }

    }

}
