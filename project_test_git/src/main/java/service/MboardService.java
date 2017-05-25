package service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import DAO.MboardDAO;
import DTO.Mboard;

@Service
public class MboardService {
	
	@Autowired
	private SqlSession SqlSession;
	
	public List<Mboard> mboard(String pg , String f , String q) throws ClassNotFoundException , SQLException {
		
		//게시판 기본 설정(기본값 처리)/////////////
		int page = 1;
		String field = "MBOARD_TITLE";
		String query ="%%";
		//////////////////////////////////////
		if(pg != null && pg.equals("")){
			page = Integer.parseInt(pg);
		}
		if(f != null && f.equals("")){
			field = f;
		}
		if(q != null && q.equals("")){
			query = q;
		}
	
		MboardDAO mboardDAO = SqlSession.getMapper(MboardDAO.class);
		List<Mboard> list= mboardDAO.getMboards(page, field, query);
		return list;
	}
	
	public Mboard mboardDetail(String seq) throws ClassNotFoundException, SQLException{
		 
		MboardDAO mboardDAO = SqlSession.getMapper(MboardDAO.class);
		Mboard notice = mboardDAO.getMboard(seq);
		 return notice;
	 }

	public String mboardReg(Mboard mb, HttpServletRequest request)
			   throws IOException, ClassNotFoundException, SQLException {
				 
							  
				  MboardDAO mboardDAO = SqlSession.getMapper(MboardDAO.class);
				  mboardDAO.insert(mb);

				  return "redirect:notice.htm";
			 }

	public String mboardDel(String seq) throws ClassNotFoundException,
	   SQLException {
	  
		MboardDAO noticeDao = SqlSession.getMapper(MboardDAO.class);
	  noticeDao.delete(seq);
	  
	  return "redirect:notice.htm"; 
	 }

	public Mboard mboardEdit(String seq)
			   throws ClassNotFoundException, SQLException {
		
		MboardDAO mboardDAO = SqlSession.getMapper(MboardDAO.class);
		Mboard mboard = mboardDAO.getMboard(seq);
 
		return mboard;
	}

	public String mboardEdit(Mboard mb ,HttpServletRequest request) throws ClassNotFoundException,
	   SQLException, IOException {

		 
	
	
	 //Mybatis 적Mboard
	 MboardDAO mboardDAO = SqlSession.getMapper(MboardDAO.class);
	 mboardDAO.update(mb);
	  
	  
	  return "redirect:noticeDetail.htm?seq=" + mb.getMboard_no();
  	 
	 }
	
}
