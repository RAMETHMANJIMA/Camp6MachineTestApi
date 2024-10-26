using Camp6MachineTestAPI.Models; // Ensure to include your models namespace
using Camp6MachineTestAPI.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Camp6MachineTestAPI.Controllers
{
    [Route("api/[controller]")] // Set the route prefix for API endpoints
    [ApiController] // Enables API-specific features
    public class LoginsController : ControllerBase
    {
        private readonly ILoginRepository _loginRepository; // Change to use the interface

        public LoginsController(ILoginRepository loginRepository) // Accept ILoginRepository instead of concrete implementation
        {
            _loginRepository = loginRepository ?? throw new ArgumentNullException(nameof(loginRepository)); // Handle null input
        }

        // POST: api/logins/validate
        [HttpPost("validate")]
        public async Task<ActionResult<User>> ValidateUser([FromBody] UserLoginDto loginDto)
        {
            if (loginDto == null || string.IsNullOrWhiteSpace(loginDto.Username) || string.IsNullOrWhiteSpace(loginDto.Password))
            {
                return BadRequest("Invalid login request.");
            }

            var user = await _loginRepository.ValidateUser(loginDto.Username, loginDto.Password);

            if (user == null)
            {
                return Unauthorized("Invalid username or password.");
            }

            // You can return the user object or a token as per your design.
            return Ok(user); // Return the user object or other relevant data.
        }
    }

    // DTO for login request
    public class UserLoginDto
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
