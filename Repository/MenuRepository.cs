using api.Models;

namespace api.Repository
{
        public class menuRepository : ImenuRepository
        {
            private readonly DapperContext _context;

            public menuRepository(DapperContext context)
            {
                _context = context;
            }

            public async Task<int> Storemenu(Menu menu)
            {
                return await _context.InsertAsync(menu);
            }

            public async Task<Menu?> GetmenuById( int menuId)
            {
                Menu ismenu = await _context.GetByIdAsync<Menu>(menuId);
                return ismenu;
            }

            public async Task<List<Menu>> GetAllmenus()
            {
                return (await _context.LoadDataAsync<Menu>()).ToList();
            }

            public async Task UpdatemenuDish(int menuId, int restaurantId, Menu menu)
            {
                Menu ismenu = await _context.GetByIdAsync<Menu>(menuId);
                if (ismenu == null)
                {
                    throw new Exception("menu not found");
                }
                if (ismenu.RestaurantId != restaurantId)
                {
                    throw new Exception("not authorized");
                }
                await _context.InsertAsync(menu);
            }

            public async Task DeletemenuItem(int menuId, int restaurantId)
            {
                Menu menu = await _context.GetByIdAsync<Menu>(menuId);
                if (menu == null)
                {
                    throw new Exception("menu not found");
                }
                if (menu.RestaurantId != restaurantId)
                {
                    throw new Exception("not authorized");
                }
                await _context.DeleteAsync<Menu>( menuId);
            }
        }
    

}