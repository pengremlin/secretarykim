package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import DTO.Mboard;
import service.MboardService;

@Controller
public class MboardController {

	@Autowired
	private MboardService mboardservice;

	// 글목록보기
	@RequestMapping("mboard.htm")
	public String mboards(String pg, String f, String q, Model model) throws ClassNotFoundException, SQLException {

		List<Mboard> list = mboardservice.mboard(pg, f, q);
		model.addAttribute("list", list);
		return "mboard.mboard";
	}

	// 글상세보기
	@RequestMapping("mboardDetail.htm")
	public String mboardDetail(String seq, Model model) throws ClassNotFoundException, SQLException {

		Mboard mboard = mboardservice.mboardDetail(seq);
		model.addAttribute("mboard", mboard);
		return "mboard.mboardDetail";

	}

	// 글등록 화면 처리
	@RequestMapping(value = "mboardReg.htm", method = RequestMethod.GET)
	public String mboardReg() {
		return "mboard.mboardReg";

	}

	// 글등록 처리(실제 글등록 처리)
	@RequestMapping(value = "mboardReg.htm", method = RequestMethod.POST)
	public String mboardReg(Mboard mb, HttpServletRequest request)
			throws IOException, ClassNotFoundException, SQLException {

		String url = "redirect:mboard.htm";
		try {
			url = mboardservice.mboardReg(mb, request);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return url;

	}

	// 글삭제하기
	@RequestMapping("mboardDel.htm")
	public String mboardDel(String seq) throws ClassNotFoundException, SQLException {

		String url = mboardservice.mboardDel(seq);
		return url;
	}

	// 글수정하기 (두가지 처리 : 화면(select) , 처리(update))
	// 글수정하기 (수정하기 화면 , 수정처리)
	// 주소같고 처리(GET , POST) 처리
	@RequestMapping(value = "mboardEdit.htm", method = RequestMethod.GET)
	public String mboardEdit(String seq, Model model) throws ClassNotFoundException, SQLException {

		Mboard mboard = mboardservice.mboardEdit(seq);
		model.addAttribute("mboard", mboard);
		return "mboard.mboardEdit";
	}

	// 게시판 실제 수정처리
	@RequestMapping(value = "mboardEdit.htm", method = RequestMethod.POST)
	public String mboardEdit(Mboard mb, HttpServletRequest request)
			throws ClassNotFoundException, SQLException, IOException {

		String url = mboardservice.mboardEdit(mb, request);
		return url;
	}

}
