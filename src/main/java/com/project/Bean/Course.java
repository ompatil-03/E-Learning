package com.project.Bean;

import java.io.File;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Course {
	
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)  
	    private Integer id; 

	    private String name;

	    @ManyToOne
	    @JoinColumn(name = "teacher_id", nullable = false)
	    private Teacher teacher;

	    @ManyToMany(mappedBy = "courses")
	    @JsonIgnore
	    private Set<Student> students = new HashSet<>();
	    
	    private String progress="not_started";
	    
	    private String link;
	    
	    private String topic;
	    
	    private String studyMaterial;
	  
		private String description;
		
		
		//********************Contstrutor************************************
		
		public Course(Integer id, String name, Teacher teacher, String link, String topic, String studyMaterial,
				String description,String progrss) {
			super();
			this.id = id;
			this.name = name;
			this.teacher = teacher;
			this.link = link;
			this.topic = topic;
			this.studyMaterial = studyMaterial;
			this.description = description;
			this.progress=progress;
		}

		public Course() {
		}
		
		//********************Getter and Setters **************************
	    
	    public String getLink() {
			return link;
		}

		public void setLink(String link) {
			this.link = link;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}



		public String getProgress() {
			return progress;
		}

		public void setProgress(String progress) {
			this.progress = progress;
		}

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public Teacher getTeacher() {
			return teacher;
		}

		public void setTeacher(Teacher teacher) {
			this.teacher = teacher;
		}

		public Set<Student> getStudents() {
			return students;
		}

		public void setStudents(Set<Student> students) {
			this.students = students;
		}
	

		public String getTopic() {
			return topic;
		}

		public void setTopic(String topic) {
			this.topic = topic;
		}

		public String getStudyMaterial() {
			return studyMaterial;
		}

		public void setStudyMaterial(String studyMaterial) {
			this.studyMaterial = studyMaterial;
		}

		
		@Override
		public String toString() {
		    return "Course [id=" + id + ", name=" + name + ", teacher=" + (teacher != null ? teacher.getName() : "null") + ", progress=" + progress + ", link=" + link + ", topic=" + topic + ", description=" + description + "]";
		}
 
}
