using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace WebApplication5.Models
{
    public class Product
    {
        public int productId { get; set; }
        public string name { get; set; }
        public int price { get; set; }
        public int quantity { get; set; }
        public string category { get; set; }
    }
    public class SalesDbContext : DbContext
    {
        public DbSet<Product> Product { get; set; }

        public SalesDbContext(DbContextOptions<SalesDbContext> options)
         : base(options)
        {

        }
    }
}
