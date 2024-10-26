using Camp6MachineTestAPI.Models;

namespace Camp6MachineTestAPI.Repository
{
    public interface IAdminRepository
    {
        // Method to retrieve all loans with related entities
        Task<IEnumerable<Loan>> GetAllLoans();
    }
}
