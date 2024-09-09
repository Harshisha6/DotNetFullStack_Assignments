using Microsoft.EntityFrameworkCore;

namespace WebApplication2.Models
{
    public class Product
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int UnitPrice { get; set; }
        public int Quantity { get; set; }
        public string Category { get; set; }
    }

    public class SalesDbContext : DbContext
    {
        public DbSet<Product> Products { get; set; }

        public SalesDbContext(DbContextOptions<SalesDbContext> options)
         : base(options)
        {

        }
    }
}