<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 新增模态框 -->
<div class="modal fade" id="stuAddModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">添加数据</h4>
			</div>
			<div class="modal-body">
				<!-- 表单显示       	String sno sname gender Date birthday; String phone address;Integer id;    -->
				<form class="form-horizontal" id="addForm">
					<div class="form-group">
						<label for="sno" class="col-sm-2 control-label">学号</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="sno" name="sno"
								placeholder="输入学号">
						</div>
					</div>
					<div class="form-group">
						<label for="sname" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="sname" name="sname"
								placeholder="输入姓名"> <span class="help-block"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="gender" class="col-sm-2 control-label">性别</label>
						<div class="col-sm-4">
							<label class="radio-inline"> <input type="radio"
								name="gender" id="gender1" value="男"> 男
							</label> <label class="radio-inline"> <input type="radio"
								name="gender" id="gender2" value="女" checked="checked">
								女
							</label>
						</div>
					</div>
					<div class="form-group">
						<label for="birthday" class="col-sm-2 control-label">出生日期</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="birthday"
								id="birthday" placeholder="出生日期,如 2020-1-10)"> <span
								class="help-block"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-2 control-label">手机</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="phone" id="phone"
								placeholder="输入电话"> <span class="help-block"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="address" class="col-sm-2 control-label">地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="address"
								id="address" placeholder="输入地址">
						</div>
					</div>
			</div>
		</form>
		
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="stuAddBtn">保存</button>
			</div>
	
	
	<script type="text/javascript">
				//表单数据校验
		function validate_add_form() {
					//1取得校验的数据 2使用js中正则表达式校验
					var sno = $("#sno").val().trim();
					//这个如果查重需要发请求到动作类查数据库
					//可以根据jquery文档使用不同的正则表达式
					var sname = $("#sname").val().trim();
					var regSname = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
					if (!regSname.test(sname)) {
						//alert("用户名可以为6-16位数字字母或2-5个汉字！");
						//用样式来实现
						show_validate_msg("#sname", "error",
								"用户名可以为6-16位数字字母或2-5个汉字！");
						//$("#sname").parent().addClass("has-error");
						//$("#sname").next("span").text("用户名可以为6-16位数字字母或2-5个汉字！");
						return false;
					} else {
						show_validate_msg("#sname", "success", "");
						//$("#sname").parent().addClass("has-success");
						//$("#sname").next("span").text("");
					}
					/*var birthday = $("#birthday").val().trim();
					var regBirthday = /^(?:(?!0000)[0-9]{4}([-/.]?)(?:(?:0?[1-9]|1[0-2])\1(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])\1(?:29|30)|(?:0?[13578]|1[02])\1(?:31))|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)([-/.]?)0?2\2(?:29))$/;
					if (!regBirthday.test(birthday)) {
						//alert("生日格式为yyyy-MM-dd，如2020-3-10！");
						show_validate_msg("#birthday", "error",
								"生日格式为yyyy-MM-dd，如2020-3-10！");
						return false;
					} else {
						show_validate_msg("#birthday", "success", "");
					}*/

					var phone = $("#phone").val().trim();
					var regPhone = /^[1][3,4,5,7,8][0-9]{9}$/;
					if (!regPhone.test(phone)) {
						//alert("电话号码为手机号码，11位！");
						show_validate_msg("#phone", "error", "电话号码为手机号码，11位！");
						return false;
					} else {
						show_validate_msg("#phone", "success", "");
					}
					return true;
				}

		$("#stuAddBtn").click(function() {//绑定保存事件-后期需添加校验录入数据
			if (!validate_add_form()) {
				return false; }
			if ($("this").attr("CHECK") == "error") //此处的CHECK是在保存按钮上添加的一个属性，在用户名的blur事件中的CHECK是来自于后端的返回信息
				return false;
				$.ajax({
						url : '${appPath}/saveStudent.action',
						type : 'post',
						data : $("#stuAddModal form").serialize(),//$("#addForm").serialize(),
						success : function(result) {
							if (result.code == 1) {//成功
								//alert(result.msg);
								//关闭模态框-到最后一页显示保存数据（再发送ajax请求，显示最后一页数据即可）
								$('#stuAddModal').modal('hide');
								toPage(1);//总记录数>总页面，程序会帮我们处理找最后一页
							} else {//用户检验失败-显示失败信息
								//console.log(result);
								//有哪个字段的错误信息就显示哪 个字段
									if (undefined != result.extend.errorFields.sname) {
										show_validate_msg("#sname","error",result.extend.errorFields.sname);
									}
									if (undefined != result.extend.errorFields.birthday) {
										show_validate_msg("#birthday","error",result.extend.errorFields.birthday);
									}
									if (undefined != result.extend.errorFields.phone) {
										show_validate_msg("#phone","error",result.extend.errorFields.phone);
									}
								}
							}
						});
				});

				function show_validate_msg(ele, status, msg) {//传入校验元素|状态|消息
					$(ele).parent().removeClass("has-success has-error");
					$(ele).next("span").text("");
					if ("success" == status) {
						$(ele).parent().addClass("has-success");
						$(ele).next("span").text(msg);
					} else if ("error" == status) {
						$(ele).parent().addClass("has-error");
						$(ele).next("span").text(msg);
					}
				}

				$("#sname").blur(
						function() {
							var sname = this.value;
							var name2 = $("#sname").val().trim();
							//alert(sname);
							//alert(name2);
							$.ajax({
								url : '${appPath}/checkSname.action',
								type : 'post',
								data : "sname=" + sname,
								success : function(result) {
									if (result.code == 1) {
										//show_validate_msg("#sname", "success", "用户名可用");
										show_validate_msg("#sname", "success",
												result.extend.CHECK); //显示后端提交的CHECK显示
										$("#stuAddBtn")
												.attr("CHECK", "success");//为保存按钮添加属性，如果用户名重复，保存按钮应该变灰。
									} else {
										//show_validate_msg("#sname", "error", "用户名不可用");
										show_validate_msg("#sname", "error",
												result.extend.CHECK); //显示后端提交的CHECK显示
										$("#stuAddBtn").attr("CHECK", "error");
									}
							}
						});
				});
			</script>
	
		</div>
	</div>
</div>
