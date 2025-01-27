package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Student;

public interface StudentService {
	public Student checkStudentLogin(String id,String password);
	
	public boolean checkEmail(String email);
	
	public boolean updatePassword(String email, String newPassword);
	
	 public Student getStudentById(String id);
	
	 public Student SaveStudent(Student stu);
}
