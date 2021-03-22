package odga.bt.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import odga.bt.domain.ListResult;
import odga.bt.domain.Touritems;
import odga.bt.service.TouritemsService;
import odga.bt.vo.ListVo;

@Controller
public class ListController {
    @Resource private TouritemsService service;

    @RequestMapping("/listing")
    public ModelAndView listing(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String keyword = request.getParameter("keyword");
        String catgo = request.getParameter("catgo");
        String cpStr = request.getParameter("cp");
        String psStr = request.getParameter("ps");

        session.setAttribute("keyword", keyword);
        session.setAttribute("catgo", catgo);

        //(1) cp
        int cp = 1;
        if (cpStr == null) {
            Object cpObj = session.getAttribute("cp");
            if (cpObj != null) {
                cp = (Integer)cpObj;
            }
        } else {
            cpStr = cpStr.trim();
            cp = Integer.parseInt(cpStr);
        }
        session.setAttribute("cp", cp);

        //(2) ps
        int ps = 10;
        if (psStr == null) {
            Object psObj = session.getAttribute("ps");
            if (psObj != null) {
                ps = (Integer)psObj;
            }
        } else {
            psStr = psStr.trim();
            int psParam = Integer.parseInt(psStr);

            Object psObj = session.getAttribute("ps");
            if (psObj != null) {
                int psSession = (Integer)psObj;
                if (psSession != psParam) {
                    cp = 1;
                    session.setAttribute("cp", cp);
                }
            } else {
                if (ps != psParam) {
                    cp = 1;
                    session.setAttribute("cp", cp);
                }
            }

            ps = psParam;
        }
        session.setAttribute("ps", ps);

        //(3) ModelAndView

        ListResult listResult = null;
        ModelAndView mv = null;

        if (catgo != null && keyword != null) {
            int rangeSize = 5;
            listResult = service.getTouritemsListResult(catgo, keyword, cp, ps, rangeSize);
            mv = new ModelAndView("listing/listing", "listResult", listResult);
            if (listResult.getList().size() == 0) {
                if (cp > 1) 
                    return new ModelAndView("redirect:listing.do?cp=" + (
                        cp - 1
                    ));
                else 
                    return new ModelAndView("listing/listing", "listResult", null);
                }
            return mv;
        } else {
            int rangeSize = 5;
            listResult = service.getTouritemsListResult(cp, ps, rangeSize);
            mv = new ModelAndView("listing/listing", "listResult", listResult);
            if (listResult.getList().size() == 0) {
                if (cp > 1) 
                    return new ModelAndView("redirect:listing.do?cp=" + (
                        cp - 1
                    ));
                else 
                    return new ModelAndView("listing/listing", "listResult", null);
                }
            }
        return mv;
    }
    @RequestMapping("/listing_details")
    public ModelAndView listing_details(HttpServletRequest request) {
        String contentid = request.getParameter("contentid");

        Touritems touritems = service.selectByTitleS(contentid);
        ListResult listResult = service.getTouritemsListResult();

        ListVo vo = new ListVo();
        vo.setTouritems(touritems);
        vo.setListResult(listResult);
        ModelAndView mv = new ModelAndView("listing/listing_details", "ListVo", vo);
        return mv;
    }

}
