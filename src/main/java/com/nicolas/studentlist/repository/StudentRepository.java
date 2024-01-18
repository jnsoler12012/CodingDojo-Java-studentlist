package com.nicolas.studentlist.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nicolas.studentlist.models.Student;

@Repository
public interface StudentRepository extends CrudRepository <Student, Long>{
	
	List<Student> findAllByContactNullOrderByLastName();
    List<Student> findAll();
    List<Student> findAllByDormitoryNullOrderByLastName();
}
