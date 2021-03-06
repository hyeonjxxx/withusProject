package com.kh.withus.funding.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.withus.category.model.vo.Category;
import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.pagination;
import com.kh.withus.funding.model.dto.FundingDetail;
import com.kh.withus.funding.model.service.FundingService;
import com.kh.withus.funding.model.vo.Project;
import com.kh.withus.funding.model.vo.ProjectReply;
import com.kh.withus.funding.model.vo.Reward;
import com.kh.withus.funding.model.vo.Search;
import com.kh.withus.member.model.vo.Member;
import com.kh.withus.myPage.model.service.MyPageService;
import com.kh.withus.myPage.model.vo.MyPage;
import com.kh.withus.order.model.vo.Order;

@Controller
public class FundingController {
	
	@Autowired
	private FundingService funService;
	@Autowired
	private MyPageService mpService;
	
	@ResponseBody
	@RequestMapping(value="menuList3.main", produces="application/json; charset=utf-8")
	public String ajaxSelectMenuList3() {
		
		HashMap<String, Object> map = funService.ajaxSelectMenuList3();
		
		return new Gson().toJson(map);
		
	}
	
	@RequestMapping("menuList.fun")
    public ModelAndView selectMenuList(String menu, ModelAndView mv) {
		
		ArrayList<Project> pList = null;
		
		switch(menu){
		
			case "famous":
				pList = funService.selectFamousList();
				break;
				
			case "eve":
				pList = funService.selectEveList();
				break;
				
			case "new": 
				pList = funService.selectNewList();
				break;
				
			case "ready":
				pList = funService.selectReadyList();
				break;
			
		}
		
		mv.addObject("menu", menu)
		.addObject("pList", pList) 
		.setViewName("funding/menuListView");
		
		return mv;
	}
	
	@RequestMapping("search.fun")
    public ModelAndView selectSearchList(Search s, ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", s.getCondition());
		map.put("keyword", s.getKeyword());
		
		ArrayList<Project> list = funService.selectSearchList(map);
		
		mv.addObject("list", list)
		.setViewName("funding/fundingListView");
		
		return mv;
	}
	
	@RequestMapping("list.fun")
    public ModelAndView selectFundingList(int catNo, String menu, ModelAndView mv) {
		
		// ?????? ???????????? ??????, ??? ??????
		ArrayList<Category> cList = funService.selectCate();
		ArrayList<Project> list = null;
		
		// ?????? ?????? ??????
		if(catNo == 1) {
			list = funService.selectAllList();
		} else {
			list = funService.selectList(catNo);
		}
		
		mv.addObject("list", list)
		.addObject("cList", cList)
		.addObject("catNo", catNo)
		.setViewName("funding/fundingListView");
		
		return mv;
	}
		      
	
	@RequestMapping("list.rew")
	public String selectRewardList(int pno, @RequestParam(value="rno", defaultValue="0") int rno, Model model) {
		
		model.addAttribute("pno", pno);
		ArrayList<FundingDetail> drList = funService.selectDetailReward(pno);
		model.addAttribute("drList", drList);
		
		if(rno != 0) { // ????????? ?????????
			model.addAttribute("rno", rno);
		}
		
		return "funding/rewardListView";
		
	}

	@RequestMapping("detail.fd")
	public String selectFunding(int pno, Model model) {
		int result= funService.increaseCount(pno);
		
		if(result>0) {
			FundingDetail p = funService.selectFunding(pno);
			model.addAttribute("p", p);
			ArrayList<FundingDetail> rList = funService.selectReward(pno);
			model.addAttribute("rList", rList);
			return "funding/fundingDetails";
		}else {
			model.addAttribute("errorMsg", "??????????????? ?????? ??????");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("check.fun")
	public String insertOrder(Order o, int rewardNo, Model model) {
		
		FundingDetail fd = funService.selectOneReward(rewardNo);
		
		model.addAttribute("fd", fd);
		model.addAttribute("o", o);
		return "funding/payCheckForm";
	}
	
	@RequestMapping("register.fd")
	public String FundingRegistration(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			session.setAttribute("alertMsg", "?????????????????????.");
			return "redirect:loginForm.me";
		}else {
			return "funding/fundingRegistration";
			
		}
	}

	   
	@RequestMapping("success.fd")
	public String fundingSuccess(Project p, MultipartFile upfile, HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");

		p.setMemberNo(loginUser.getMemberNo());
		
		/*
		 * ?????? ?????? ???????????? ????????? ????????? ???????
		 * <input type="file"> ????????? ??? ????????? ???????????? ??????
		 * Controller????????? ??????????????? MultipartFile[] ?????? ?????? ???????????????
		*/		 
		
		// ????????? ??????????????? ?????? => ??????????????? ?????? ??????????????? ?????? + ??????????????? ?????? ????????? ?????????
		
		// ????????? ????????? ?????? ?????? => ????????? ?????? ?????? ??? ????????? ????????? => ???????????????,???????????????????????????????????? b ????????? ??????
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(session, upfile);
			
			//p.setProjectThum(upfile.getOriginalFilename());
			//String originName = upfile.getOriginalFilename();
			p.setProjectThum("resources/project_thumbnail/" + changeName); // ?????????????????????+?????????
			
		}

		// servieImpl, dao, sql ??????
		int result = funService.insertProject(p);

		if(result>0) {
			session.setAttribute("alertMsg", "??????????????? ???????????? ?????? ?????? ????????? ???????????????.");
			return "redirect:/";
			
		}else {
			// ???????????? ?????? ???????????? ?????? 
			model.addAttribute("errorMsg", "???????????? ?????? ??????");
			return "common/errorPage";
		}
	}

	   // ????????????(???)
	   @RequestMapping("preview.fd")
	   public String fundingPreview(Project p, FundingDetail fd, ArrayList<FundingDetail> rList, HttpSession session, Model model) {
	      
	      Member loginUser = (Member)session.getAttribute("loginUser");
	      p.setMemberNo(loginUser.getMemberNo());
	      
	      // ?????????????????? ???????????? Project??? ??????, 
	      // ?????? ?????? ????????? jsp??? ???????????????.
	      model.addAttribute("p", p);
	      model.addAttribute("fd",fd);
	      model.addAttribute("rList", rList);
	      model.addAttribute("loginUser", loginUser);
	      
	      return "funding/fundingPreview";

	   }
	
	@RequestMapping("pay.fun")
	public String payForm(Order o, Model model) {
		
		FundingDetail fd = funService.selectOneReward(o.getRewardNo());
		
		model.addAttribute("fd", fd);
		model.addAttribute("o", o);
		
		int result = funService.insertOrderTable(o);
		
		if(result>0) {
			funService.minusStock(o);
			return "funding/payComplete";
		}else {
			model.addAttribute("errorMsg", "????????? ?????? ??????");
			return "common/errorPage";
		}
		
	}

	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		String savePath = session.getServletContext().getRealPath("/resources/project_thumbnail/");
		
		String originName = upfile.getOriginalFilename();  // ????????? ("aaa.jpg")
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 900000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	
	// ???????????? ????????????
	@ResponseBody
	@RequestMapping("rinsert.fd")
	public String ajaxInsertReply(ProjectReply r, int memberNo) {
		 
		 r.setMemberNo(memberNo);
		
		 int result = funService.insertReply(r);
		 if(result>0) {
			 return "success";
		 }else {
			 return "fail";
		 }	
		 
		
	}
	
	
	// ???????????? ????????????
	@ResponseBody
	@RequestMapping(value="proReply.fd", produces="application/json; charset=utf-8")
	public String ajaxSelectReplyList(int pno) {
		
		return new Gson().toJson(funService.selectReplyList(pno));
		
	}
	
	// ???????????? ?????? ??????(?????????)
	@ResponseBody
	@RequestMapping("deleteReply.fd")
	public String deleteReply(int replyNo) {
		 
		 int result = funService.deleteReply(replyNo);
		 
		 if(result>0) {
			 return "success";
		 }else {
			 return "fail";
		 }	
		 
		
		
	}
	
	// ???????????? ???????????????
	@ResponseBody
	@RequestMapping(value="proReReply.fd", produces="application/json; charset=utf-8")
	public String ajaxSelectReReplyList(String replyNo) {

		return null;
		
		//return new Gson().toJson(funService.selectReplyList(pno));
		
	}
	
	// ????????? ?????? ??????
	@ResponseBody
	@RequestMapping("followCheck.fd")
	public String followCheck(String memberNo, String followMemberNo, HttpSession session) {
		
		
		MyPage m = new MyPage();
		m.setMemberNo(Integer.parseInt(followMemberNo));
		m.setFollowMemberNo(Integer.parseInt(memberNo));
		
		int result = mpService.followCheck(m);
				
		if(result>0) { // ????????????
			return "Y";
					
		}else { // ?????????
			return "N";
		}
					
			
	}
	
	// ????????? ?????? ??????
	@ResponseBody
	@RequestMapping("likeyCheck.fd")
	public String likeyCheck(String memberNo, String projectNo, HttpSession session) {
		
		
		MyPage m = new MyPage();
		m.setMemberNo(Integer.parseInt(memberNo));
		m.setProjectNo(Integer.parseInt(projectNo));
		
		
		int result = funService.likeyCheck(m);
				
		if(result>0) { // ????????????
			return "liked";
					
		}else { // ???????????????
			return "dislike";
		}
			
	}
	
	// ????????? ??????
	@ResponseBody
	@RequestMapping("dislike.fd")
	public String dislike(String memberNo, String projectNo, HttpSession session) {
		
		MyPage m = new MyPage();
		m.setMemberNo(Integer.parseInt(memberNo));
		m.setProjectNo(Integer.parseInt(projectNo));
		
		int result = funService.dislike(m);
				
		if(result>0) { // ????????????
			return "Y";
					
		}else { // ???????????????
			return "N";
		}
			
	}
	
	// ?????????
	@ResponseBody
	@RequestMapping("like.fd")
	public String like(String memberNo, String projectNo, HttpSession session) {
		
		MyPage m = new MyPage();
		m.setMemberNo(Integer.parseInt(memberNo));
		m.setProjectNo(Integer.parseInt(projectNo));
		
		int result = funService.like(m);
				
		if(result>0) { // ????????????
			return "Y";
					
		}else { // ???????????????
			return "N";
		}
			
	}	
	
	// +?????? : ?????????
	// ?????? ????????? ??????
	@RequestMapping("fundingListView.mana")
	public ModelAndView selectFundingList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			 ModelAndView mv) {
		
		int listCount = funService.selectFListCount();
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Project> fdList = funService.selectFundingList(pi);
		
		mv.addObject("fdList",fdList)
		.addObject("pi", pi)
		.setViewName("admin/fundingManaListView");
		return mv;
		
	}

	// ?????? ???????????? , ??????????????? ????????????
	   @RequestMapping("fundingConsiderPre.mana")
	   public String fundingConsiderPre(int pno, Model model) {
	
		   //Project p = funService.selectFundingConsider(pno);
		   FundingDetail p = funService.fundingConsiderPre(pno);
		   Member m = funService.selectPartnerInfo(pno);
		   ArrayList<FundingDetail> r = funService.selectFundingReward(pno);
		   
		   model.addAttribute("p", p); 
		   model.addAttribute("m", m); 
		   model.addAttribute("r", r); 
		   
	      return "admin/fundingManaConsider";

	   }
	
	   // ??????/??????
	   @RequestMapping("fundingConsider.mana")
		public String updateProjectStatus(@RequestParam(defaultValue="") int pno,
											@RequestParam(defaultValue="") String considerBtn,
											HttpSession session, HttpServletRequest request) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pno", pno);
			map.put("considerBtn", considerBtn);
			
			int result = funService.updateProjectStatus(map);
			
			// ?????? url ????????????
			String referer = (String)request.getHeader("REFERER");
			//System.out.println(referer);
			
			if(result > 0 ) {
				session.setAttribute("alertMsg", "???????????? ?????? ?????? ??????");
				return "redirect:fundingListView.mana";
			}else {
				session.setAttribute("alertMsg", "????????????");
				return "redirect:fundingConsiderPre.mana?pno=" + pno;
			}
			 
		}
	   
	   // ?????? ??????????????
	   @RequestMapping("searchFunding.mana")
		public ModelAndView searchM(@RequestParam(defaultValue="") String condition,
										 @RequestParam(defaultValue="") String sort,
										 @RequestParam(defaultValue="") String keyword,
										 @RequestParam(value="currentPage", defaultValue="1") int currentPage,
										 ModelAndView mv) {
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("condition", condition);
			map.put("sort", sort);
			map.put("keyword", keyword);
			
			// ???????????? ????????? ??? ??????
			int count = funService.countSearchFdMana(map);
			
			// ????????? ??????
			PageInfo pi = pagination.getPageInfo(count, currentPage, 10, 10);
			
			// ???????????? ????????????
			ArrayList<Project> fdList = funService.searchFundingMana(map, pi);
			
			mv.addObject("pi", pi)
			  .addObject("fdList",fdList)
			  .addObject("condition", condition)
			  .addObject("sort", sort)
			  .addObject("keyword", keyword)
			  .setViewName("admin/fundingManaListView");
			
			return mv;
			
		}
	   
}
