package cn.action;

import cn.domain.Msg;
import cn.domain.Student;
import cn.service.StudentService;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StudentJsonAction {
	@Autowired
	private StudentService studentService;


	@RequestMapping("/saveStudent")
	@ResponseBody
	public Msg saveStudent(Student student, BindingResult result){

		System.out.println(student);
		if(result.hasErrors()){
			List<FieldError> errors=result.getFieldErrors();
			Map<String,Object> map=new HashMap<>();			
			for(FieldError err:errors){
				System.err.println("错误的字段名:"+err.getField());
				System.err.println("错误返回的信息:"+err.getDefaultMessage());
				map.put(err.getField(), err.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else{
			studentService.insertSelective(student);
			return Msg.success();
		}
	}
	/*
	Get请求: /addStudent.action/{id} 查询
	Post请求：/addStudent.action
	Put修改：/addStudent.action/{id}
	Delete： /addStudent.action/{id} 
	 */
	
	@RequestMapping("/findJson")
	@ResponseBody //需要导入json包
	public Msg getStudentsJson(
			@RequestParam(value="pn",defaultValue="1")Integer pn ,Model model){
		// 引入pagehelper分页插件
		PageHelper.startPage(pn,7);//从pn页开始查  每页7条数据		
		List<Student> students=studentService.getAll();
		//startPage后紧跟的查询是分页查询，查出来的数据PageInfo直接包装
		PageInfo page=new PageInfo(students,5);//有查询出来的各种数据,连续显示的页面5页
		//return page;
		return Msg.success().add("pageInfo", page);
	}
	
	
	
	@RequestMapping("/findAllStudentsJson")
	public String getAllStudents(
			@RequestParam(value="pn",defaultValue="1")Integer pn ,Model model){
		String result="/json/main.jsp";
		// 引入pagehelper分页插件
		PageHelper.startPage(pn,7);//从pn页开始查  每页7条数据
		List<Student> students=studentService.getAll();
		//startPage后紧跟的查询是分页查询，查出来的数据PageInfo直接包装
		PageInfo page=new PageInfo(students,5);//有查询出来的各种数据,连续显示的页面5页
		model.addAttribute("pageInfo",page);
		return result;
	}
	@ResponseBody
	@RequestMapping("/checkSname")
	public Msg checkSname(@RequestParam("sname")String sname){
		//先判断用户名是否为合法的表达式 让前-后端统一 可以用前端也可以用后端校验
		String regSname="(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5}$)";
		if(!sname.matches(regSname)){//保存前后端一致
			return Msg.fail().add("CHECK", "后端-用户名可以为6-16位数字字母或2-5个汉字！");
		}else{
			if(studentService.checkSname(sname)){//true不能用
				return Msg.fail().add("CHECK", "后端-用户名重复！");
			}
			return Msg.success().add("CHECK", "后端-恭喜，用户名可用！");
		}
	}


	@RequestMapping(value="/updateStudent",method=RequestMethod.POST)
	@ResponseBody
	public Msg updateStudent(Student student){
		System.out.println(student);
		Integer result=studentService.updateByPrimaryKeySelective(student);	
		return Msg.success();
	}	
	
	
	@RequestMapping(value="/findStudentById/{sno}",method=RequestMethod.GET)
	@ResponseBody
	public Msg findStudentById(@PathVariable("sno")String sno){
		Student student=studentService.selectByPrimaryKey(sno);
		return Msg.success().add("STUDENT",student);
	}
	
	@RequestMapping(value="/deleteStudentById/{sno}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteStudentById(@PathVariable("sno")String sno){
		int result=studentService.deleteByPrimaryKey(sno);	
		return result>0? Msg.success(): Msg.fail();
	}

	@RequestMapping("/deleteStudentBySnoS.action")
	@ResponseBody // 需要导入json包
	public Msg deleteStudentByIDS(String ids) {
		List<String> snosArray = new ArrayList<String>();
        snosArray = JSON.parseArray(ids, String.class);
		//List<Integer> ->Integer[]
		//DELETE FROM student WHERE id IN(253,254)删除多个id
		int effectLines = studentService.deleteStudentBySnos(snosArray);
		if (effectLines > 0)
			return Msg.success();
		else
			return Msg.fail();
	}
}

/*
 * 1 改造方法  getStudentsJson
 * 2 添加依赖
 * 		<!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind -->
		<dependency>
			<groupId>com.fasterxml.jackson.core</groupId>
			<artifactId>jackson-databind</artifactId>
			<version>2.10.0</version>
		</dependency>
 * 3 测试取得数据 http://localhost:8082/ssm_maven/findJson.action
 * {"total":206,"list":[{"sno":"2014140002","sname":"高明霞","gender":"女","birthday":825206400000,"phone":"132220","address":"江苏省南通市通州区五接镇袁三圩村1组020号","id":2},{"sno":"2014140006","sname":"代徐林","gender":"女","birthday":814838400000,"phone":"132227","address":"安徽省庐江第二中学","id":3},{"sno":"2014140007","sname":"贾紫薇","gender":"女","birthday":785462400000,"phone":"132227","address":"湖北省钟祥市第六中学三（4）班","id":4},{"sno":"2014140009","sname":"蔡恒杰","gender":"男","birthday":746496000000,"phone":"177051","address":"江苏省淮安市淮阴区五里镇刘洼村郭庄384号","id":5},{"sno":"2014140010","sname":"沈磊","gender":"男","birthday":839980800000,"phone":"132220","address":"江苏扬州江都真武振兴村沈西组37号","id":6},{"sno":"2014140012","sname":"肖杰","gender":"男","birthday":760924800000,"phone":"132220","address":"江苏省泰兴市曲霞镇肖榨村四组6号","id":7},{"sno":"2014140013","sname":"唐裕春","gender":"男","birthday":854841600000,"phone":"132220","address":"南通市通州区先锋镇永安村四十四组52号","id":8}],"pageNum":1,"pageSize":7,"size":7,"startRow":1,"endRow":7,"pages":30,"prePage":0,"nextPage":2,"isFirstPage":true,"isLastPage":false,"hasPreviousPage":false,"hasNextPage":true,"navigatePages":5,"navigatepageNums":[1,2,3,4,5],"navigateFirstPage":1,"navigateLastPage":5}
 * 4 添加Msg类，用于返回更全面的数据
 * 5 修改getStudentsJson返回值，测试
 * 查询：http://localhost:8082/ssm_maven/findJson.action=>
 * 结果：{"code":1,"msg":"处理成功！","extend":{"pageInfo":{"total":206,"list":[{"sno":"2014140002","sname":"高明霞","gender":"女","birthday":825206400000,"phone":"132220","address":"江苏省南通市通州区五接镇袁三圩村1组020号","id":2},{"sno":"2014140006","sname":"代徐林","gender":"女","birthday":814838400000,"phone":"132227","address":"安徽省庐江第二中学","id":3},{"sno":"2014140007","sname":"贾紫薇","gender":"女","birthday":785462400000,"phone":"132227","address":"湖北省钟祥市第六中学三（4）班","id":4},{"sno":"2014140009","sname":"蔡恒杰","gender":"男","birthday":746496000000,"phone":"177051","address":"江苏省淮安市淮阴区五里镇刘洼村郭庄384号","id":5},{"sno":"2014140010","sname":"沈磊","gender":"男","birthday":839980800000,"phone":"132220","address":"江苏扬州江都真武振兴村沈西组37号","id":6},{"sno":"2014140012","sname":"肖杰","gender":"男","birthday":760924800000,"phone":"132220","address":"江苏省泰兴市曲霞镇肖榨村四组6号","id":7},{"sno":"2014140013","sname":"唐裕春","gender":"男","birthday":854841600000,"phone":"132220","address":"南通市通州区先锋镇永安村四十四组52号","id":8}],"pageNum":1,"pageSize":7,"size":7,"startRow":1,"endRow":7,"pages":30,"prePage":0,"nextPage":2,"isFirstPage":true,"isLastPage":false,"hasPreviousPage":false,"hasNextPage":true,"navigatePages":5,"navigatepageNums":[1,2,3,4,5],"navigateFirstPage":1,"navigateLastPage":5}}}
 */
