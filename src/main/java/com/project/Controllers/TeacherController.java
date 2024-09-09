
package com.project.Controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.Bean.Course;
import com.project.Bean.Student;
import com.project.Bean.Teacher;
import com.project.Service.CourseService;
import com.project.Service.StudentService;
import com.project.Service.TeacherService;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	
	@Autowired
	TeacherService teacherService;
	
	@Autowired
	CourseService courseService;
	
	@Autowired 
	StudentService studentService;
	
	
	//**************************Login Logic here*****************************************
	@RequestMapping("/login")
	public String teacher() {
		return "TeacherLogin.jsp";
	}
	
	@RequestMapping("/loginform")
	public String teacherLogin(@ModelAttribute Teacher formTeacher) {
		Optional<Teacher> varify=teacherService.getTeacherByEmail(formTeacher.getEmail());
		Teacher databaseTeacher = null;
		if(varify.isPresent()) {
			databaseTeacher=varify.get();
		}
		if(databaseTeacher!=null&&databaseTeacher.getEmail().equals(formTeacher.getEmail())) {
			int id=databaseTeacher.getId();
			return "redirect:/teacher/dashboard?id="+id;
		}else {
			System.out.println("user input:"+formTeacher);
			System.out.println("data base :"+databaseTeacher);
			System.out.println("Teacher Login Failed !!!!!!!!!!");
			return "redirect:/teacher/login";
		}
		
	}
	@RequestMapping("/dashboard")
	public String teacherDashboard(@RequestParam("id")int id, Model model) {
		
		//Passing the teacher related information to the jsp page 
		Teacher teacher=teacherService.getTeacherById(id);
		model.addAttribute("teacher",teacher);
		model.addAttribute("teacherId",id);
	  
		//Collecting & Passing all the courses
		List<Course>courseList=courseService.getAll();
		 model.addAttribute("courseList",courseList);
		 
		 //Collecting & Passing all student enrolled for all courses by the teacher
		 Map<Course, Set<Student>> courseStudentMap = new HashMap<>();
		    for (Course course : courseList) {
		        Set<Student> students = course.getStudents();  
		        courseStudentMap.put(course, students);
		    }
		    model.addAttribute("courseStudentMap", courseStudentMap);
		return "TeacherDashboard.jsp";
	}
	
	//*****************************SignUp Login Here*************************************
	
	
	@RequestMapping("/signup")
	public String teacherSignUp() {
		return "TeacherSignUp.jsp";
	}
	
	@RequestMapping("/signupform")
	public String teacherSignUp1(@ModelAttribute Teacher teacher) {
	  Teacher teacher1= teacherService.saveTeacher(teacher);
	  System.out.println(teacher1);
		return"redirect:/teacher/login";
	}
	
	
	//*****************************************Creating & Deleting Course****************************************
	
	@RequestMapping("/createCourse")
	public String createCourse(@ModelAttribute Course formCourse, @RequestParam("teacherId") int teacherId) {
	    Teacher teacher = teacherService.getTeacherById(teacherId); 
	    if (teacher == null) {
	        
	        return "redirect:/teacher/dashboard?error=TeacherNotFound";
	    }	   
	    formCourse.setTeacher(teacher); 
	    Course savedCourse = courseService.saveCourse(formCourse);   	   
	    System.out.println("This is course from createCourse: " + savedCourse);	    
	    return "redirect:/teacher/dashboard?id=" + teacherId;
	}
	
	@RequestMapping("/deleteCourse")
	public String deleteCourse(@RequestParam("id") int id) {
		courseService.deleteCourse(id);
		return"redirect:/teacher/dashboard?id="+id;
	}
	
	@RequestMapping("/editCourse")
	public String editCourse(@RequestParam("courseId")int courseId,Model model,@RequestParam("teacherId")int teacherId) {
		System.out.println("The teacher id in edit coures is :"+teacherId);
		Course course=courseService.getById(courseId);
		model.addAttribute("course",course);
		model.addAttribute("teacherId", teacherId);
		return"EditCourse.jsp";
	}
	
	@RequestMapping("/updateCoures")
	public String updateCoures(@ModelAttribute Course course ,@RequestParam("teacherId")int teacherId,@RequestParam("courseId")int courseId) {
		System.out.println("Teacher ID: " + teacherId);
		Teacher teacher=teacherService.getTeacherById(teacherId);
		course.setTeacher(teacher);
		course.setId(courseId);

		if(course!=null) {
			courseService.saveCourse(course);
		}
		
		return "redirect:/teacher/dashboard?id="+teacherId;
	}
	
	//**********************************Logout********************************************************
	@RequestMapping("/logout")
	public String logout() {
		return "redirect:/";
	}

}
