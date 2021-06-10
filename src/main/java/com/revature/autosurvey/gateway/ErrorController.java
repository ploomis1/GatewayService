package com.revature.autosurvey.gateway;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import reactor.core.publisher.Mono;

@Controller
public class ErrorController {

  @GetMapping(value="error")
  public Mono<ResponseEntity<String>> handleError() {

    return Mono.just(ResponseEntity.status(503).body("Service is currently down, please try again in a few minutes."));
  }
}
