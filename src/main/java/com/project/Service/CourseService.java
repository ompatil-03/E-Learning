package com.project.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.Bean.Course;
import com.project.Bean.Teacher;

@Service
public interface CourseService {
	
	Course saveCourse(Course course);
	
	Course getById(int id);
	
	Course getByTeacher(Teacher Teacher);
	
	List<Course> getAll();
		
	void deleteCourse(int id);
}
