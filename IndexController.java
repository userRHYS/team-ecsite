package jp.co.internous.samurai.controller;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jp.co.internous.samurai.model.domain.MstCategory;
import jp.co.internous.samurai.model.domain.MstProduct;
import jp.co.internous.samurai.model.form.SearchForm;
import jp.co.internous.samurai.model.mapper.MstCategoryMapper;
import jp.co.internous.samurai.model.mapper.MstProductMapper;
import jp.co.internous.samurai.model.session.LoginSession;

@Controller
@RequestMapping("/samurai")
public class IndexController {
	
	@Autowired
	private MstCategoryMapper categoryMapper;
	
	@Autowired 
	private MstProductMapper productMapper;
	
    @Autowired
	private LoginSession loginSession;

	@RequestMapping("/")
	public String index(Model m) {
		
		if (!loginSession.isLogined() && loginSession.getTmpUserId() == 0) {
			int tmpUserId = new Random().nextInt(1_000_000_000);
			tmpUserId *= -1;
			loginSession.setTmpUserId(tmpUserId);
		}
		
		List<MstCategory> categories = categoryMapper.findAll();
		m.addAttribute("categories", categories);
		m.addAttribute("selected", 0);
		List<MstProduct> products = productMapper.findAll();
		m.addAttribute("products",products);
		
		m.addAttribute("loginSession", loginSession);
		
		return "index";
	}
	
	@RequestMapping("/searchItem")
	public String searchItem(SearchForm f, Model m) {
		
		List<MstProduct> products = null;

		String keywords = f.getKeywords().replaceAll("　", " ").replaceAll("\\s{2,}", " ").trim();
		if (f.getCategory() == 0) {
			
			products = productMapper.findByProductName(keywords.split(" "));
		} else {
			products = productMapper.findByCategoryAndProductName(f.getCategory(), keywords.split(" "));
			
		}

		List<MstCategory> categories = categoryMapper.findAll();
		
		m.addAttribute("keywords", keywords);
		m.addAttribute("selected", f.getCategory()); 
		m.addAttribute("categories", categories); 
		m.addAttribute("products", products);
		
		m.addAttribute("loginSession", loginSession);
		
		return "index";
		
	}
}
