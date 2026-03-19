using CarStandWebAPI.Models;
using Microsoft.Data.SqlClient;

namespace CarStandWebAPI.Repositories
{
    public interface IUserRepository
    {
        List<Users> GetAll();

        Users? GetById(long id);

        Users? GetByLogin(string UserName, string PassWord);

        long Insert(Users user);

        void Update(Users user);

        void Delete(int id);
    }
}
