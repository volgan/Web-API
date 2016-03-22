using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using System.Threading.Tasks;
using System.Net.Http;
using System.Threading;
using System.Net;

namespace Web.Filter
{
    public class LogAttribute : Attribute, IActionFilter
    {

        public async Task<HttpResponseMessage> ExecuteActionFilterAsync(HttpActionContext ctx, CancellationToken cancellationToken, Func<Task<HttpResponseMessage>> continuation)
        {
            HttpResponseMessage resMessage = await continuation();
            string resContent = null;
            if (resMessage.Content != null)
            {
                resContent = await resMessage.Content.ReadAsStringAsync();
            }

            using (StreamWriter sw = new StreamWriter(@"d:\log.txt", true))
            {
                sw.WriteLine("Controller name : " + ctx.ActionDescriptor.ControllerDescriptor.ControllerType.Name);
                sw.WriteLine("Action name : " + ctx.ActionDescriptor.ActionName);
                sw.WriteLine("Request uri : " + ctx.Request.RequestUri);
                sw.WriteLine("Request method : " + ctx.Request.Method);
                sw.WriteLine("Response message : " + resMessage);
                sw.WriteLine("Response content : " + resContent);
                sw.WriteLine("--------------------------------------------------DateTime : " + DateTime.Now + "--------------------------------------------------");
            }


            return resMessage;
        }

        public bool AllowMultiple
        {
            get { throw new NotImplementedException(); }
        }
    }
}