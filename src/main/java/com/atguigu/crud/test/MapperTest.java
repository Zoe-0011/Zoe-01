package com.atguigu.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.DepartmentExample;
import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmployeeMapper;

import sun.misc.Contended;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	@Test
	public void testCRUD(){
//		ApplicationContext ioc=new ClassPathXmlApplicationContext("applicationContext.xml");
//		ioc.getBean(DepartmentMapper.class);
//		
		
		System.out.println(employeeMapper);
		
		
		
//		departmentMapper.insertSelective(new Department(null,"开发部"));
		//departmentMapper.insertSelective(new Department(null,"12部"));
		
		//employeeMapper.insertSelective(new Employee(null,"Jerry","M","Jerry@atguigu.com",5));
		
		//for() {
		//	employeeMapper.insertSelective(new Employee(null,"Jerry","M","Jerry@atguigu.com",5));
			
		//}
		EmployeeMapper mapper=sqlSession.getMapper(EmployeeMapper.class);
		for (int i=0;i<1000;i++) {
			String uid=UUID.randomUUID().toString().substring(0,5)+i;
			mapper.insert(new Employee(null,uid,"M",uid+"@atguigu.com",1));
		}
		System.out.println("批量完成");
	}


}
