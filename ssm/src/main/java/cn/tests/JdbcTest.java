package cn.tests;

import cn.dao.StudentMapper;
import cn.domain.Student;
//import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author hwbstart
 * @create 2022-05-13 14:55
 */
public class JdbcTest {
   // @Test
    public void ti(){
        String file="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(file);
        StudentMapper dao= ac.getBean("studentMapper", StudentMapper.class);
        List<String> snos=new ArrayList<String>();
        snos.add("2019100011");
        Student s=new Student();
        s.setSno("201899999");
        s.setSname("shajkd");
        s.setBirthday(new Date(1982-1-2));
        s.setAddress("nskc");
        //s.setId(12);

        for(String e:snos)
            System.out.println(e);
     // dao.insert(new Student("123123213","1","男",new Date(1962-02-11),"152","nskc",2));
        dao.insertSelective(s);
      /* this.sno = sno;
        this.sname = sname;
        this.gender = gender;
        this.birthday = birthday;
        this.phone = phone;
        this.address = address;
        this.id = id;*/
    }
}
