package com.project.Service;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.project.Bean.Course;
import com.project.Bean.Teacher;
import com.project.Bean.Student;

@Service
public interface CourseService {
	
	Course saveCourse(Course course);
	
	Course getById(int id);
	
	Course getByTeacher(Teacher Teacher);
	
	List<Course> getAll();
		
	void deleteCourse(int id);
	
   Set<Student> getStudentsByCourseId(Integer integer);
}
