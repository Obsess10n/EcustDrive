<%@ WebHandler Language="C#" Class="GetSession" %>

using System;
using System.Web;
using System.Web.SessionState;

public class GetSession : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        
        //首先要确保有session
        if (context.Session["UserInfo"] != null)
        {
            int mission = Int32.Parse(context.Request["mission"]);

            //不同mission返回不同json
            if (mission == 1)//只返回姓名
            {
                string name = (context.Session["UserInfo"] as UserInfo).Name;
                string jsonArr = "{\"exist\":\"1\",\"name\":\"" + name + "\"}";
                context.Response.Write(jsonArr);
            }
            else if (mission == 2)
            {
                string jsonArr = "";
                context.Response.Write(jsonArr);
            }
        }
        else
        {
            
                
            context.Response.StatusCode = 500;//返回个错误代码，还不清楚应该返回什么……
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}