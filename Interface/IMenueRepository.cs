using api.Models;

public interface ImenuRepository
{
    Task<int> Storemenu(Menu menu);                       // Insert a new menu
    Task<Menu?> GetmenuById(int menuId);                   // Retrieve a menu by its ID
    Task<List<Menu>> GetAllmenus();                         // Retrieve all menus
    Task UpdatemenuDish(int menuId, int restaurantId, Menu menu);           // Update a specific menu dish
    Task DeletemenuItem(int menuId, int restaurantId);

}