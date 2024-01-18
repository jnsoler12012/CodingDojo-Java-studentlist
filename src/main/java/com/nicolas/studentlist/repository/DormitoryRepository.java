package com.nicolas.studentlist.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nicolas.studentlist.models.Dormitory;

@Repository
public interface DormitoryRepository extends CrudRepository<Dormitory, Long>{
	List<Dormitory> findByOrderByName();
}
