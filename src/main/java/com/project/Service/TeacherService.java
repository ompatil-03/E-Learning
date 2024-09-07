package com.project.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.project.Bean.Teacher;

@Service
public interface TeacherService {
		
	Teacher saveTeacher(Teacher teacher);
	
	Optional<Teacher> getTeacherByEmail(String email);
	
	Teacher updateTeacher(Teacher teacher);
	
	boolean isTeacherExistsByEmail(String email);

	Teacher getTeacherById(int id);
	
	void deleteTeacher(int id);
	
	List<Teacher> getAllTeacher();
}
