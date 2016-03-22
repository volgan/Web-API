using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Web.Models;

namespace Web.Controllers
{
    [System.Web.Http.Cors.EnableCors(origins: "*", headers: "*", methods: "*")]
    [Web.Filter.Log]
    [RoutePrefix("api/Comment")]
    public class CommentController : ApiController
    {
        private WebContext db = new WebContext();

        // GET api/Comment
        [Route("")]
        public IQueryable<Comment> GetComments()
        {
            return db.Comments;
        }

        // GET api/Comment/5
        [Route("{id:int}")]
        [ResponseType(typeof(Comment))]
        [HttpGet]
        public IHttpActionResult Comment(int id)
        {
            Comment comment = db.Comments.Find(id);
            if (comment == null)
            {
                return NotFound();
            }

            return Ok(comment);
        }

        // GET api/Comment/5
        [Route("{ProductID:length(1,50)}")]
        [ResponseType(typeof(Comment))]
        [HttpGet]
        public IHttpActionResult Comment(string ProductID)
        {
            var query = (from cmt in db.Comments
                         where cmt.ProductID.Equals(ProductID)
                         select cmt).ToArray();
            Comment[] comments;
            if (query.Length > 0)
            {
                comments = new Comment[query.Length];
                for (int i = 0; i < query.Length; i++)
                {
                    comments[i] = query[i];
                }
                return Ok(comments);
            }

            return NotFound();
        }
        // PUT api/Comment/5
        [Route("{id:int}")]
        [HttpPut]
        public IHttpActionResult Comment(int id, Comment comment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != comment.CommentID)
            {
                return BadRequest();
            }

            db.Entry(comment).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CommentExists(id))
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

        // POST api/Comment
        
        [HttpPost]
        [Route("")]
        [ResponseType(typeof(Comment))]
        public IHttpActionResult Comment(Comment comment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Comments.Add(comment);
            db.SaveChanges();

            return Ok(comment);
        }

        // DELETE api/Comment/5
        [ResponseType(typeof(Comment))]
        public IHttpActionResult DeleteComment(int id)
        {
            Comment comment = db.Comments.Find(id);
            if (comment == null)
            {
                return NotFound();
            }

            db.Comments.Remove(comment);
            db.SaveChanges();

            return Ok(comment);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CommentExists(int id)
        {
            return db.Comments.Count(e => e.CommentID == id) > 0;
        }
    }
}