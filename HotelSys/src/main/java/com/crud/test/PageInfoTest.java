package com.crud.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.crud.bean.User;
import com.github.pagehelper.PageInfo;

//����crud�����׼ȷ��
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"classpath:config/spring/applicationContext-*.xml","file:src/main/resources/config/spring/springmvc.xml"})
public class PageInfoTest {
	//����SpringMVC��ioc
	@Autowired
	WebApplicationContext context;
	//����MVC���󣬻�ò�ѯ���
	MockMvc mockMvc;
	//junit��@Before,ÿ��ִ��ǰ��Ҫ�ȳ�ʼ�� 
	@Before
	public void initMockMVC() {
	mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	@Test
	public void testPage() throws Exception {
		//ģ�������õ�����ֵ
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/users").param("pn", "1")).andReturn();
		//����ɹ��Ժ��������л���pageInfo,���ǿ���ȡ��pageInfo������֤
		 MockHttpServletRequest request = result.getRequest();
		 PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
		 System.out.println("CurrentPage:"+pi.getPageNum());
		 System.out.println("TotalPage:"+pi.getPages());
		 System.out.println("TotalRecords:"+pi.getTotal());
		 System.out.println("ConsecutivePages:");
		 int [] nums = pi.getNavigatepageNums();
		 for (int i : nums) {
			System.out.println(" "+i);
		}
		 List<User> list = pi.getList();
		 for (User user : list) {
			System.out.println("ID="+user.getId()+">>>>>Name="+user.getUsername());
		}
		 
	}
}
