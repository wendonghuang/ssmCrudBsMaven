package cn.service;

import cn.domain.Student;

import javax.validation.Valid;
import java.util.List;

/**
 * @author hwbstart
 * @create 2022-05-13 0:14
 */

public interface StudentService {

    public List<Student> getAll();

    public void saveStu(Student student);

    public void insertSelective(@Valid Student student);

    boolean checkSname(String sname);

    Integer updateByPrimaryKeySelective(Student student);

    Student selectByPrimaryKey(String sno);

    int deleteByPrimaryKey(String sno);

    int deleteStudentBySnos(List<String> snosArray);
};