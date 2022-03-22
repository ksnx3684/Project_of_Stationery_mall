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

	//@Test
	public void addTest()throws Exception{
		ProductDTO productDTO= new ProductDTO();
		productDTO.setCategoryNum(201);
		productDTO.setName("그립 온 샤프");
		productDTO.setContents("샤프임");
		productDTO.setPrice(1800);
		productDTO.setStock(13);
		productDTO.setThumbnail("dfnjsfaa.jpg");
		int result=productDAO.add(productDTO);
		assertEquals(1, result);
	}
	
	//@Test
	public void datilTest()throws Exception{
		ProductDTO productDTO= new ProductDTO();
		productDTO.setProductNum(1);
		productDTO=productDAO.detail(productDTO);
		
		assertNotNull(productDTO);
	}
	@Test
	public void updateTest()throws Exception{
		ProductDTO productDTO= new ProductDTO();
		productDTO.setCategoryNum(101);
		productDTO.setName("손그림 투명 스티커");
		productDTO.setContents("스티커임");
		productDTO.setThumbnail("sdfasf.jpg");
		productDTO.setPrice(600);
		productDTO.setStock(10);
		int result=productDAO.update(productDTO);
		assertEquals(1, result);
	}
}
