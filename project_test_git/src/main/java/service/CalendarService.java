package service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import DAO.CalendarDAO;
import Project.DTO.CalendarDTO;
import Project.DTO.Project;

@Component
@Service
public class CalendarService {

	@Autowired
	private SqlSession sqlsession;

	int result = 0;

	// 내용추가
	public int insertCal(CalendarDTO calendarDTO) {


		
		CalendarDAO calendarDAO = sqlsession.getMapper(CalendarDAO.class);	
		try {
			
			result = calendarDAO.insertCal(calendarDTO);

		} catch (Exception e) {

			e.printStackTrace();
		}
		return result;
	}

	// 내용 리스트
	public List<CalendarDTO> selectCal(CalendarDTO  calendarDTO) {

		List<CalendarDTO> list = new ArrayList<CalendarDTO>();

		CalendarDAO calendarDAO = sqlsession.getMapper(CalendarDAO.class);

		try {
			list = calendarDAO.selectCal(calendarDTO);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return list;
	}

	public int dropUpdateCal(CalendarDTO calendarDTO) {
		
		CalendarDAO calendarDAO = sqlsession.getMapper(CalendarDAO.class);
	
		/*
		 * calendarDTO.setCalendar_start(modifyDate(calendarDTO.
		 * getCalendar_start()));
		 */

		try {
			result = calendarDAO.dropUpdateCal(calendarDTO);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}

	public List<CalendarDTO> ajaxCalendar(int project_no) {

		List<CalendarDTO> list = new ArrayList<CalendarDTO>();
		CalendarDAO calendarDAO = sqlsession.getMapper(CalendarDAO.class);
		try {
			list = calendarDAO.ajaxCalendar(project_no);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return list;

	}

	public int resiseCal(CalendarDTO calendarDTO) {

		CalendarDAO calendarDAO = sqlsession.getMapper(CalendarDAO.class);


		try {
			result = calendarDAO.resiseCal(calendarDTO);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}
	
	
	public int dropUpdateCal2(CalendarDTO calendarDTO) {

		CalendarDAO calendarDAO = sqlsession.getMapper(CalendarDAO.class);

		try {
			result = calendarDAO.dropUpdateCal2(calendarDTO);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}
	
	
	public String parse(String input , int overDay){

		int resultY = Integer.parseInt(input.substring(11,15));
		String m = input.substring(4,7);
		if(m.equals("Jan")){m="0";
		}else if(m.equals("Feb")){m="1";
		}else if(m.equals("Mar")){m="2";
		}else if(m.equals("Apr")){m="3";
		}else if(m.equals("May")){m="4";
		}else if(m.equals("Jun")){m="5";
		}else if(m.equals("Jul")){m="6";
		}else if(m.equals("Aug")){m="7";
		}else if(m.equals("Sep")){m="8";
		}else if(m.equals("Oct")){m="9";
		}else if(m.equals("Nov")){m="10";
		}else if(m.equals("Dec")){m="11";
		}		
		int resultM = Integer.parseInt(m);
		
		int resultD = Integer.parseInt(input.substring(8,10))-overDay ;


	     Calendar date1 = Calendar.getInstance();
	     Calendar date2 = Calendar.getInstance();
	    
	     date2.set(resultY, resultM, resultD);
	     long difference = (date2.getTimeInMillis() - date1.getTimeInMillis())/1000;	    
	     String dday = String.valueOf((difference/(24*60*60)));

		return dday;
	}
	
	
	
	
	


	public int deleteCal (int version_no) {

		CalendarDAO calendarDAO = sqlsession.getMapper(CalendarDAO.class);
		try {
			result = calendarDAO.deleteCal(version_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return result;
	}
	
public List<Project> project_completion(List<Project> list) throws Exception{
		
		for(int i=0 ; i<list.size() ; i++){
			
			//String start =String.valueOf(list.get(i).getProject_start());
			
			//String end = String.valueOf(list.get(i).getProject_end());	
			String start = new java.text.SimpleDateFormat ("yyyyMMdd").format(list.get(i).getProject_start());
			String end = new java.text.SimpleDateFormat ("yyyyMMdd").format(list.get(i).getProject_end());
			String thisDay = new java.text.SimpleDateFormat ("yyyyMMdd").format(new java.util.Date());
	
			
			
			DateFormat formatter  = new SimpleDateFormat("yyyyMMdd");
			java.util.Date startday = formatter .parse(start);
			java.util.Date endday = formatter .parse(end);
			java.util.Date today = formatter .parse(thisDay);
		
		  long total = endday.getTime() - startday.getTime();
		  long now = today.getTime() - startday.getTime();
	  
		  long child = now  / (24 * 60 * 60 * 1000);
		  long parent = total / (24 * 60 * 60 * 1000);
	  
		  if(child <=0){
			  child = 1;
		  }

		  int result = (int) ((child * 100) / parent) ;
		  
		  list.get(i).setCompletion(result);
		  
		  
			
		}
	
		return list;
	}
	
	
	
	

}
