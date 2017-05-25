package DAO;

import java.sql.SQLException;
import java.util.List;

import Project.DTO.CalendarDTO;

public interface CalendarDAO {

	List<CalendarDTO> selectCal(CalendarDTO calendarDTO)throws ClassNotFoundException,SQLException;
	int dropUpdateCal(CalendarDTO calendarDTO)throws ClassNotFoundException,SQLException;
	int dropUpdateCal2(CalendarDTO calendarDTO)throws ClassNotFoundException,SQLException;
	int insertCal(CalendarDTO calendarDTO)throws ClassNotFoundException,SQLException;
	List<CalendarDTO> ajaxCalendar (int project_no) throws ClassNotFoundException,SQLException;
	int resiseCal (CalendarDTO calendarDTO) throws ClassNotFoundException,SQLException;
	int deleteCal (int version_no)throws ClassNotFoundException,SQLException;
	
}
