package com.crud.dao;

import com.crud.bean.Superuser;
import com.crud.bean.SuperuserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SuperuserMapper {
    long countByExample(SuperuserExample example);

    int deleteByExample(SuperuserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Superuser record);

    int insertSelective(Superuser record);

    List<Superuser> selectByExample(SuperuserExample example);

    Superuser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Superuser record, @Param("example") SuperuserExample example);

    int updateByExample(@Param("record") Superuser record, @Param("example") SuperuserExample example);

    int updateByPrimaryKeySelective(Superuser record);

    int updateByPrimaryKey(Superuser record);
}