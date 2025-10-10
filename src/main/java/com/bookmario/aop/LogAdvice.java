package com.bookmario.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class LogAdvice {

	@Before("execution(* com.bookmario.service.BookService*.*(..))")
	public void logBefore() {
		log.info("[공통 로그] 비즈니스 로직 수행 전 동작");
	}
	
	// 파라미터의 값이 잘못되어서 발생하는 예외를 찾을 수 있게 도와줍니다.
	@AfterThrowing(pointcut = "execution(* com.bookmario.service.*.*(..))", throwing="exception")
	public void logException(Exception exception) {
		log.info("Exception....!!!!");
		log.info("exception: " + exception);
		log.error("Exception occurred in BookService", exception);
	}
	
	// Around가 먼저 동작하고, Before 등이 실행 된 후에 메서드가 실행되는데 걸린 시간을 기록합니다.
	@Around("execution(* com.bookmario.service.*.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) {
		long start = System.currentTimeMillis();
		log.info("Target: " + pjp.getTarget());
		log.info("Param: " + Arrays.deepToString(pjp.getArgs()));
		
		Object result = null;
		try {
			result = pjp.proceed();
		} catch (Throwable e) {
			//e.printStackTrace();
		} 
		long end = System.currentTimeMillis();
		log.info("TIME: " + (end - start));
		return result;
	}
	
}
