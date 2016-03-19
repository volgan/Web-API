using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class WebContext : DbContext
    {
        // You can add custom code to this file. Changes will not be overwritten.
        // 
        // If you want Entity Framework to drop and regenerate your database
        // automatically whenever you change your model schema, please use data migrations.
        // For more information refer to the documentation:
        // http://msdn.microsoft.com/en-us/data/jj591621.aspx

        public WebContext(): base("name=WebServicesEntities1")
        {
        }

        public System.Data.Entity.DbSet<Web.Models.Phone> Phones { get; set; }

        public System.Data.Entity.DbSet<Web.Models.Laptop> Laptops { get; set; }

        public System.Data.Entity.DbSet<Web.Models.Tablet> Tablets { get; set; }

        public System.Data.Entity.DbSet<Web.Models.Customer> Customers { get; set; }

        public System.Data.Entity.DbSet<Web.Models.Order> Orders { get; set; }

        public System.Data.Entity.DbSet<Web.Models.OrderDetail> OrderDetails { get; set; }

        public System.Data.Entity.DbSet<Web.Models.Product> Products { get; set; }
    
    }
}
