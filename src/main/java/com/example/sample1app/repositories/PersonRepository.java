package com.example.sample1app.repositories;

import java.util.Optional;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.sample1app.Person;

@Repository
public interface PersonRepository extends JpaRepository<Person, Long>{

    @Query("SELECT d FROM Person d ORDER BY d.name")
    List<Person> findAllOrderByName();
    
    public Optional<Person> findById(Long name); //☆
    public List<Person> findByNameLike(String name);
    public List<Person> findByIdIsNotNullOrderByIdDesc();
    public List<Person> findByAgeGreaterThan(Integer age);
    public List<Person> findByAgeBetween(Integer age1, Integer age2);
    @Query("from Person where age > :min and age < :max")
    public List<Person> findByAge(@Param("min") int min, @Param("max") int max);
}
