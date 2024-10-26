using Camp6MachineTestAPI.Models;

namespace Camp6MachineTestAPI.Repository
{
    public interface ILoginRepository
    {
        Task<User> ValidateUser(string username, string password);
    }
}
