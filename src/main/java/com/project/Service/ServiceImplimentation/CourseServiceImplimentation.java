package com.project.Service.ServiceImplimentation;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.Bean.Course;
import com.project.Bean.Teacher;
import com.project.Bean.Student;
import com.project.Repository.CourseRepository;
import com.project.Service.CourseService;

@Component
public class CourseServiceImplimentation implements CourseService{
	@Autowired
	CourseRepository courseRepo;

	@Override
	public Course getById(int id) {
		Optional<Course> course=courseRepo.findById(id);	
		return course.get();
	}

	@Override
	public Course getByTeacher(Teacher Teacher) {
		Optional<Course> course=courseRepo.getByTeacher(Teacher);
		return course.get();
	}

	@Override
	public List<Course> getAll() {
		List<Course> courseList=courseRepo.findAll();
		return courseList;
	}

	@Override
	public void deleteCourse(int id) {
		courseRepo.deleteById(id);
		System.out.println("Course Deleted Succesfully");
	}

	@Override
	public Course saveCourse(Course course) {
		return courseRepo.save(course);
	}
	
	@Override
	 public Set<Student> getStudentsByCourseId(Integer courseId) {
        return courseRepo.findStudentsById(courseId);
    }

}
