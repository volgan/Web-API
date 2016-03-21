using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Http.Filters;

namespace Web.Filter
{
    public class LogAttribute : Attribute, IActionFilter
    {

        public System.Threading.Tasks.Task<HttpResponseMessage> ExecuteActionFilterAsync(System.Web.Http.Controllers.HttpActionContext actionContext, System.Threading.CancellationToken cancellationToken, Func<System.Threading.Tasks.Task<HttpResponseMessage>> continuation)
        {
            throw new NotImplementedException();
        }

        public bool AllowMultiple
        {
            get { throw new NotImplementedException(); }
        }
    }
}