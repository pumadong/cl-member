package com.cl.member.mapper.member;

import com.cl.member.model.member.MemberScoreIO;

public interface MemberScoreIOMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MemberScoreIO record);

    int insertSelective(MemberScoreIO record);

    MemberScoreIO selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MemberScoreIO record);

    int updateByPrimaryKey(MemberScoreIO record);
}