using Camp6MachineTestAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace Camp6MachineTestAPI.Repository
{
    public class AdminRepositoryImpl : IAdminRepository
    {
        private readonly Camp6MachineTestContext _context;

        public AdminRepositoryImpl(Camp6MachineTestContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }
        public async Task<IEnumerable<Loan>> GetAllLoansAsync()
        {
            try
            {
                if (_context != null)
                {
                    // Fetch all loans with related entities (User, BackgroundVerifications, LoanVerifications)
                    var loans = await _context.Loans
                        .Include(l => l.User) // Include User related to the loan
                        .Include(l => l.BackgroundVerifications) // Include Background Verifications
                        .Include(l => l.LoanVerifications) // Include Loan Verifications
                        .ToListAsync();
                    return loans;
                }
                // Return an empty list if _context is null
                return new List<Loan>();
            }
            catch (Exception ex)
            {
                // Log the exception (if logging is available) or handle it as needed
                Console.WriteLine($"Internal Server Error: {ex.Message}");
                return null;
            }

        }
    }
}
