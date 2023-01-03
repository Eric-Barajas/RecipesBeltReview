package com.ericbarajas.recipesbeltreview.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ericbarajas.recipesbeltreview.models.Question;
import com.ericbarajas.recipesbeltreview.repositories.QuestionRepository;

@Service
public class QuestionService {
	@Autowired
	QuestionRepository qRepo;
	
	// CREATE
	public Question create(Question newQuestion) {
		return qRepo.save(newQuestion);
	}
	
	// READ ALL
	public List<Question> getAllQuestions(){
		return qRepo.findAll();
	}
	// READ ONE
	public Question getOneQuestion(Long id) {
		return qRepo.findById(id).orElse( null);
	}
	
	// UPDATE
	
	// DELETE
	public void deleteQuestion(Long id) {
		qRepo.deleteById(id);
	}
}
