using api.Models;
using api.Dto;
using Microsoft.AspNetCore.Mvc;
namespace api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ReservationsController : ControllerBase
    {
        DapperContext _dapperContext;
        public ReservationsController(DapperContext dapperContext)
        {
            _dapperContext = dapperContext;
        }
        [HttpGet("")]
        public async Task<IEnumerable<Reservations>> GetAll()
        {
            return await _dapperContext.LoadDataAsync<Reservations>();
        }
        [HttpGet("/count/cancelled/{RestaurantId}")]
        public async Task<IEnumerable<ReservationsCount>> GetcancelledCount(int RestaurantId)
        {
            return await _dapperContext.QueryAsync<ReservationsCount>
            (@"SELECT  isCancelled,COUNT(*) as Count , RestaurantId  
            FROM reservations 
           WHERE RestaurantId=@RestaurantId 
           GROUP BY isCancelled", new { RestaurantId });
        }
        [HttpGet("/count/timePeriod/{RestaurantId}")]
        public async Task<IEnumerable<object>> GetcancelledTimePeriod(int RestaurantId)
        {
            return await _dapperContext.QueryAsync<object>
            (@"  SELECT
            CASE
                WHEN TIME(AttendanceTime) BETWEEN '18:00:00' AND '23:59:59' THEN 'Night'
                WHEN TIME(AttendanceTime) BETWEEN '01:00:00' AND '12:00:00' THEN 'Morning'
                WHEN TIME(AttendanceTime) BETWEEN '12:00:01' AND '17:59:59' THEN 'Afternoon'
                ELSE 'Invalid Time'
            END AS TimePeriod,
             RestaurantId, AttendanceTime, IsActive,COUNT(*) as count
            FROM reservations
            WHERE RestaurantId = 3 
            AND TIME(AttendanceTime) BETWEEN '01:00:00' AND '23:59:59' 
        GROUP BY TimePeriod", new { RestaurantId });
        }

    }
}
