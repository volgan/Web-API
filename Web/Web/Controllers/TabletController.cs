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
    public class TabletController : ApiController
    {
        private WebContext db = new WebContext();

        // GET api/Tablet
        public IQueryable<Tablet> GetTablets()
        {
            return db.Tablets;
        }

        // GET api/Tablet/5
        [ResponseType(typeof(Tablet))]
        public async Task<IHttpActionResult> GetTablet(string id)
        {
            Tablet tablet = await db.Tablets.FindAsync(id);
            if (tablet == null)
            {
                return NotFound();
            }

            return Ok(tablet);
        }

        // PUT api/Tablet/5
        public async Task<IHttpActionResult> PutTablet(string id, Tablet tablet)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tablet.TabletID)
            {
                return BadRequest();
            }

            db.Entry(tablet).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TabletExists(id))
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

        // POST api/Tablet
        [ResponseType(typeof(Tablet))]
        public async Task<IHttpActionResult> PostTablet(Tablet tablet)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Tablets.Add(tablet);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TabletExists(tablet.TabletID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = tablet.TabletID }, tablet);
        }

        // DELETE api/Tablet/5
        [ResponseType(typeof(Tablet))]
        public async Task<IHttpActionResult> DeleteTablet(string id)
        {
            Tablet tablet = await db.Tablets.FindAsync(id);
            if (tablet == null)
            {
                return NotFound();
            }

            db.Tablets.Remove(tablet);
            await db.SaveChangesAsync();

            return Ok(tablet);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TabletExists(string id)
        {
            return db.Tablets.Count(e => e.TabletID == id) > 0;
        }
    }
}