using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Web.Models;

namespace Web.Controllers
{
    public class CustomerController : ApiController
    {
        private WebContext db = new WebContext();

        // GET api/Customer
        public IQueryable<Customer> GetCustomers()
        {
            return db.Customers;
        }

        // GET api/Customer/5
        [ResponseType(typeof(Customer))]
        public async Task<IHttpActionResult> GetCustomer(long id)
        {
            Customer customer = await db.Customers.FindAsync(id);
            if (customer == null)
            {
                return NotFound();
            }

            return Ok(customer);
        }

        // PUT api/Customer/5
        public async Task<IHttpActionResult> PutCustomer(long id, Customer customer)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            customer.Password = getSHA256Hash(customer.Password);
            if (id != customer.CustomerID)
            {
                return BadRequest();
            }

            db.Entry(customer).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CustomerExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST api/Customer
        [ResponseType(typeof(Customer))]
        public async Task<IHttpActionResult> PostCustomer(Customer customer)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (CustomerExists(customer.Email))
            {
                if (customer.Password.Equals("null"))
                {
                    return Conflict();
                }
                else
                {
                    customer.Password = getSHA256Hash(customer.Password);
                    if (CheckLogin(customer.Email, customer.Password) == 0)
                    {
                        return Conflict();
                    }
                    else customer.CustomerID = CheckLogin(customer.Email, customer.Password);
                }
            }
            else
            {
                customer.Password = getSHA256Hash(customer.Password);
                db.Customers.Add(customer);
                await db.SaveChangesAsync();
            }

            return CreatedAtRoute("DefaultApi", new { id = customer.CustomerID }, customer);
        }

        // DELETE api/Customer/5
        [ResponseType(typeof(Customer))]
        public async Task<IHttpActionResult> DeleteCustomer(long id)
        {
            Customer customer = await db.Customers.FindAsync(id);
            if (customer == null)
            {
                return NotFound();
            }

            db.Customers.Remove(customer);
            await db.SaveChangesAsync();

            return Ok(customer);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CustomerExists(String email)
        {
            return db.Customers.Count(e => e.Email == email) > 0;
        }
        private bool CustomerExists(long ID)
        {
            return db.Customers.Count(e => e.CustomerID == ID) > 0;
        }
        private long CheckLogin(String email, String password)
        {
            var query = (from cus in db.Customers
                         where
                             (cus.Email.Equals(email) && cus.Password.Equals(password))
                         select cus.CustomerID).ToList();
            for (int i = 0; i < query.Count; i++)
            {
                return query[i];
            }
            return 0;
        }
        private String getSHA256Hash(String password)
        {
            SHA256Managed sha256 = new SHA256Managed();
            byte[] data = Encoding.UTF8.GetBytes(password);
            byte[] result = sha256.ComputeHash(data);
            StringBuilder strBuilder = new StringBuilder();
            foreach (byte b in result)
            {
                strBuilder.Append(b.ToString("x1").ToLower());
            }
            return strBuilder.ToString();
        }
    }
}