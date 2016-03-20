using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web.Filter
{
    public class Filter : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext ctx)
        {
            var msg = ctx.ActionDescriptor.ControllerDescriptor.ControllerType.Name + "." + ctx.ActionDescriptor.ActionName +
                "DateTime: " + ctx.HttpContext.Timestamp;
            System.IO.File.WriteAllText(@"C:\Users\nhat\Desktop\log.txt", msg);
            base.OnActionExecuting(ctx);
        }
        public override void OnActionExecuted(ActionExecutedContext ctx)
        {
            var msg = ctx.ActionDescriptor.ControllerDescriptor.ControllerType.Name + "." + ctx.ActionDescriptor.ActionName +
                "DateTime: " + ctx.HttpContext.Timestamp;
            System.IO.File.WriteAllText(@"C:\Users\nhat\Desktop\log1.txt", msg);
            base.OnActionExecuted(ctx);
        }
    }
}