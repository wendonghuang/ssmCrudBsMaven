package cn.action;

import cn.domain.Msg;
import cn.domain.Student;
import cn.service.StudentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author hwbstart
 * @create 2022-05-08 1:30
 * 处理crud请求
 */
@Controller
public class StudentController {
    @Autowired
    StudentService studentService;
    @ResponseBody
@RequestMapping(value = "/login")

public Msg getjson(@RequestParam(value = "pn", defaultValue = "1") Integer pn){

    //        查询前startpage方法 查询第几页，展示几行数据
        System.out.print(1);
    PageHelper.startPage(pn, 7);
    List<Student> students = studentService.getAll();
//        pageInfo对查询结果封装，可获取相应数据
    PageInfo page = new PageInfo(students, 5);
    return Msg.success().add("pageInfo",page);
}
    @ResponseBody
    @RequestMapping(value="/login",method = RequestMethod.POST)
    public  Msg poststu(Student student){
    studentService.saveStu(student);
    Integer a=5;

    return Msg.success();
    }
}
  /*   @RequestMapping("/login")

 返回jsp
    public String getStu(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
//        查询前startpage方法 查询第几页，展示几行数据
        PageHelper.startPage(pn, 7);
        List<Student> students = studentService.getAll();
//        pageInfo对查询结果封装，可获取相应数据
        PageInfo page = new PageInfo(students, 5);
        model.addAttribute("pageInfo", page);
        return "/main.jsp";
    }
}
*/