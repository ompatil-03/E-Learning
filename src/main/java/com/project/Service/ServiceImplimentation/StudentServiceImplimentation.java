package com.project.Service.ServiceImplimentation;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.hibernate.annotations.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.Bean.Course;
import com.project.Bean.Student;
import com.project.Repository.CourseRepository;
import com.project.Repository.StudentRepositroy;
import com.project.Service.StudentService;

@Component
public class StudentServiceImplimentation implements StudentService {
	
	@Autowired
	private StudentRepositroy studentRepo;
	
	@Autowired
	private CourseRepository courseRepo;

	@Override
	public Student saveUser(Student student) {
		studentRepo.save(student);
		return student;
	}

	@Override
	public Optional<Student> getUserById(int id) {
		return studentRepo.findById(id);
	}

	@Override
	public Student updateUser(Student student) {
		Optional<Student>optional=studentRepo.findById(student.getId());
		Student newStudent=optional.get();
		newStudent.setName(student.getName());
		newStudent.setEmail(student.getEmail());
		newStudent.setCourses(student.getCourses());
		newStudent.setPassword(student.getPassword());
		
		return newStudent;
	}

	@Override
	public void deleteUser(int id) {
		studentRepo.deleteById(id);
	}

	@Override
	public boolean isUserExist(int id) {
		Optional<Student>student=studentRepo.findById(id);
		return student.isPresent();
	}

	@Override
	public boolean isUserExistByEmail(String email) {
		Optional<Student> optionalStudent=studentRepo.findByEmail(email);
		return optionalStudent.isPresent();
	}

	@Override
	public List<Student> getAllUsers() {
		List<Student> studentList=studentRepo.findAll();
		return studentList;
	}

	@Override
	public Student getUserByEmail(String email) {
		Optional<Student> optionalStudent=studentRepo.findByEmail(email);
	    if(optionalStudent.isPresent()) {
	    	Student student=optionalStudent.get();
	    	return student;
	    }else {
	    	return null;
	    }
		
	}

	@Override
	public void enrollStudentInCourse(int studentId, int courseId) {
		
		Student student = studentRepo.findById(studentId).orElseThrow(() -> new RuntimeException("Student not found"));
	    Course course = courseRepo.findById(courseId).orElseThrow(() -> new RuntimeException("Course not found"));

	    student.getCourses().add(course);
	    studentRepo.save(student);
	}


}
