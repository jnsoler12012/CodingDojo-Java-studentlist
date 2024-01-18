package com.nicolas.studentlist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nicolas.studentlist.models.Contact;
import com.nicolas.studentlist.models.Dormitory;
import com.nicolas.studentlist.models.Student;
import com.nicolas.studentlist.services.ApiService;

import jakarta.validation.Valid;

@Controller
public class HomeController {

    @Autowired
    ApiService apiService;

    @RequestMapping("/students")
	public String studentIndex( Model model) {
		List<Student> students = apiService.findByContactNull();

		model.addAttribute("students", students);
		return "students";
	}

    @RequestMapping("/students/create")
    public String newStudent(@ModelAttribute("student") Student student) {
        return "newStudent";
    }

    @RequestMapping("/contacts/create")
    public String newContact(@ModelAttribute("contact") Contact contact, Model model) {
        List<Student> students = apiService.findByContactNull();
        model.addAttribute("students", students);
        return "newContact";
    }

    @RequestMapping(value = "/students", method = RequestMethod.POST)
    public String createStudent(
            @Valid @ModelAttribute("student") Student student,
            BindingResult result) {
        if (result.hasErrors()) {
            return "newStudent";
        } else {
            apiService.createStudent(student);
            return "redirect:/students";
        }
    }

    @RequestMapping(value="/contacts", method=RequestMethod.POST)
	public String createContact(
			@Valid @ModelAttribute("contact") Contact contact,
			BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			List<Student> students = apiService.findByContactNull();
			model.addAttribute("students", students); 
			return "newContact";
		} else {
			apiService.createContact(contact);
			return "redirect:/students";
		}
	}


    @RequestMapping("/dorms")
	public String dormIndex(Model model) {
		List<Dormitory> dorms = apiService.findAllDorms();
		model.addAttribute("dorms", dorms);
		return "dorms";
	}

    @RequestMapping(value="/dorms", method=RequestMethod.POST)
	public String createDorm(
			@Valid @ModelAttribute("dorm") Dormitory dorm,
			BindingResult result) {
		if (result.hasErrors()) {
			return "newDorm";
		} else {
			apiService.createDorm(dorm);
			return "redirect:/dorms";
		}
	}

    @RequestMapping("/dorms/{id}")
	public String showDorm(@PathVariable("id") Long id, Model model) {
		Dormitory dorm = apiService.findOneDorm(id);
		List<Student> students = apiService.findByDormNull();
		model.addAttribute("dorm", dorm);
		model.addAttribute("students", students);
		return "showDorm";
	}

    @RequestMapping("/dorms/new")
	public String newDorm(@ModelAttribute("dorm") Dormitory dorm) {
		return "newDorm";
	}

    @RequestMapping("/dorms/{dormId}/remove/{studentId}")
	public String removeStudent(
			@PathVariable("dormId") Long dormId,
			@PathVariable("studentId") Long studentId) {
		apiService.removeStudent(dormId, studentId);
		return "redirect:/dorms/" + dormId;
	}

    @RequestMapping(value="/dorms/{id}/addStudent", method=RequestMethod.POST)
	public String addStudent(
			@PathVariable("id") Long dormId,
			@RequestParam(name="studentId") Long studentId) {
		apiService.addStudent(dormId, studentId);
		return "redirect:/dorms/" + dormId;
	}
}
