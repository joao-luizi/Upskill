using CarStandWebAPI.Models;
using DalPro;
using Microsoft.Data.SqlClient;

namespace CarStandWebAPI.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly ILogger<UserRepository> _logger;
        public UserRepository(ILogger<UserRepository> logger)
        {
            _logger = logger;
        }
        public List<Users> GetAll()
        {
            string sql = "SELECT * FROM Users";

            return DALPro.Query<Users>(sql);
        }

        public Users? GetById(long id)
        {
            string sql = "SELECT (ID_User, UserName, PassWord, Role) FROM Users WHERE User_ID=@id";

            var param = new Dictionary<string, object>
        {
            {"@id", id}
        };

            return DALPro.Query<Users>(sql, param).FirstOrDefault();
        }

        public long Insert(Users p)
        {
            SqlTransaction? trans = null;
            try
            {
            trans = DALPro.BeginTransaction();
            string sql = @"INSERT INTO Users
                       (UserName, PassWord, Role)
                       VALUES
                       (@UserName, @PassWord, @Role);

                       SELECT SCOPE_IDENTITY();";

            var param = new Dictionary<string, object>
        {
            {"@UserName", p.UserName},
            {"@PassWord", p.PassWord},
            {"@Role", p.Role}
        };
            long ret = Convert.ToInt64(DALPro.ExecuteScalar(sql, param, trans));
                DALPro.Commit(trans);
            return ret;
            }
            catch(Exception ex)
            {
                if (trans != null)
                    DALPro.Rollback(trans);
                _logger.LogError(ex, "Error on Insert User");
                throw;
            }
        }
        public void Update(Users p)
        {
            SqlTransaction? trans = null;
            try
            {
                trans = DALPro.BeginTransaction();
            string sql = @"UPDATE Users
                       SET UserName=@UserName,
                           PassWord=@PassWord
                       WHERE Role=@Role";

            var param = new Dictionary<string, object>
        {
            {"@UserName", p.UserName},
            {"@PassWord", p.PassWord},
            {"@Role", p.Role}
        };

                DALPro.Execute(sql, param, trans);
                DALPro.Commit(trans);
            }
            catch(Exception ex)
            {
                if (trans != null)
                    DALPro.Rollback(trans);
                _logger.LogError(ex, "Error on Update User");
                throw;
            }
        }

        public void Delete(int id)
        {
            SqlTransaction? trans = null;

            try
            {
                trans = DALPro.BeginTransaction();
            string sql = "DELETE FROM Users WHERE User_ID=@id";

            var param = new Dictionary<string, object>
        {
            {"@id", id}
        };

            DALPro.Execute(sql, param, trans);
                DALPro.Commit(trans);
            }
            catch(Exception ex)
            {
                if (trans != null)
                    DALPro.Rollback(trans);
                _logger.LogError(ex, "Error on Delete User");
                throw;
            }
        }

        public Users? GetByLogin(string UserName, string PassWord)
        {
            string sql = "SELECT [ID_User], [UserName], [PassWord], [Role] FROM Users WHERE UserName=@UserName AND PassWord=@PassWord";

            var param = new Dictionary<string, object>
            {
                {"@UserName", UserName},
                {"@PassWord", PassWord}
            };

            return DALPro.Query<Users>(sql, param).FirstOrDefault();
        }
    }
}
