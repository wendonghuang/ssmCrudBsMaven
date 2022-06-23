package cn.tests;/*
package cn.tests;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

*/
/**
 * @author hwbstart
 * @create 2022-05-08 2:08
 * 测试crud正确性
 *//*

@ContextConfiguration(locations = {"classpath:applicationContext.xml","file:springmvc.xml"})

public class MvcTest {
    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;
    public void initMockMvc() {
        mockMvc= MockMvcBuilders.webAppContextSetup(context).build();}


        public void testPage(){
            try {
                MvcResult result=mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn","1")).andReturn();
                MockHttpServletRequest request=result.getRequest();
                PageInfo pi=(PageInfo)request.getAttribute("pageInfo");
                System.out.print(pi.getNavigateFirstPage());
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

}
*/
/*
package cn.service;

import cn.dao.StudentMapper;
import cn.domain.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

*/
/**
 * @author hwbstart
 * @create 2022-05-08 1:37
 *//*

@Service
public class StudentService {
    @Autowired
    StudentMapper studentMapper;
    public List<Student> getAll() {
        return studentMapper.selectByExample(null);


    }
}
*/
