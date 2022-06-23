package cn.service.imp;

import cn.dao.StudentMapper;
import cn.domain.Student;
import cn.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.validation.Valid;
import java.util.List;

/**
 * @author hwbstart
 * @create 2022-05-13 0:28
 */
@Service
public class StudentServiceImp implements StudentService {
    @Autowired
    StudentMapper studentMapper;

    @Override
    public List<Student> getAll() {
        return studentMapper.selectByExample(null);
    }

    @Override
    public void saveStu(Student student) {
        studentMapper.insertSelective(student);

    }

    @Override
    public void insertSelective(@Valid Student student) {
        studentMapper.insertSelective(student);

    }

    @Override
    public boolean checkSname(String sname) {
        return false;
    }

    @Override
    public Integer updateByPrimaryKeySelective(Student student) {
        return null;
    }

    @Override
    public Student selectByPrimaryKey(String sno) {
        return null;
    }

    @Override
    public int deleteByPrimaryKey(String sno) {
        studentMapper.deleteByPrimaryKey(sno);
        return 1;
    }

    @Override
    public int deleteStudentBySnos(List<String> snosArray) {
        return 0;
    }
}
