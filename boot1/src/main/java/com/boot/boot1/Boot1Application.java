package com.boot.boot1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class Boot1Application {

	public static void main(String[] args) {
		SpringApplication.run(Boot1Application.class, args);
	}
@RequestMapping("/hello")
	public ResponseEntity<String> hello() {
	return new ResponseEntity<>("hello world", HttpStatus.OK);
}
}
