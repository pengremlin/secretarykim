package Emp.DTO;

import java.sql.Date;
/*
* @FileName : Sal.java
* @Project
* @Date
: Emp.DTO
: 2016. 6. 02.
*/
public class Sal {
	private int sal_no;
	private int sal;
	private int sal_traffic;
	private int sal_food;
	private int allow_no;
	private int sal_etc;
	private int sal_sum;
	private int step_no;
	private int appr_no;
	private String sal_division;
	
	public int getSal_no() {
		return sal_no;
	}
	public void setSal_no(int sal_no) {
		this.sal_no = sal_no;
	}
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	public int getSal_traffic() {
		return sal_traffic;
	}
	public void setSal_traffic(int sal_traffic) {
		this.sal_traffic = sal_traffic;
	}
	public int getSal_food() {
		return sal_food;
	}
	public void setSal_food(int sal_food) {
		this.sal_food = sal_food;
	}
	public int getSal_etc() {
		return sal_etc;
	}
	public void setSal_etc(int sal_etc) {
		this.sal_etc = sal_etc;
	}
	public int getSal_sum() {
		return sal_sum;
	}
	public void setSal_sum(int sal_sum) {
		this.sal_sum = sal_sum;
	}
	public int getStep_no() {
		return step_no;
	}
	public void setStep_no(int step_no) {
		this.step_no = step_no;
	}
	public int getAppr_no() {
		return appr_no;
	}
	public void setAppr_no(int appr_no) {
		this.appr_no = appr_no;
	}
	public int getAllow_no() {
		return allow_no;
	}
	public void setAllow_no(int allow_no) {
		this.allow_no = allow_no;
	}
	public String getSal_division() {
		return sal_division;
	}
	public void setSal_division(String sal_division) {
		this.sal_division = sal_division;
	}
	
	
}
