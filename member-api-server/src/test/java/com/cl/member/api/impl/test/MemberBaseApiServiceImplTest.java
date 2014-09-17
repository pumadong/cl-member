package com.cl.member.api.impl.test;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cl.member.api.impl.MemberBaseApiServiceImpl;
import com.cl.member.model.base.Dictionary;

public class MemberBaseApiServiceImplTest {

	private static MemberBaseApiServiceImpl service;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-test.xml");  
		service = (MemberBaseApiServiceImpl)ctx.getBean("memberBaseApiServiceImpl");
		ctx.close();
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void getDictionaryById() {		
		Dictionary dictionary = service.getDictionaryById(1);
		if(dictionary == null)
		{
			System.out.println("dictionary is null");
		} else {
			System.out.println(dictionary.getName());
		}
	}

}
