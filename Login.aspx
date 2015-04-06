<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script src="Scripts/bootstrap.js"></script>

    <div class="container">
    <div class="row">
    <form id="formLogin" class="form-horizontal" runat="server">
    <div id="LoginBlock">
        <div class="form-group">
            <label class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" ID="tbxUserName" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxUserName" 
                    CssClass="text-danger" ErrorMessage="“用户名”字段是必填字段。" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" ID="tbxPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxPassword" 
                    CssClass="text-danger" ErrorMessage="“密码”字段是必填字段。" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <asp:CheckBox runat="server" ID="cbxRem" />
                    <label>
                        <input type="checkbox"/>记住我
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button runat="server" OnClick="login_Click" Text="登录" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
    </form>
    </div>
    </div>


</body>
</html>
