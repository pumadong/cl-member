package com.cl.member.mapper.member;

import com.cl.member.model.member.MemberConsignee;

public interface MemberConsigneeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MemberConsignee record);

    int insertSelective(MemberConsignee record);

    MemberConsignee selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MemberConsignee record);

    int updateByPrimaryKey(MemberConsignee record);
}