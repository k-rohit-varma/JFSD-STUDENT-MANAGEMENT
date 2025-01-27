package com.klef.jfsd.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Email;
import com.klef.jfsd.springboot.repository.StudentRepository;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class EmailController {
	
	@Autowired
	StudentRepository studentRepository;
	
	@Autowired
	StudentService stService;
	
	@Autowired
	public RestTemplate restTemplate;
	
	@GetMapping("/emailPage")
	public ModelAndView emailPage()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("email");
		return mv;
	}
	
	@PostMapping("/sending")
	public ModelAndView sendingEmail(HttpServletRequest request)
	{
		String fromEmail="kunaparajurohitvarma@gmail.com";
		String toEmail = request.getParameter("toEmail");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		Email e = new Email();
		e.setFromEmail(fromEmail);
		e.setMessage(message);
		e.setSubject(subject);
		e.setToEmail(toEmail);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		HttpEntity<Email> requestEntity = new HttpEntity<Email>(e,headers);
		
		String url="http://localhost:1234/mail/send";
		ResponseEntity<String> res = restTemplate.exchange(url,HttpMethod.POST,requestEntity,String.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminhome");
		return mv;
	}
	
	@PostMapping("forgetPassword")
	public ResponseEntity<String> forgetPassword(@RequestParam String email) {
	    if (!stService.checkEmail(email)) {
	        return new ResponseEntity<>("Wrong email entered. Email does not exist!", HttpStatus.OK);
	    }

	    String resetUrl = "http://localhost:32154/resetPassword?email=" + email;
	    String fromEmail = "kunaparajurohitvarma@gmail.com";
	    String subject = "Reset Password";
	    String message = "Click the following link to reset your password: " + resetUrl;

	    Email e = new Email();
	    e.setFromEmail(fromEmail);
	    e.setToEmail(email);
	    e.setSubject(subject);
	    e.setMessage(message);

	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    HttpEntity<Email> requestEntity = new HttpEntity<>(e, headers);

	    String url = "http://localhost:1234/mail/send";
	    restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class);

	    return new ResponseEntity<>("An email has been sent to your email address. Check it!", HttpStatus.OK);
	}

	
	@GetMapping("resetPassword")
	public ModelAndView resetPassword(@RequestParam String email) {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("resetPassword");
	    mv.addObject("email", email); 
	    return mv;
	}

	
	
	@GetMapping("urlforgetpass")
	public ModelAndView urlforgetpass()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("forgetpass");
		return mv;
	}
	
	 
	
	@PostMapping("getNewPass")
	public ResponseEntity<String> getNewPass(@RequestParam String email, @RequestParam String password) {
	    
	    String encryptedPassword =password;

	    
	    boolean isUpdated = stService.updatePassword(email, encryptedPassword);

	    if (isUpdated) {
	        return new ResponseEntity<>("Password updated successfully!", HttpStatus.OK);
	    } else {
	        return new ResponseEntity<>("Failed to update the password. Please try again.", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}


	
	
}
