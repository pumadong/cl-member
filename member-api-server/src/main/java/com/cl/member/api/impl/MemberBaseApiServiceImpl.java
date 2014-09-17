package com.cl.member.api.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cl.member.api.IMemberBaseApiService;
import com.cl.member.mapper.base.DictionaryMapper;
import com.cl.member.model.base.Dictionary;



@Service
public class MemberBaseApiServiceImpl implements IMemberBaseApiService {

	@Autowired
	private DictionaryMapper dictionaryMapper;

	@Override
	public Dictionary getDictionaryById(Integer id) {
		return dictionaryMapper.selectByPrimaryKey(id);
	}

}
