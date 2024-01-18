package com.nicolas.studentlist.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nicolas.studentlist.models.Contact;
import com.nicolas.studentlist.models.Dormitory;
import com.nicolas.studentlist.models.Student;
import com.nicolas.studentlist.repository.ContactRepository;
import com.nicolas.studentlist.repository.DormitoryRepository;
import com.nicolas.studentlist.repository.StudentRepository;

@Service
public class ApiService {
	@Autowired
	private StudentRepository studentRepo;
    @Autowired
	private ContactRepository contactRepo;

	@Autowired
	private DormitoryRepository dormRepository;


	public List<Student> findByContactNull() {
		return studentRepo.findAll();
	}
	
	public Student createStudent(Student student) {
		return studentRepo.save(student);
	}

	public Dormitory createDorm(Dormitory dormitory) {
		return dormRepository.save(dormitory);
	}

	public List<Dormitory> findAllDorms() {
		return dormRepository.findByOrderByName();
	}
	
	public Dormitory findOneDorm(Long id) {
		return dormRepository.findById(id).orElse(null);
	}

	public List<Student> findByDormNull() {
		return studentRepo.findAllByDormitoryNullOrderByLastName();
	}
	

	public Contact createContact(Contact contact) {
		return contactRepo.save(contact);
	}

	public void addStudent(Long dormId, Long studentId) {
		Optional<Student> student = studentRepo.findById(studentId);
		Optional<Dormitory> dorm = dormRepository.findById(dormId);
		if (student.isPresent() && dorm.isPresent()) {
			student.get().setDormitory(dorm.get());
			List<Student> residents = dorm.get().getStudents();
			residents.add(student.get());
			dorm.get().setStudents(residents);
			studentRepo.save(student.get());
			dormRepository.save(dorm.get());
		}
	}

	public void removeStudent(Long dormId, Long studentId) {
		Optional<Student> student = studentRepo.findById(studentId);
		Optional<Dormitory> dorm = dormRepository.findById(dormId);
		if (student.isPresent() && dorm.isPresent()) {
			student.get().setDormitory(null);
			List<Student> residents = dorm.get().getStudents();
			residents.remove(student.get());
			dorm.get().setStudents(residents);
			studentRepo.save(student.get());
			dormRepository.save(dorm.get());
		}
	}
}
