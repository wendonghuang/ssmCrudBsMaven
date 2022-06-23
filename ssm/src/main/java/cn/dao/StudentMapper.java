package cn.dao;

import cn.domain.Student;
import cn.domain.StudentExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface StudentMapper {
    long countByExample(StudentExample example);

    int deleteByExample(StudentExample example);

    int deleteByPrimaryKey(String sno);

    int insert(Student record);
    //添加功能方法
    int insertSelective(Student record);
    //查找学生信息方法
    List<Student> selectByExample(StudentExample example);

    Student selectByPrimaryKey(String sno);

    int  updateByExampleSelective(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByExample(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
}