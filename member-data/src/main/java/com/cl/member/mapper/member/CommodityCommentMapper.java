package com.cl.member.mapper.member;

import com.cl.member.model.member.CommodityComment;

public interface CommodityCommentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CommodityCommentMapper record);

    int insertSelective(CommodityComment record);

    CommodityComment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CommodityComment record);

    int updateByPrimaryKey(CommodityComment record);
}