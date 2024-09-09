package com.project.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.project.Bean.Student;

@Service
public interface StudentService {
	
	   Student saveUser(Student user);
	 
	    Optional<Student> getUserById(int id);
	    
	    Student updateUser(Student student);
	    
	    void deleteUser(int id);
	    
	    boolean isUserExist(int userId);
	    
	    boolean isUserExistByEmail(String email);
	    
	    List<Student> getAllUsers();
	    
	    Student getUserByEmail(String email);
	    
	    void enrollStudentInCourse(int studentId,int courseId);

}
