using api.Models;
using api.Dto;
using Microsoft.AspNetCore.Mvc;
namespace api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ReservationController : ControllerBase
    {
        DapperContext _dapperContext;
        public ReservationController(DapperContext dapperContext)
        {
            _dapperContext = dapperContext;


        }
        [HttpGet("")]
        public async Task<IEnumerable<Reservations>> GetAll()
        {
            return await _dapperContext.LoadDataAsync<Reservations>();
        }
        [HttpGet("count/cancelled/{RestaurantId}")]
        public async Task<IEnumerable<ReservationsCount>> GetcancelledCount(int RestaurantId)
        {
            return await _dapperContext.QueryAsync<ReservationsCount>
            (@"SELECT  isCancelled,COUNT(*) as Count , RestaurantId  
            FROM reservations 
           WHERE RestaurantId=@RestaurantId 
           GROUP BY isCancelled", new { RestaurantId });
        }

        [HttpGet("count/timePeriod/{RestaurantId}")]
        public async Task<IEnumerable<object>> GetTimePeriod(int RestaurantId)
        {
            return await _dapperContext.QueryAsync<object>
            (@"  SELECT
            CASE
                WHEN TIME(AttendanceTime) BETWEEN '18:00:00' AND '23:59:59' THEN 'Night'
                WHEN TIME(AttendanceTime) BETWEEN '01:00:00' AND '12:00:00' THEN 'Morning'
                WHEN TIME(AttendanceTime) BETWEEN '12:00:01' AND '17:59:59' THEN 'Afternoon'
                ELSE 'Invalid Time'
            END AS TimePeriod,
             RestaurantId, COUNT(*) as count
            FROM reservations
            WHERE RestaurantId = @RestaurantId
            AND TIME(AttendanceTime) BETWEEN '01:00:00' AND '23:59:59' 
        GROUP BY TimePeriod", new { RestaurantId });
        }

        [HttpGet("count/week/cancelled/{RestaurantId}")]
        public async Task<IEnumerable<object>> GetcancelledTimePeriod(int RestaurantId)
        {
            return await _dapperContext.QueryAsync<object>
         (@"SELECT 
            DAYNAME(AttendanceTime) AS DayName,
            isCancelled,
            COUNT(*) AS count 
        FROM reservations 
        WHERE RestaurantId = @RestaurantId 
        AND AttendanceTime BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 1 WEEK)
        GROUP BY DayName, isCancelled",
        new { RestaurantId });
        }



    }
}
