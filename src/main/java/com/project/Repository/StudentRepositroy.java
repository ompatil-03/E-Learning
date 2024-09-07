package com.project.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.Bean.Student;

public interface StudentRepositroy  extends JpaRepository<Student, Integer> {
   Optional<Student> findByEmail(String email);
}
