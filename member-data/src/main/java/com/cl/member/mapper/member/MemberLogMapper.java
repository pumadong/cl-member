package com.cl.member.mapper.member;

import com.cl.member.model.member.MemberLog;

public interface MemberLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MemberLog record);

    int insertSelective(MemberLog record);

    MemberLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MemberLog record);

    int updateByPrimaryKey(MemberLog record);
}