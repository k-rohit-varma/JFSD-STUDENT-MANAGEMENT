package com.klef.jfsd.springboot.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.klef.jfsd.springboot.model.EventRegesteredStudent;
import com.klef.jfsd.springboot.model.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, String>{

	@Query("select s from Student s where s.id=?1 and s.password=?2")
	public Student checkStudentLogin(String id,String password);
	
	Optional<Student> findByEmail(String email);
	
	@Transactional
	@Modifying
	@Query("UPDATE Student s SET s.password = :password WHERE s.email = :email")
	int updatePassword(@Param("email") String email, @Param("password") String password);
	
	
	@Query("SELECT s FROM Student s WHERE s.id = ?1")
    Student findStudentById(String id);
	
}
