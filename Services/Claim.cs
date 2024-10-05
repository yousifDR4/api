
using Microsoft.AspNetCore.Authorization;

namespace api.Services
{
    public class Claim
    {
        public int getuserId(string userIdClaim)
        {
            if (!string.IsNullOrEmpty(userIdClaim) && int.TryParse(userIdClaim, out int parsedUserId))
            {
                return parsedUserId;
            }
            else
            {
                return 0;
            }

        }
    }
}