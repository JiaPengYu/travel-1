<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="info.jsp" %>
<%@ include file="data.jsp" %>
<html>
<head>
    <title>Magz &mdash; Responsive HTML5 &amp; CSS3 Magazine Template</title>
    <style>
        .icon {
            font-size: 23px;
        }
    </style>
</head>
<%
if (request.getSession().getAttribute("user") == null) {
response.sendRedirect(request.getContextPath() + "/login.jsp");
}
%>
<body>
<div class="container">
    <div class="row">
        <form class="row" action="<%=request.getContextPath()%>/foreground/toOrder">
            <div class="col-md-12">
                <h3 class="title">下订单</h3>
            </div>
            <div class="form-group col-md-5">
                <label for="dtp_input1" class=" control-label">出发时间<span class="required"></span></label></label>
                <div class="input-group date form_datetime" data-date="1979-09-16T05:25:07Z"
                     data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                    <input class="form-control form_datetime" name="departure" placeholder="请输入出发时间"
                           style="background: #ffffff" type="text" value="" readonly="readonly">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
                <input type="hidden" id="dtp_input1" value=""/><br/>
            </div>
            <div class="form-group col-md-5">
                <label for="place">集合地点 <span class="required"></span></label>
                <select id="place" name="place" class="form-control">
                    <option value="">===请选择===</option>
                    <option value="东门">东门</option>
                    <option value="西门">西门</option>
                    <option value="南门">南门</option>
                    <option value="北门">北门</option>
                    <option value="中门">中门</option>
                </select>
            </div>
            <div class="form-group col-md-12">
                <label>游客信息 <span class="required"></span></label>
                <div role="group1" id="tb" class="form-group col-md-12">
                    姓名:
                    <input type="text" id="name1"
                           placeholder="请输入姓名" style="height: 34px;padding: 6px 12px" name="visitorName">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;身份证号:
                    <input type="text"
                           placeholder="请输入身份证号" style="height: 34px;padding: 6px 12px" name="cardId">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系方式:
                    <input type="text"
                           placeholder="请输入联系方式" style="height: 34px;padding: 6px 12px" name="phone">
                    <i class="icon ion-plus-circled" onclick="add()" style="padding: 5px auto"></i>
                </div>
            </div>
            <div class="form-group col-md-12">
                <button class="btn btn-primary">提交订单</button>
            </div>
        </form>
    </div>
</div>

<script>
    function add() {
        var form = document.createElement("group1");
        form.id = new Date().getTime();
        form.innerHTML = "<div role='group1' >" +
            "姓名: " + "<input type=\"text\"\n" +
            "      style=\"height: 34px;padding: 6px 12px\"   placeholder=\"请输入姓名\" name=\"visitorName\">" +
            " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;身份证号: <input type=\"text\"\n" +
            "     style=\"height: 34px;padding: 6px 12px\"   placeholder=\"请输入身份证号\" name=\"cardId\">" +
            " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系方式: <input type=\"text\"\n" +
            "  style=\"height: 34px;padding: 6px 12px\"   placeholder=\"请输入联系方式\" name=\"phone\">" +
            "  <i class=\"icon ion-minus-circled\" onclick='del(this)'></i></div>";
        document.getElementById("tb").appendChild(form);
    }
    function del(obj) {
        var formID = obj.parentNode.parentNode.id;
        var form = document.getElementById(formID);
        document.getElementById("tb").removeChild(form);
    }

    $(document).ready(function () {
        console.log($("#tb").serialize()); // FirstName=Bill&LastName=Gates
    });
    $('.form_datetime').datetimepicker({
        weekStart: 0, //一周从哪一天开始
        todayBtn: 1, //
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1,
        format: "yyyy-mm-dd hh:ii:ss",
    });
    $(document).ready(function () {
        console.log($("form").serialize()); // FirstName=Bill&LastName=Gates
    });
</script>

</body>
</html>