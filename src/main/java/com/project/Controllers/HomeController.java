package com.project.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.Bean.Student;
import com.project.Repository.StudentRepositroy;


@Controller

public class HomeController {
		@RequestMapping("/")
		public String home() {
			return "Home.jsp";
		}
			
}
