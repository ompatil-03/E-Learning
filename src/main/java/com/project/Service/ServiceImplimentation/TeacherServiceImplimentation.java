package com.project.Service.ServiceImplimentation;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.Bean.Teacher;
import com.project.Repository.TeacherRepository;
import com.project.Service.TeacherService;

@Component
public class TeacherServiceImplimentation implements TeacherService{
	
	@Autowired
	TeacherRepository teacherRepo;

	@Override
	public Teacher saveTeacher(Teacher teacher) {
		Teacher a=teacherRepo.save(teacher);
		return a;
	}

	@Override
	public Optional<Teacher> getTeacherByEmail(String email) {
		Optional<Teacher> teacher1=teacherRepo.findByEmail(email);
		return teacher1;
	}


	@Override
	public boolean isTeacherExistsByEmail(String email) {
		Optional<Teacher> teacher1=teacherRepo.findByEmail(email);
		Teacher teacher=teacher1.get();
		if(teacher==null) {
		return false;
		}else {
			return true;
		}
	}

	@Override
	public void deleteTeacher(int id) {
		  teacherRepo.deleteById(id);
	}

	@Override
	public List<Teacher> getAllTeacher() {
		List<Teacher> teacherList=teacherRepo.findAll();
		return teacherList;
	}

	@Override
	public Teacher updateTeacher(Teacher teacher) {
		if(teacherRepo.existsById(teacher.getId())) {
			return teacherRepo.save(teacher);
		}else {
            throw new EntityNotFoundException("Student not found with id " + teacher.getId());
        }
	}

	@Override
	public Teacher getTeacherById(int id) {
		Teacher teacher=teacherRepo.getById(id);
		return teacher;
	}
}
