using Camp6MachineTestAPI.Models;
using Camp6MachineTestAPI.Repository;
using Microsoft.EntityFrameworkCore;

namespace Camp6MachineTestAPI.Repository
{
    public class LoginRepositoryImpl : ILoginRepository
    {
        private readonly Camp6MachineTestContext _context;

        public LoginRepositoryImpl(Camp6MachineTestContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task<User> ValidateUser(string username, string password)
        {
            try
            {
                // Validate user by username and password
                var user = await _context.Users
                    .FirstOrDefaultAsync(u => u.Username == username && u.Password == password);

                return user; // Return the user or null if not found
            }
            catch (Exception ex)
            {
                // Log the exception (consider using a logging framework)
                throw new Exception("An error occurred while validating the user.", ex);
            }
        }
    }
}
