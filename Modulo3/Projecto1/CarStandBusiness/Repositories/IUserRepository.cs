using CarStandBusiness.Models;


namespace CarStandBusiness.Repositories
{
    public interface IUserRepository
    {
        List<Users> GetAll(string tag);

        Users? GetById(long id, string tag);

        Users? GetByLogin(string UserName, string PassWord , string tag);

        long Insert(Users user, string tag);

        void Update(Users user, string tag);

        void Delete(int id, string tag);
    }
}
