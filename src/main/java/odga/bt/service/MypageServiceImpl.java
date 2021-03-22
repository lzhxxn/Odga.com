package odga.bt.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import odga.bt.domain.Area_T;
import odga.bt.domain.Member;
import odga.bt.domain.Planner;
import odga.bt.domain.Review;
import odga.bt.domain.S_Planner;
import odga.bt.domain.Sigungu_T;
import odga.bt.domain.Support;
import odga.bt.domain.Touritems;
import odga.bt.mapper.MemberMapper;
import odga.bt.mapper.MypageMapper;
import odga.bt.mapper.PlannerMapper;
import odga.bt.vo.DetailVo;
import odga.bt.vo.TotalList;

@Service
@AllArgsConstructor
public class MypageServiceImpl implements MypageService {
	private MypageMapper mypageMapper;
	private MemberMapper memberMapper;
	private PlannerMapper plannerMapper;
	@Override
	public List<Review> listMyLike(long m_id) {
		return mypageMapper.listMyLike(m_id);
	}
	@Override
	public Member updateS(Member member) throws Exception {
		if(member.getM_fname() !=null) {
			System.out.println("1");
			System.out.println("#>member:" + member);
			
			mypageMapper.updateS(member);
			return memberMapper.loginS(member.getM_email());
		}else {
			System.out.println("2");
			System.out.println("#>member:" + member);
			mypageMapper.updateNofile(member);
			return memberMapper.loginS(member.getM_email());
		}	
	}
	@Override
	public boolean leaveS(Member member, HttpSession session, HttpServletResponse response) {
		Member m1 = memberMapper.loginS(member.getM_email());
		System.out.println("#>member비밀번호(1) : "+m1.getM_pwd());
		response.setContentType("text/html;charset=utf-8");

		System.out.println("#>member비밀번호(2) : "+member.getM_pwd());
		String pwd1 = m1.getM_pwd();
		String pwd2 = member.getM_pwd();
		if(pwd1.equals(pwd2)) { //
			System.out.println(1);
			mypageMapper.leaveS(member);
			System.out.println(2);
			return true;
		}else {
			
			return false;
		}
	}
	//나의 플래너 일정
    @Override
    public List<Planner> myPlanS(long m_id){
    	List<Planner> myPlan = mypageMapper.myPlanner(m_id);
    	if(myPlan!=null) return myPlan;
    	else {
    		System.out.println("등록된 나의 플랜이 없습니다.");
    		return null;
    	} 		
    }
    @Override
    public DetailVo planDetails(long m_id, long p_id){
    	Planner plan = mypageMapper.thisplanner(p_id);
    	List<S_Planner> PlanD = mypageMapper.planDetail(p_id);
    	List<Touritems> tourI = new ArrayList<Touritems>();
    	if(PlanD!=null) {
	    	for(S_Planner tour: PlanD) {
	    		tourI.add(mypageMapper.detailItem(tour.getContentid()));
	    	}
	    	return new DetailVo(plan, PlanD, tourI);    		
    	}else{
    		System.out.println("등록된 나의 세부 플랜이 없습니다.");
    		return null;
    	} 
    		
    }
    @Override
	public List<Review> selectByReviewS(long m_id) {
		return mypageMapper.selectByReview(m_id);
	}
    @Override
	public void deleteByB_idS(long b_id) {
		mypageMapper.deleteByB_id(b_id);
	}
	
	@Override
	public void updateByB_idS(Review review) {
		mypageMapper.updateByB_id(review);
	}
	
	@Override
	public void updateWithoutImgS(Review review) {
		mypageMapper.updateWithoutImg(review);
	}
	@Override
	   public TotalList listS(long m_id, long p_id) {
	      //newPlanerS(m_id); //신규 플래너 id 생성
	      ArrayList<Area_T> list = plannerMapper.list();
	      //for(Area_T li:list) System.out.println(li.getArea());
	      ArrayList<Sigungu_T> list_s = plannerMapper.list_s();
	      Planner planer = mypageMapper.thisplanner(p_id);
	      TotalList totalList = new TotalList(list, list_s, p_id, planer);
	      if(list.size()==0) {
	         return null;
	      }else {
	         return totalList;
	      }
	   }
	@Override
	public List<Support> m_notificationsS(long m_id) {
		return mypageMapper.m_notifications(m_id);
	}
}
