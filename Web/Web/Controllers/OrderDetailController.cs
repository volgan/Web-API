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
    [System.Web.Http.Cors.EnableCors(origins: "*", headers: "*", methods: "*")]
    [Web.Filter.Log]
    public class OrderDetailController : ApiController
    {
        private WebContext db = new WebContext();

        // GET api/OrderDetail
        public IQueryable<OrderDetail> GetOrderDetails()
        {
            return db.OrderDetails;
        }

        // GET api/OrderDetail/5
        [ResponseType(typeof(OrderDetail))]
        public async Task<IHttpActionResult> GetOrderDetail(int id)
        {

            //OrderDetail orderdetail = await db.OrderDetails.FindAsync(id);

            //if (orderdetail == null)
            //{
            //    return NotFound();
            //}

            //return Ok(orderdetail);
            OrderDetail[] orderdetail;
            var query = (from orderDetail in db.OrderDetails
                         where orderDetail.OrderID.Equals(id)
                         select orderDetail).ToArray();
            if (query.Length > 0)
            {
                orderdetail = new OrderDetail[query.Length];
                for (int i = 0; i < query.Length; i++)
                {
                    orderdetail[i] = query[i];
                }
                return Ok(orderdetail);
            }

            return NotFound();
        }

        // PUT api/OrderDetail/5
        public async Task<IHttpActionResult> PutOrderDetail(int id, OrderDetail orderdetail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != orderdetail.OrderID)
            {
                return BadRequest();
            }

            db.Entry(orderdetail).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OrderDetailExists(id))
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

        // POST api/OrderDetail
        [ResponseType(typeof(OrderDetail))]
        public async Task<IHttpActionResult> PostOrderDetail(OrderDetail orderdetail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.OrderDetails.Add(orderdetail);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (OrderDetailExists(orderdetail.OrderID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = orderdetail.OrderID }, orderdetail);
        }

        // DELETE api/OrderDetail/5
        [ResponseType(typeof(OrderDetail))]
        public async Task<IHttpActionResult> DeleteOrderDetail(int id)
        {
            OrderDetail orderdetail = await db.OrderDetails.FindAsync(id);
            if (orderdetail == null)
            {
                return NotFound();
            }

            db.OrderDetails.Remove(orderdetail);
            await db.SaveChangesAsync();

            return Ok(orderdetail);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool OrderDetailExists(int id)
        {
            return db.OrderDetails.Count(e => e.OrderID == id) > 0;
        }
    }
}