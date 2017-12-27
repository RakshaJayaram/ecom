package com.niit.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.dao.SupplierDao;
import com.niit.model.Supplier;

@Controller
@RequestMapping
public class SupplierController {
	
	@Autowired
	SupplierDao supplierDao;

	@RequestMapping(value = "createSupplier", method = RequestMethod.GET)
	public String showSupplier(Model m) {
		System.out.println("my supplier");
		Supplier supplier = new Supplier();
		m.addAttribute(supplier);

		return "createSupplier";
	}

	@RequestMapping(value = "AddSupplier", method = RequestMethod.POST)
	public String addSupplier(@Valid @ModelAttribute("supplier") Supplier supplier, BindingResult result, Model m) {
		if (result.hasErrors())
			return "createSupplier";

		supplierDao.addSupplier(supplier);

		List<Supplier> listSupplier = supplierDao.retriveSupplier();
		m.addAttribute("supplierList", listSupplier);

		return "supplier";
	}

	@RequestMapping(value = "getAllsuppliers", method = RequestMethod.GET)
	public String display(Model m) {

		Supplier supplier = new Supplier();
		m.addAttribute(supplier);

		List<Supplier> listSupplier = supplierDao.retriveSupplier();
		m.addAttribute("supplierList", listSupplier);

		return "supplier";

	}

	@RequestMapping(value = "updateSupplier/{supplierId}", method = RequestMethod.GET)
	public String updateSupplier(@PathVariable("supplierId") int supplierId, Model m) {

		Supplier supplier = supplierDao.getSupplier(supplierId);
		m.addAttribute(supplier);

		List<Supplier> listSupplier = supplierDao.retriveSupplier();
		m.addAttribute("supplierList", listSupplier);

		return "updateSupplier";

	}

	@RequestMapping(value = "updateSupplier", method = RequestMethod.POST)
	public String updateMySupplier(@Valid @ModelAttribute("supplier") Supplier supplier,BindingResult result, Model m) {
		if (result.hasErrors())
			return "updateSupplier";
		
		supplierDao.updateSupplier(supplier);

		Supplier supplier1 = new Supplier();
		m.addAttribute(supplier1);

		List<Supplier> listSupplier = supplierDao.retriveSupplier();
		m.addAttribute("supplierList", listSupplier);

		return "redirect:/getAllsuppliers";
	}

	@RequestMapping(value = "deleteSupplier/{supplierId}", method = RequestMethod.GET)
	public String deleteSupplier(@PathVariable("supplierId") int supplierId, Model m) {

		Supplier supplier = supplierDao.getSupplier(supplierId);
		supplierDao.deleteSupplier(supplier);
		List<Supplier> listSupplier = supplierDao.retriveSupplier();
		m.addAttribute("supplierList", listSupplier);
		return "redirect:/getAllsuppliers";
	}
}
