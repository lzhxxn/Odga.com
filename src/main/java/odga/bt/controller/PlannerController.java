package odga.bt.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import lombok.AllArgsConstructor;
import odga.bt.domain.Planner;
import odga.bt.domain.S_Planner;
import odga.bt.domain.Touritems;
import odga.bt.service.PlannerService;
import odga.bt.vo.SearchResult;
import odga.bt.vo.Searchcode;
import odga.bt.vo.TotalList;

@RequestMapping("/")
@Controller
@AllArgsConstructor
public class PlannerController {
	private PlannerService service;
		
	//나의여행만들기
	@GetMapping("planner")
	public ModelAndView planner(@RequestParam long m_id) {
		TotalList lists = service.listS(m_id);
		System.out.println(lists.getThisP_id());
		ModelAndView mv = new ModelAndView("plan/planner", "list", lists);
		return mv;
	}
	//세부플랜 리스트
	@GetMapping("dayselect")
	public @ResponseBody List<Touritems> day(@RequestParam long p_id, @RequestParam long sp_day) {
		List<Touritems> list = service.selectDayById(p_id, sp_day);
		return list;
	}
	//세부플랜 전체 삭제
	@GetMapping("dayDeleteAll")
	public @ResponseBody List<Touritems> dayDedlAll(@RequestParam long p_id, @RequestParam long sp_day) {		
		service.dayDelAll(p_id,sp_day);
		System.out.println("# "+p_id+"번 플래너의 DAY "+sp_day+" 세부 플랜 전체 삭제 완료");
		List<Touritems> list = service.selectDayById(p_id, sp_day);
		return list;
	}
	//관광지 검색
	@GetMapping("search")
	public @ResponseBody SearchResult search(@RequestParam String searchOption, @RequestParam String keyword, @RequestParam String areacode, @RequestParam String sigungucode,
		HttpServletResponse response, HttpSession session) {
		Searchcode sc = new Searchcode(searchOption, keyword, areacode, sigungucode);
		SearchResult result = service.searchedList(sc); 
		return result;
	}
	//세부 플랜 추가
	@GetMapping("insert_sp")
	public @ResponseBody List<Touritems> insert_sp(Touritems touritems,long p_id, HttpServletRequest request) {
		String sp_dayStr = request.getParameter("sp_day");
		String sp_sday = request.getParameter("sp_sday");
		String sp_eday = request.getParameter("sp_eday");		
		String contentid = request.getParameter("contentid");
		System.out.println("sp_day "+sp_dayStr);
		long sp_day = -1;
		if(sp_dayStr != null) {
			sp_dayStr = sp_dayStr.trim();
			try {
				sp_day = Long.parseLong(sp_dayStr);
			}catch(NumberFormatException ne) {
				ne.printStackTrace();
				return null;
			}
		}		
		S_Planner s_planner  = new S_Planner();
		s_planner.setSp_day(sp_day);
		s_planner.setContentid(contentid);
		s_planner.setSp_sday(sp_sday);
		s_planner.setSp_eday(sp_eday);
		s_planner.setP_id(p_id);
		service.insert_sp(s_planner);
		System.out.println("# "+p_id+"번 플래너의 DAY "+sp_day+" 세부 플랜에 "+contentid+" 추가");
		long thisP_id = p_id; 
		List<Touritems> list = service.selectDayById(thisP_id, sp_day);
		return list;
	}
	//세부 플랜 삭제
	@GetMapping("delete_sp")
	public @ResponseBody List<Touritems> delete_sp(Touritems touritems, HttpServletRequest request,long p_id) {
		String sp_idStr = request.getParameter("sp_id");
		String sp_dayStr = request.getParameter("sp_day");
		System.out.println("sp_id: "+sp_idStr);
		System.out.println("sp_day: "+sp_dayStr);
		long sp_id = -1;
		long sp_day = -1;
		if((sp_idStr != null) && (sp_dayStr != null)) {
			sp_idStr = sp_idStr.trim();
			sp_dayStr = sp_dayStr.trim();
			try {
				sp_id = Long.parseLong(sp_idStr);
				sp_day = Long.parseLong(sp_dayStr);
			}catch(NumberFormatException ne) {
				ne.printStackTrace();
				return null;
			}
		}		
		service.delete_sp(sp_id);
		System.out.println("# "+p_id+"번 플래너의  "+sp_id+"번 세부 플랜 삭제");
		List<Touritems> list = service.selectDayById(p_id, sp_day);
		return list;
	}
	//지역 셀렉트
	@PostMapping("select")
	public @ResponseBody List<Touritems> select(String name, String areacode, String sigungucode, String contenttypeid, HttpServletResponse response) {
		Searchcode sc = new Searchcode(name, areacode, sigungucode, contenttypeid);
		List<Touritems> list = service.selectResultS(sc); 
		return list;
	}
	//플래너 저장
	@PostMapping("save.do")
	public String save(long p_id, String title, String hSize, String concept,String goPage,long m_id) {
	  Planner planner = new Planner(); 
	  planner.setP_title(title);
	  planner.setP_msize(hSize); 
	  planner.setP_concept(concept);
	  planner.setP_id(p_id);
	  service.save(planner);
	  System.out.println("# "+p_id+"번 플래너 저장 완료");
	  if(goPage.equalsIgnoreCase("index")) {
		  System.out.println("index");
		  return "redirect:index.do";
	  }else {
		  System.out.println("mypage");
		  return "redirect:member_plan.do?m_id="+m_id;
	  }	   
	}
	//플래너 작성 취소
	@GetMapping("leave")
	public String leave(long p_id) {
		service.delPlan(p_id);
		System.out.println("# "+p_id+"번 플래너 작성 취소");
		return "redirect:index.do";
	}
	//관광지 아이템
	@GetMapping("getItem")
	   public @ResponseBody Touritems getItem(String contentid) {
	      Touritems item = service.getItemS(contentid);
	      return item;
	   }
}
