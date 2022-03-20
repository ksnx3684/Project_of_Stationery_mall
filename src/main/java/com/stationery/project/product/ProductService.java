package com.stationery.project.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stationery.project.util.Pager;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	
	public List<ProductDTO> list(Pager pager) throws Exception{
		List<ProductDTO> ar =productDAO.list(pager);
		return ar;
	}
	
	public int add(ProductDTO productDTO) throws Exception{
		int result=productDAO.add(productDTO);
		return result;
	}
	
	
}
