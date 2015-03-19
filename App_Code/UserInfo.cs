using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for UserInfo
/// </summary>
public class UserInfo
{
    private string username;
    private string pwd;
    private int type;
    private string name;
    private List<ClsInfo> classList;

    public UserInfo(string s1, string s2)
    {
        username = s1;
        pwd = s2;

        //连接数据库，获得用户类型及班级信息
        string sqlStr = "select MasterFlag from userlist where UserName = " + username;
        //SqlParameter需要using System.Data.SqlClient;
        type = (int)SqlHelper.ExecuteScalar(System.Data.CommandType.Text, sqlStr, null);
        sqlStr = "select name from userlist where UserName = " + username;
        name = (string)SqlHelper.ExecuteScalar(System.Data.CommandType.Text, sqlStr, null);
        getClassList();
    }

    public string Username
    {
        get
        {
            return username;
        }
    }

    public int Type
    {
        get
        {
            return (type);
        }
    }

    public string Name
    {
        get
        {
            return name;
        }
    }

    public void getClassList()
    {
        string field;
        string sqlStr = "select manfiled from userlist where UserName = " + username;//形如"446/ 21/"
        field = SqlHelper.ExecuteScalar(System.Data.CommandType.Text, sqlStr, null).ToString();
        string[] listfield = Regex.Split(field, "%2F", RegexOptions.IgnoreCase);
        foreach (string classno in listfield)
        {
            classList.Add(new ClsInfo(classno));
        }
    }
}