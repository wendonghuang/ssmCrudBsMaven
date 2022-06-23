package cn;/*
package cn;

import cn.dao.StudentMapper;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
//指定spring'配置文件的位置

public class SsmTest {
    @Test
    public  void t1(){
        String file="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(file);
        System.out.println(ac.getBean("dataSource"));
        System.out.println(ac.getBean("sqlSessionFactoryBean"));
        StudentMapper studentMapper=ac.getBean("studentMapper",StudentMapper.class);
        System.out.println(studentMapper);
    }
}
*/
