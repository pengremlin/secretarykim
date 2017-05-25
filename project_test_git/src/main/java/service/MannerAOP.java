package service;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class MannerAOP {
  // @Before ->이것이 바로 포인트컷​
  @Before("execution(* list())")
  // 반환형에 상관없고, 메소드이름이 set으로 시작하고, 인자가 String인 함수가 나오기 전에 아래 advice가 실행된다.
  public void confirmName() {
    System.out.println("목록을 불러옵니다."); // 여기가 advice
  }
  
  
  @AfterThrowing(pointcut = "execution(* *(*))", throwing = "e")
  public String myAfterThrowing(JoinPoint joinPoint, Throwable e) {

    System.out.println("Okay - we're in the handler...");
    
    Signature signature = joinPoint.getSignature();
    String methodName = signature.getName();
    String stuff = signature.toString();
    String arguments = Arrays.toString(joinPoint.getArgs());
    System.out.println("찍혀" +"Write something in the log... We have caught exception in method: "
            + methodName + " with arguments "
            + arguments + "\nand the full toString: " + stuff + "\nthe exception is: "
            + e.getMessage());
    
    	return "index.htm";
    
  }
  


 /* @Before("execution(*li*())")
  // 반환형에 상관없고, 메소드이름이 set으로 시작하고, 인자가 String인 함수가 나오기 전에 아래 advice가 실행된다.
  public void list() {
    System.out.println("이름을 세팅합니다."); // 여기가 advice
  }*/

 /* @Before("execution(* set*(int))")
  // 반환형에 상관없고, 메소드이름이 set으로 시작하고, 인자가 int인 함수가 나오기 전에 아래 advice가 실행된다.
  public void confirmAge() {
    System.out.println("모델번호를 세팅합니다."); // advice
  }


  // 반환형에 상관없고, 메소드이름이 set으로 시작하고, 인자가 int인 함수가 나오고나서 무조건 실행된다. 마치 finally처럼. 예외가 있던없던, 아래 advice가
  // 실행된다.
  @After("execution(* set*(int))")
  public void confirmAge2() {
    System.out.println("모델번호를 셋팅하기 이후입니다.");
  }*/
  
  

  

 
}
