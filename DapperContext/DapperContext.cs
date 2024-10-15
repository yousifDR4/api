using System.ComponentModel;
using System.Data;
using Dapper;
using MySql.Data.MySqlClient;
using Serilog;
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
        public async Task CloseConnection()
        {
            if (connection.State == ConnectionState.Open)
            {
                await connection.CloseAsync();
              
            }

        }

        public async Task<IEnumerable<T>> LoadDataAsync<T>()
        {
            if (connection.State == ConnectionState.Closed)
            {
                try
                {
                    await connection.OpenAsync();
                }
                catch (System.Exception e)
                {

                    Log.Fatal("Error in LoadDataAsync {@e}", e);
                    throw new Exception("Error in LoadDataAsync", e);
                }
            }
            IEnumerable<T> Data = await connection.QueryAsync<T>("SELECT * FROM " + typeof(T).Name);
            await CloseConnection();
            return Data;
        }

        public async Task<IEnumerable<T>> QueryAsync<T>(string query, object? parameters)
        {
            if (connection.State == ConnectionState.Closed)
            {
                try
                {
                    await connection.OpenAsync();
                }
                catch (System.Exception e)
                {
                    Log.Fatal("Error in QueryAsync when oppening connection  {@e}", e);
                    throw new Exception("Error in QueryAsync when oppening connectionc", e);
                }
            }
            IEnumerable<T> data = await connection.QueryAsync<T>(query, parameters);
            await CloseConnection();
            return data;
        }

        public async Task<T> QuerySingleAsync<T>(string query, object? parameters)
        {
            if (connection.State == ConnectionState.Closed)
            {
                try
                {
                    await connection.OpenAsync();
                }
                catch (System.Exception e)
                {
                    Log.Fatal("Error inQuerySingleAsync when oppening connection  {@e}", e);
                    throw new Exception("Error in QuerySingleAsync when oppening connectionc", e);
                }

            }
            T row = await connection.QuerySingleAsync<T>(query, parameters);
            await CloseConnection();
            return row;
        }

        public async Task<int> ExecuteAsync(string query, object? parameters)
        {
            if (connection.State == ConnectionState.Closed)
            {
                await connection.OpenAsync();
            }
            int id = await connection.ExecuteAsync(query, parameters);
            await CloseConnection();
            return id;
        }

        public async Task<T> GetByIdAsync<T>(int id)
        {
            string query = $"SELECT * FROM {typeof(T).Name} WHERE Id = @Id";
            if (connection.State == ConnectionState.Closed)
            {
                try
                {
                    await connection.OpenAsync();
                }
                catch (System.Exception e)
                {

                    Log.Fatal("Error in GetByIdAsync when oppening connection  {@e}", e);
                    throw new Exception("Error in GetByIdAsync when oppening connectionc", e);
                }
            }
            T row = await connection.QuerySingleAsync<T>(query, new { Id = id });
            await CloseConnection();
            return row;
        }


        public async Task<IEnumerable<T1>> GetByKeyAsync<T1, T2>(string key, T2 id)
        {
            string query = $"SELECT * FROM {typeof(T1).Name} WHERE {key} = @Id";
            if (connection.State == ConnectionState.Closed)
            {
                try
                {
                    await connection.OpenAsync();

                }
                catch (System.Exception e)
                {
                    Log.Fatal("Error in GetByIdAsync when oppening connection  {@e}", e);
                    throw new Exception("Error in GetByIdAsync when oppening connectionc", e);

                }
            }
            IEnumerable<T1> data = await connection.QueryAsync<T1>(query, new { Id = id });
            await CloseConnection();
            return data;
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
                    try
                    {
                        await connection.OpenAsync();
                    }
                    catch (System.Exception e)
                    {

                        Log.Fatal("Error in GetByIdAsync when oppening connection  {@e}", e);
                        throw new Exception("Error in GetByIdAsync when oppening connectionc", e);
                    }

                }
                int NewId = await connection.QuerySingleAsync<int>(query, parameters);
                await CloseConnection();
                return NewId;
            }
            else
            {
                return 0;
            }
        }
        public async Task<int> UpdateAsync<T1, T2>(T1 parameters, int Id)
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
                string query = $"UPDATE {typeof(T2).Name} SET {setClause} WHERE Id = @Id";
                if (connection.State == ConnectionState.Closed)
                {
                    try
                    {

                        await connection.OpenAsync();
                    }
                    catch (System.Exception e)
                    {
                        Log.Fatal("Error in UpdateAsync when oppening connection  {@e}", e);
                        throw new Exception("Error in UpdateAsync when oppening connectionc", e);
                    }
                }

                var parametersWithId = parameters.GetType().GetProperties().ToDictionary(p => p.Name, p => p.GetValue(parameters));
                parametersWithId["Id"] = Id;

                var sqlParameters = parametersWithId.Select(p => new MySqlParameter($"@{p.Key}", p.Value ?? DBNull.Value)).ToArray();
                int newId = await connection.ExecuteAsync(query, parametersWithId);
                await CloseConnection();
                return newId;
            }
            else
            {
                await CloseConnection();
                return 0;
            }
        }
        public async Task<int> DeleteAsync<T>(int Id)
        {
            string query = $"DELETE FROM {typeof(T).Name} WHERE Id = @Id";
            if (connection.State == ConnectionState.Closed)
            {
                try
                {

                    await connection.OpenAsync();
                }
                catch (System.Exception e)
                {

                    Log.Fatal("Error in DeleteAsync when oppening connection  {@e}", e);
                    throw new Exception("Error in DeleteAsync when oppening connectionc", e);
                }
            }
            int NewId = await connection.ExecuteAsync(query, new { Id });
            await CloseConnection();
            return NewId;
        }
        public async Task<int> DeleteMany<T>(IEnumerable<T> Ids, string q, string key = null)
        {
            List<MySqlParameter> parameters = new List<MySqlParameter>();
            var conditions = new List<string>();
            foreach (T Id in Ids)
            {
                var parameterName = $"@supporter{Id}";
                conditions.Add($"supporterId = {parameterName}");
                parameters.Add(new MySqlParameter(parameterName, Id));  // Use unique parameter name here
            }
            string conditionString = string.Join(" OR ", conditions);
            string query = $"{q} {conditionString}";
            MySqlCommand mySql = new MySqlCommand(query);
            foreach (MySqlParameter item in parameters)
            {
                mySql.Parameters.Add(item);
            }
            mySql.Connection = connection;
            if (connection.State == ConnectionState.Closed)
            {
                try
                {
                    await connection.OpenAsync();
                }
                catch (System.Exception e)
                {
                    Log.Fatal("Error in UpdateAsync when oppening connection  {@e}", e);
                    throw new Exception("Error in UpdateAsync when oppening connectionc", e);

                }
            }
            int result = await mySql.ExecuteNonQueryAsync();
            await CloseConnection();
            return result;
        }
        
    }
}
