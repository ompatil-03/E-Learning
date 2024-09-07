package com.project.Controllers;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.Bean.Course;
import com.project.Bean.Student;
import com.project.Repository.StudentRepositroy;
import com.project.Service.CourseService;
import com.project.Service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	StudentService studentService;
	
	@Autowired
	CourseService courseService;
	
    //**********************************Login Login Here *******************************************
	@RequestMapping("/login")
	public String studentLogin() {
		return "StudentLogin.jsp";
	}
	@RequestMapping("/loginform")
	public String studentLoginHelper(@ModelAttribute Student formStudent) {	
		
		Student databaseStudent=studentService.getUserByEmail(formStudent.getEmail());		
		if( studentService.isUserExistByEmail(formStudent.getEmail())&&databaseStudent.getEmail().equals(formStudent.getEmail())){
			
			int id=databaseStudent.getId();
			return "redirect:/student/dashboard?id="+id;
		}else {
		    System.out.println("Login failed !!! ");
		    return "redirect:/student/login";
		}
		
	}
	
	
	//*************************************SignUp Logic Here ********************************************
	@RequestMapping("/signup")
	public String studentSignUp() {
		return"StudentSignUp.jsp";
	}
	@PostMapping("/signupform")
	public String studentSignUpFrom(@ModelAttribute Student student) {
		Student status1=studentService.saveUser(student);
		return "redirect:/student/login";
	}
	//************************************Student Dashboard*********************************************
	@RequestMapping("/dashboard")
	public String dashboard(@RequestParam("id") int id,Model model) {
		Optional<Student> optionalStudent=studentService.getUserById(id);
		Student student=null;
		if(optionalStudent.isPresent()) {
			student=optionalStudent.get();
		}
		if(student!=null) {
			   model.addAttribute("student",student); 
			   Set<Course> courseList= student.getCourses();
			   model.addAttribute("enrolledCourse",courseList);
			   List<Course> allCourse=courseService.getAll();
			   model.addAttribute("allCourse",allCourse);
		}else {
			System.out.println("No student found in dashBoard controller method........");
		}
	    
		return "StudentDashboard.jsp";
	}
	
	 @PostMapping("/enroll")
	    public String enrollCourse(@RequestParam("courseId") int courseId, @RequestParam("studentId") int studentId, Model model) {
	        Optional<Student> optionalStudent = studentService.getUserById(studentId);
	        Course optionalCourse = courseService.getById(courseId);
	        if (optionalStudent.isPresent() && optionalCourse!=null) {
	            Student student = optionalStudent.get();
	            Course course = optionalCourse;
	            student.getCourses().add(course);
	            studentService.saveUser(student);
	            return "redirect:/student/dashboard?id=" + studentId;
	        } else {
	            return "error";
	        }
	    }
	 
	 @PostMapping("/dropCourse")
	 public String dropCourse(@RequestParam("courseId") int courseId, @RequestParam("studentId") int studentId, Model model) {
		 Optional<Student> optionalStudent = studentService.getUserById(studentId);
	        Course optionalCourse = courseService.getById(courseId);
	        if (optionalStudent.isPresent() && optionalCourse!=null) {
	            Student student = optionalStudent.get();
	            Course course = optionalCourse;
	            student.getCourses().remove(course);
	            studentService.saveUser(student);
	            return "redirect:/student/dashboard?id=" + studentId;
	        } else {
	            return "error";
	        }
		
	 }
	 
	 @PostMapping("/updateProgress")
	 public String updateProgress(@RequestParam("courseId") int courseId, @RequestParam("studentId") int studentId,@RequestParam("progress") String progress) {
		 Optional<Student>optionalStudent=studentService.getUserById(studentId);
		 Course course=courseService.getById(courseId);
		 System.out.println("The course you SELECTED IS :"+course);
		 if(optionalStudent.isPresent()&&course!=null) {
			 Student student=optionalStudent.get();
			 Set<Course> courseSet=student.getCourses();
			 int count=0;
			 for(Course e:courseSet) {
				 if(e.equals(course)) {
					 e.setProgress(progress);
					 count++;
				 }
			 }
			 studentService.saveUser(student);
			 if(count==0)System.out.println("No course where updated !");
		 }
		 return"redirect:/student/dashboard?id="+studentId;
	 }

}
