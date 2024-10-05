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
}