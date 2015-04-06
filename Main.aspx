<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="Content/bootstrap.css" type="text/css" rel="stylesheet" />
    <title>Main</title><!-- 此处应显示班级 老师/学生端-->
</head>

<body>
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script src="Scripts/bootstrap.js"></script>

    <script>
        $(document).ready(function () {
            alert("It's working");
            var class1 = $("<li></li>");
            var class2 = $("<a></a>").text("班级2")
            var dropdown = $("#dropdown_classlist");
            dropdown.append(class1);
            dropdown.eq(0).append(class2);
            //$("#dropdown_classlist").append(class1);
            

            $.post("GetSession.ashx", {"mission":1}, function (data, status) {
                if (status = "success") {
                    var info = $.parseJSON(data);
                    if (info.exist == "1"){
                        $("li#showUserName").html(info.name);//其他班级信息等显示做类似处理，通过不同GetSession任务号，对应返回不同的信息来用

                        
                    }
                    else {
                        alert("抱歉,您的session似乎过期了。莫非您根本就没登陆？");
                        location.href = 'Login.html';
                    }
                }
                else {
                    alert("Ajax错误！");
                    location.href = 'Login.html';
                }
            })
        })
    </script>

    <!--反色顶部固定导航栏  以后再修改颜色-->
    <nav class="navbar  navbar-inverse">
        <div class="container">
            <!--header-->
            <div class="navbar-header">
                <!--button部分为适应手机端显示-->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">
                    <!--此处放置brand图片       <img alt="Brand" />     -->
                    Brand
                </a>
            </div>

            <!--nav links-->
            <div class="collapse navbar-collapse" id="navbar">
                <!--左侧对齐-->
                <ul class="nav navbar-nav navbar-left">
                    <li id="showUserName"></li>
                </ul>

                <!--右侧对齐，最先出现的在最右边-->
                <ul class="nav navbar-nav navbar-right">
                    <!--右侧对齐-->
                    <li class="active"></li>
                    <li><a href="#">link</a></li>
                    <li><a href="#">link</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">班级<span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu" id="dropdown_classlist">
                            <li><a href="#">班级</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="通过文件名搜索" />
                    </div>
                    <button type="submit" class="btn btn-info">搜索</button>
                </form>
            </div>

        </div>
    </nav>
    
    <div class="container">

        <!--中间content-->
        <div class="row row-offcanvas row-offcanvas-left"><!--规范代码，container里面要有个row 剩下的我也不知道什么意思-->

            <!--核心技术，对不同屏幕大小做不同响应 xs:extremely small-->
            <!--左侧边栏-->
            <div class="col-xs-6 col-sm-2 sidebar-offcanvas " id="sidebar">
                    <h4>Group1.</h4>
                    <div class="list-group  col-sm-offset-4 text-center">
                        <a href="#" class="list-group-item active">课件</a>
                        <a href="#" class="list-group-item">作业</a>
                        <a href="#" class="list-group-item">答案</a>
                    </div>
                    <h5>Group2.</h5>
                    what do you think of this, huh?
                    <div class="list-group  col-sm-offset-4 text-center">
                        <a class="list-group-item">回收站</a>
                    </div>
                
            </div>
            <!--/.sidebar-->

            <!--文件、表格信息显示-->
            <div class="col-xs-12 col-sm-10">
                <div class="row col-md-12">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-primary">上传文件</button>
                        <button type="button" class="btn btn-default">删除文件</button>
                    </div>
                </div>
                <!--/.toolbar-->

                <div class="row col-md-12">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Library</a></li>
                        <li class="active">Data</li>
                    </ol>
                </div>
                <!--/.breadcrumb-->

                <div class="row col-md-12">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th><input type="checkbox" value="" /></th>
                                <th>#</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Username</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th><input type="checkbox" value="" /></th>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <th><input type="checkbox" value="" /></th>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <th><input type="checkbox" value="" /></th>
                                <th scope="row">3</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!--/.fileview-->
            </div>
            <!--/.content-->
        </div>
        <footer class="footer text-center" style="position:absolute;bottom:0">
            <div class="container">
                <p class="text-muted">@ EcustDrive</p>
            </div>
        </footer>
    </div>
</body>
</html>
