using System.Data;

namespace Backendv2.Services
{
    public interface IDbConnectionService
    {
        IDbConnection Create();
    }
}