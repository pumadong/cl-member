package com.cl.member.mapper.member;

import com.cl.member.model.member.MemberProcessLog;

public interface MemberProcessLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MemberProcessLog record);

    int insertSelective(MemberProcessLog record);

    MemberProcessLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MemberProcessLog record);

    int updateByPrimaryKey(MemberProcessLog record);
}