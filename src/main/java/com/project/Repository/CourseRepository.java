package com.project.Repository;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.Bean.Course;
import com.project.Bean.Student;
import com.project.Bean.Teacher;

@Repository
public interface CourseRepository extends JpaRepository<Course, Integer>{
	
	Optional<Course> getByTeacher(Teacher Teacher);
	
	 Set<Student> findStudentsById(Integer courseId);
	
}
