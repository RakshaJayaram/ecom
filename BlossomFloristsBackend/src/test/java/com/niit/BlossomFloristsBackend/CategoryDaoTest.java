package com.niit.BlossomFloristsBackend;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.dao.CategoryDao;
import com.niit.model.Category;

public class CategoryDaoTest {

	static CategoryDao categoryDao;

	@BeforeClass
	public static void initialize() {
		AnnotationConfigApplicationContext configApplnContext = new AnnotationConfigApplicationContext();
		configApplnContext.scan("com");
		configApplnContext.refresh();

		// SessionFactory
		// sessionFactory=(SessionFactory)configApplnContext.getBean("sessionFactory");
		categoryDao = (CategoryDao) configApplnContext.getBean("categoryDao");
		System.out.println(categoryDao);
	}
	
	@Ignore
	@Test
	public void addCategorytest() {
		Category category = new Category();
		//category.setCatId(1001);
		category.setCatName("Birthday Flowers");
		category.setCatDesc("year wise birthday flowers");
		assertTrue(categoryDao.addCategory(category));

		//assertEquals(true, categoryDAO.addCategory(category));
	}

	@Test
	@Ignore
	public void updateCategoryTest() {
		Category category = new Category();
		category.setCatId(1002);
		category.setCatName("jmshirt");
		category.setCatDesc("smart phone with NFC,4G");

		assertTrue(categoryDao.addCategory(category));
	}

	@Ignore
	@Test
	public void deleteCategoryTest() {
		Category category = new Category();
		category.setCatId(1006);
		assertTrue(categoryDao.deleteCategory(category));
	}

	@Ignore
	@Test
	public void retrieveCategoryTest() {
		List<Category> listCategory = categoryDao.retriveCategory();
		assertNotNull("Problem in Retriving", listCategory);
	}

	public void show(List<Category> listCategory) {
		for (Category category : listCategory) {
			System.out.println("CAtegory ID:" + category.getCatId());
			System.out.println("Category Name:" + category.getCatName());

		}
	}

	@Ignore
	@Test
	public void getCategoryTest() {
		Category category = categoryDao.getCategory(1002);
		assertNotNull("Problem is Getting:", category);
		System.out.println("CAtegory ID:" + category.getCatId());
		System.out.println("Category Name:" + category.getCatName());

	}
}
