package DAO;

import java.sql.SQLException;
import java.util.List;

import DTO.Mboard;

//CRUD
public interface MboardDAO {
	//게시물 개수
	public int getCount(String field, String query) throws ClassNotFoundException, SQLException;
	//전체 게시물
	public List<Mboard> getMboards(int page, String field, String query) throws ClassNotFoundException, SQLException;
	//게시물 삭제
	public int delete(String seq) throws ClassNotFoundException, SQLException;
	//게시물 수정
	public int update(Mboard mboard) throws ClassNotFoundException, SQLException;
	//게시물 상세
	public Mboard getMboard(String seq) throws ClassNotFoundException, SQLException;
	//게시물 입력
	public int insert(Mboard mb) throws ClassNotFoundException, SQLException;
}	