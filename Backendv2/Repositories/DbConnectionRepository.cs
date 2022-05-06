using Backendv2.Options;
using Microsoft.Extensions.Options;
using MySql.Data.MySqlClient;
using System.Data;

namespace Backendv2.Repositories
{
    public class DbConnectionRepository : IDbConnectionRepository
    {
        private readonly DatabaseOptions databaseOptions;

        public DbConnectionRepository(IOptions<DatabaseOptions> databaseOptions)
        {
            this.databaseOptions = databaseOptions.Value;
        }

        public IDbConnection Create()
        {
            return new MySqlConnection(databaseOptions.ConnectionString);

        }
        public IDbConnection Delete()
        {
            return new MySqlConnection(databaseOptions.ConnectionString);

        }
    }
}
