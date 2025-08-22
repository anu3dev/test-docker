package com.sb.learndockermysql;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StudentController {
	
	@Autowired
	StudentRepo repo;
	
	@RequestMapping("/getStudents")
	public List<Student> getStudents() {
		return repo.findAll();
	}
	
	@RequestMapping("/addStudents")
	public void addStudents() {
		Student s = new Student();
		s.setName("Rita");
		s.setAge(55);
		s.setCity("gaya");
		
		repo.save(s);
	}
}
