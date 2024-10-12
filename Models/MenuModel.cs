namespace api.Models
{
    public class MenuModel
    {
        private readonly DapperContext _dapperContext;
        public MenuModel(DapperContext DapperContext)
        {
            _dapperContext = DapperContext;
        }
        public async Task<IEnumerable<object>> getResturantMenu(int restaurantId)
        {
            return await _dapperContext.QueryAsync<object>
            (@"SELECT menu.*, food_category.name AS categoryName 
                    FROM menu
                    LEFT JOIN food_category ON menu.foodCategoryId = food_category.id
                    WHERE menu.restaurantId = @restaurantId;",
             new { restaurantId });
        }
    }
}