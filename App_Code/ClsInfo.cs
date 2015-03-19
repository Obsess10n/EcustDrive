using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ClsInfo
/// </summary>
public class ClsInfo
{
    private string classNo;
    private string className;
    public ClsInfo(string no)
    {
        classNo = no;
        string sqlStr = "select fieldname from field where fieldid = " + classNo;
        className = SqlHelper.ExecuteScalar(System.Data.CommandType.Text,sqlStr,null).ToString();
    }

    /// <summary>
    /// 返回班级路径
    /// </summary>
    /// <returns></returns>
    public string classFilePath()
    {
        return "";
    }
}
