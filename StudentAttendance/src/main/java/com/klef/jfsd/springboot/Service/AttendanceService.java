package com.klef.jfsd.springboot.Service;

import java.util.List;

public interface AttendanceService {

	List<Integer> getStudents(String eventName);
	
}