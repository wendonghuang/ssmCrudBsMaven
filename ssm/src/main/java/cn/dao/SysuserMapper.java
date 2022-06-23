package cn.dao;

import cn.domain.Sysuser;
import cn.domain.SysuserExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysuserMapper {
    long countByExample(SysuserExample example);

    int deleteByExample(SysuserExample example);

    int deleteByPrimaryKey(String userid);

    int insert(Sysuser record);

    int insertSelective(Sysuser record);

    List<Sysuser> selectByExample(SysuserExample example);

    Sysuser selectByPrimaryKey(String userid);

    int updateByExampleSelective(@Param("record") Sysuser record, @Param("example") SysuserExample example);

    int updateByExample(@Param("record") Sysuser record, @Param("example") SysuserExample example);

    int updateByPrimaryKeySelective(Sysuser record);

    int updateByPrimaryKey(Sysuser record);
}