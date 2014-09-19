package com.cl.member.mapper.member;

import com.cl.member.model.member.MemberMoneyIO;

public interface MemberMoneyIOMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MemberMoneyIO record);

    int insertSelective(MemberMoneyIO record);

    MemberMoneyIO selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MemberMoneyIO record);

    int updateByPrimaryKey(MemberMoneyIO record);
}