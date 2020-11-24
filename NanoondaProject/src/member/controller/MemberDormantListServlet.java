package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberDormantListServlet
 */
@WebServlet("/mdorlist")
public class MemberDormantListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDormantListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 한 페이지 당 10개 씩  출력되는  전체 회원 조회 

		// 페이지 기본 값 지정
		int currentPage = 1;
		// 전송 온 페이지값 추출
		if (request.getParameter("page") != null) {
				currentPage = Integer.parseInt(request.getParameter("page"));
		}

		// 한 페이지당 출력할 목록 갯수 지정
		int limit = 10;

		MemberService mservice = new MemberService();

		// 휴면회원 전체 목록 갯수 조회
		int listCount = mservice.memberDorGetListCount();

		// 밑에 나올 페이지 숫자를 계산해야 함
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 그룹의 시작 페이지 수 지정
		int startPage = ((int) ((double) currentPage / limit + 0.9) - 1) * limit + 1;
		int endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		
		// 현재 페이지에 출력할 게시글 목록 조회
	      
		ArrayList<Member> list = new MemberService().selectDorList();

	      RequestDispatcher view = null;
	      if (list.size() > 0) {
	         view = request.getRequestDispatcher("views/member/memberDormantListView.jsp");
	         request.setAttribute("list", list);
	         request.setAttribute("currentPage", currentPage);
			 request.setAttribute("maxPage", maxPage);
			 request.setAttribute("startPage", startPage);
			 request.setAttribute("endPage", endPage);
			 request.setAttribute("listCount", listCount);
	         
	         view.forward(request, response);
	      } else {
	    	  response.setContentType("text/html; charset=UTF-8");
		        PrintWriter out = response.getWriter();
		        out.println("<script>alert('휴면회원이 없습니다'); location.href='/nnd/mlist?page=1' </script>");
		        out.flush();
		        out.close();
	      }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}