using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void login_Click(object sender, EventArgs e)
    {
        string md5_pwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(tbxPassword.Text, "MD5");
        string sqlStr = "select * from userlist where UserName = '" + tbxUserName.Text + "'";// and UserPassword='"+md5_pwd+"'";
        
        //string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString();
        //= System.Configuration.ConfigurationSettings.AppSettings["con"].ToString();
        //SqlConnection conn = new SqlConnection(connectionString);
        //SqlCommand cmd = new SqlCommand(sqlStr, conn);
        //cmd.CommandType = System.Data.CommandType.Text;
        //conn.Open();
        //SqlHelper.ExecuteScalar()
        //SqlParameter parNull =new SqlParameter();
        //SqlHelper.ExecuteScalar(System.Data.CommandType.Text, sqlStr2, null);
        //if(cmd.ExecuteScalar() != null)

        //到数据库校验用户密码
        if(SqlHelper.ExecuteScalar(System.Data.CommandType.Text,sqlStr,null) !=  null)
        {
            UserInfo userinfo = new UserInfo(tbxUserName.Text, md5_pwd);
            Session["UserInfo"] = userinfo;
            //保存好session，根据用户类型跳转到不同页面
            if (userinfo.Type == 0)
            {
                Response.Write("<script>window.location.href='Main.aspx'</script>");
                //确定好页面逻辑后，让main作为模板，继承出teacher、student两个页面
                //则此段代码改为跳转到studnet.aspx
            }
            else if(userinfo.Type == 1)
            {
                Response.Write("<script>window.location.href='Teacher.aspx'</script>");
            }
            else
            {
                //跳转到管理员页面之类的
            }
        }
        else
        {
            //密码错误
        }
    }
}