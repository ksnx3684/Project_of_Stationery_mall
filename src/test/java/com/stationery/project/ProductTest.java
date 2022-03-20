package com.stationery.project;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.stationery.project.product.ProductDAO;
import com.stationery.project.product.ProductDTO;
import com.stationery.project.util.Pager;

public class ProductTest extends MyJunitTest{

	@Autowired
private ProductDAO productDAO;
	
	
	//@Test
	public void listTest() throws Exception{
		Pager pager = new Pager();
		pager.setSearch("스티커");
		List<ProductDTO> ar=productDAO.list(pager);
		assertEquals(2, ar.size());
	}

	@Test
	public void addTest()throws Exception{
		ProductDTO productDTO= new ProductDTO();
		productDTO.setCategoryNum(102);
		productDTO.setName("마이 미니 보석함");
		productDTO.setContents("보석함이다");
		productDTO.setPrice(1200);
		productDTO.setStock(13);
		productDTO.setThumbnail("dfnja.jpg");
		int result=productDAO.add(productDTO);
		assertEquals(1, result);
	}
}
