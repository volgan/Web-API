using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Web.Models;

namespace Web.Controllers
{
    public class LaptopController : ApiController
    {
        private WebContext db = new WebContext();

        // GET api/Laptop
        public IQueryable<Laptop> GetLaptops()
        {
            var laptops = db.Laptops.ToList();
            return db.Laptops;
        }

        // GET api/Laptop/5
        [ResponseType(typeof(Laptop))]
        public async Task<IHttpActionResult> GetLaptop(string id)
        {
            Laptop laptop = await db.Laptops.FindAsync(id);
            if (laptop == null)
            {
                return NotFound();
            }

            return Ok(laptop);
        }

        // PUT api/Laptop/5
        public async Task<IHttpActionResult> PutLaptop(string id, Laptop laptop)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != laptop.LaptopID)
            {
                return BadRequest();
            }

            db.Entry(laptop).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LaptopExists(id))
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

        // POST api/Laptop
        [ResponseType(typeof(Laptop))]
        public async Task<IHttpActionResult> PostLaptop(Laptop laptop)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Laptops.Add(laptop);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (LaptopExists(laptop.LaptopID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = laptop.LaptopID }, laptop);
        }

        // DELETE api/Laptop/5
        [ResponseType(typeof(Laptop))]
        public async Task<IHttpActionResult> DeleteLaptop(string id)
        {
            Laptop laptop = await db.Laptops.FindAsync(id);
            if (laptop == null)
            {
                return NotFound();
            }

            db.Laptops.Remove(laptop);
            await db.SaveChangesAsync();

            return Ok(laptop);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool LaptopExists(string id)
        {
            return db.Laptops.Count(e => e.LaptopID == id) > 0;
        }
    }
}