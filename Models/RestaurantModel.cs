namespace api.Models;
public class RestaurantModel
{
    private readonly DapperContext _dapperContext;
    public RestaurantModel(DapperContext DapperContext)
    {
        _dapperContext = DapperContext;
    }
    public async Task<IEnumerable<T>> Owners<T>(int restaurantId, int userId)
    {
        return await _dapperContext.QueryAsync<T>
        (@"SELECT * FROM Owners  WHERE userId=@userId AND restaurantId=@restaurantId",
         new { restaurantId, userId });
    }
    public async Task<IEnumerable<T>> isOwnerToRestaurant<T>(int userId)
    {
        return await _dapperContext.QueryAsync<T>
        (@"SELECT * FROM Owners  WHERE   userId=@userId",
         new { userId });
    }
    public async Task<IEnumerable<T>> OwnersAll<T>(int userId)
    {
        return await _dapperContext.QueryAsync<T>
        (@"SELECT userId as uid, restaurantId FROM Owners 
        JOIN restaurants on restaurantId=restaurants.id
         WHERE userId=@userId 
        ",
         new { userId });
    }
    public async Task<IEnumerable<T>> OwnerToSupporter<T>(int Id, int userId)
    {
        return await _dapperContext.QueryAsync<T>
        (@"SELECT * FROM Restaurant_Supporters JOIN Owners on Owners.RestaurantId=Restaurant_Supporters.RestaurantId 
         WHERE Owners.userId=@userId AND Id=@Id",
         new { userId, Id });
    }
    public async Task<IEnumerable<T>> RestaurantAccounts<T>(int restaurantId)
    {
        return await _dapperContext.QueryAsync<T>
        (@"SELECT 
            users.name,users.email,users.id, 'Owner' AS AccountType 
            FROM owners JOIN  users ON users.id = owners.userId 
            WHERE  owners.restaurantId = @restaurantId
            UNION ALL
            SELECT users.name,users.email,users.id, 'Supporter' AS AccountType 
            FROM restaurant_supporters 
            JOIN  users ON users.id = restaurant_supporters.supporterId 
            WHERE  restaurant_supporters.restaurantId = @restaurantId;",
         new { restaurantId });
    }
}