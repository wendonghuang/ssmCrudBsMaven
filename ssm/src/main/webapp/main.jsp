<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2022/5/8
  Time: 1:32
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%--引用core标签库--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%
        pageContext.getSession().setAttribute("appPath", request.getContextPath());
    %>
    <link rel="stylesheet" href="${appPath}/bootstrap/css/bootstrap.css">
    <script src="${appPath}/bootstrap/js/jquery-3.4.1.min.js"></script>
    <script src="${appPath}/bootstrap/js/bootstrap.js"></script>


</head>
<body>
<%@include file="dateTools.jsp"%>
<!-- 用户修改的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input"
                                   placeholder="email@atguigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked">
                                男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>


<!-- 学生添加的模态框 -->
<div class="modal fade" id="stuAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="stu_add_form">
                    <%-- private String sno;

                         private String sname;

                            private String gender;

                             private Date birthday;

                        private String phone;

                                private String address;--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学号</label>
                        <div class="col-sm-10">
                            <input type="text" name="sno" class="form-control" id="stuName_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="sname" class="form-control" id="sname_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="男"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">出生日期</label>
                        <div class="col-sm-10">
                            <input type="text" name="birthday" class="form-control" id="birthday_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control" id="phone_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-10">
                            <input type="text" name="address" class="form-control" id="address_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <label class="col-sm-2 control-label">id</label>
                        <div class="col-sm-10">
                            <input type="text" name="id" class="form-control" id="id_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>--%>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="stu_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM——CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-md-offset-6">
            <button type="button" class="btn btn-primary" id="stu_add_model_btn">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                添加
            </button>
            <button type="button" class="btn btn-danger">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                批量删除
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover " id="stu_table" halign:
            "center">
            <thead>
            <tr>
                <th><br></th>
                <th style='text-align: center;'>学号</th>
                <th style='text-align: center;'>姓名</th>
                <th style='text-align: center;'>性别</th>
                <th style='text-align: center;'>出生日期</th>
                <th style='text-align: center;'>电话</th>
                <th style='text-align: center;'>地址</th>
                <th style='text-align: center;'>id</th>
                <th style='text-align: center;'>操作</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
            </table>
        </div>
    </div>


    <div class="row">
        <div class="col-md-6" id="page_info_area" style='text-align: center;'>

        </div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav_area" style='text-align: center;'>

        </div>
    </div>

</div>

<script type="text/javascript">
    $(function () {
        //去首页
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url: "${appPath}/login.action",
            data: "pn=" + pn,
            type: "get",
            success: function (result) {
                console.log(result);
                //1解析并显示员工数据
                build_stu_tables(result);
                //2 解析并显示分页信息
                build_page_info(result);
                build_page_nav(result);
            }
        });
    }

    function build_stu_tables(result) {
        //清空表格
        $("#stu_table tbody").empty();
        var stu = result.extend.pageInfo.list;
        $.each(stu, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var snoTd = $("<td></td>").append(item.sno);
            var snameTd = $("<td></td>").append(item.sname);
            var genderTd = $("<td></td>").append(item.gender);

            var birthdayTd = $('<td></td>').append(dateFormatUtil(item.birthday));
            var phoneTd = $("<td></td>").append(item.phone);
            var addressTd = $("<td></td>").append(item.address);
            var idTd = $("<td></td>").append(item.id);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            //editBtn.attr("edit-id", item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id", item.sno);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(snoTd)
                .append(snameTd)
                .append(genderTd)
                .append(birthdayTd)
                .append(phoneTd)
                .append(addressTd)
                .append(idTd)
                .append(btnTd)
                .appendTo("#stu_table tbody");
        });
    }

    //解析显示分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第" + result.extend.pageInfo.pageNum + "页,总" +
            result.extend.pageInfo.pages + "页,总" +
            result.extend.pageInfo.total + "条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
        pagesRecord = result.extend.pageInfo.pages;
    }

    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result) {
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));


        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));


        //添加首页和前一页 的提示
        ul.append(firstPageLi);
        firstPageLi.click(function () {
            to_page(1);
        });
        if (result.extend.pageInfo.hasPreviousPage) {
            ul.append(prePageLi);

        }
        prePageLi.click(function () {
            to_page(result.extend.pageInfo.pageNum - 1);
        });

        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示

        if (result.extend.pageInfo.hasNextPage) {
            ul.append(nextPageLi);

        }
        nextPageLi.click(function () {
            to_page(result.extend.pageInfo.pageNum + 1);
        });
        ul.append(lastPageLi);
        lastPageLi.click(function () {
            to_page(result.extend.pageInfo.pages);
        });
        /*ul.append(nextPageLi).append(lastPageLi);*/

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    //添加模态框
     $("#stu_add_model_btn").click(function () {
         $("#stuAddModal").modal({
             backdrop: "static",
             keyboard: "true"

         });
     });
     //添加功能实现
     $("#stu_save_btn").click(function () {
        alert($("#stu_add_form").serialize());
        $.ajax({
            url: "$ {appPath}/saveStudent.action",
            data: $("#stu_add_form").serialize(),
            type: "POST",

            success: function (result) {
                //用户保存成功；

                console.log(result.msg);

                alert("添加成功");
                //关闭模态框
                $("#stuAddModal").modal('hide');

                //来到最后一页，显示刚才保存的数据
                to_page(pagesRecord);
            },
            fail: function (result) {
                alert(result.extend.errorFields);
            }
        });
    });

    //单个删除功能
   $(document).on("click", ".delete_btn", function () {

        var sname = $(this).parents("tr").find("td:eq(2)").text();
        var sno = $(this).attr("del-id");
        if (confirm("确认删除【" + sname + "】吗？")) {
            $.ajax({
                url: "${appPath}/deleteStudentById/" + sno + ".action",
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    //回到本页
                    to_page(currentPage);
                }
            });
        }
    });
    //批量删除功能



</script>
<%@include file="addModal.jsp"%>
</body>
</html>
<%--
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
&lt;%&ndash;引用core标签库&ndash;%&gt;
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%
        pageContext.getSession().setAttribute("appPath", request.getContextPath());
    %>
    <link rel="stylesheet" href="${appPath}/bootstrap/css/bootstrap.css">
    <script src="${appPath}/bootstrap/js/jquery-3.4.1.min.js"></script>
    <script src="${appPath}/bootstrap/js/bootstrap.js"></script>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM——CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-md-offset-6">
            <button type="button" class="btn btn-primary">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                添加
            </button>
            <button type="button" class="btn btn-danger">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                批量删除
            </button>
        </div>
    </div>

    <div class="row">
        <table class="table table-hover">
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>出生日期</th>
                <th>电话</th>
                <th>地址</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="stu">
                <tr>
                    <td>${stu.sno}</td>
                    <td>${stu.sname}</td>
                    <td>${stu.gender}</td>
                    <td>${stu.birthday}</td>
                    <td>${stu.phone}</td>
                    <td>${stu.address}</td>
                    <td>
                        <button type="button" class="btn btn-primary btn-xs">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            编辑
                        </button>
                        <button type="button" class="btn btn-danger btn-xs">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                            删除
                        </button>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>
    <div class="row">
        <div class="col-md-6">当前第几页</div>
        <div class="col-md-6">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item"><a>首页</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                    <li class="page-item"><a>末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>--%>
