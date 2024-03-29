package com.youlove.web.community;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.youlove.common.FileNameUUId;
import com.youlove.common.Page;
import com.youlove.common.Search;
import com.youlove.service.community.CommunityService;
import com.youlove.service.domain.City;
import com.youlove.service.domain.Community;
import com.youlove.service.domain.Hashtag;
import com.youlove.service.domain.Like;
import com.youlove.service.domain.User;
import com.youlove.service.guide.GuideService;
import com.youlove.service.hashtag.HashtagService;
import com.youlove.service.like.LikeService;
import com.youlove.service.user.UserService;



@Controller
@RequestMapping("/community/*")
public class CommunityController {
	
	///Field
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	@Autowired
	@Qualifier("hashtagServiceImpl")
	private HashtagService hashtagService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	@Autowired
	@Qualifier("guideServiceImpl")
	private GuideService guideService;
	@Autowired
	@Qualifier("likeServiceImpl")
	private LikeService likeService;
	
	
	public CommunityController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	@Value("#{commonProperties['uploadPathThunbNail']}")
	String uploadPathThumbNail;
	@Value("#{commonProperties['uploadPathContent']}")
	String uploadPathContent;
	
	
	@RequestMapping(value="addCommunity",method=RequestMethod.POST)
	public ModelAndView addCommunity(@ModelAttribute("community") Community community,
									 @RequestParam(value="Thumbnail") MultipartFile file,
									 @RequestParam(value="hashtag", required=false)String hashtag,
									 @RequestParam(value="cityName", required=false)String city,
									 HttpServletRequest request,HttpSession session)throws Exception{
		System.out.println("\nCommunityController:::addCommunity() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		//ThumbNail업로드
		String safeFile ="";
		if(file.isEmpty() != true) {
			safeFile = FileNameUUId.convert(file, "ThumbNail", request);
		}else { 
			safeFile += "noThumbnail.png"; 
		}
		//회원정보
		User user = (User) session.getAttribute("user");
		//DomainCity
		City cityName = new City();
		cityName.setCityName(city);
		//게시글작성
		community.setCity(cityName);
		community.setWriter(user);
		community.setCommunityThumbnail(safeFile);
		communityService.addCommunity(community);
		//해시태그
		Hashtag hashVo = new Hashtag();
		hashVo.setHashtag(hashtag);
		hashVo.setWriter(user);
		System.out.println("communityCode" + community.getCommunityCode());
		hashVo.setCommunityCode(community.getCommunityCode());
		hashtagService.addHashtag(hashVo);
		
		modelAndView.setViewName("/community/getCommunity?communityCode="+community.getCommunityCode());
		System.out.println("\nCommunityController:::addCommunity() 끝:::");
		return modelAndView;
	} 
	
	@RequestMapping(value="getCommunity",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView getCommunity(@RequestParam(value="communityCode") int communityCode)throws Exception {
		System.out.println("\nCommunityController:::getCommunity() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/community/getCommunity.jsp");
		Map<String,Object> map = new HashMap<String, Object>(); 
		
		//커뮤니티
		Community community = communityService.getCommunity(communityCode);
		//유저정보
		//map.put("userCode", community.getWriter().getUserCode());
		//User user = userService.getUser(map); 
		//community.setWriter(user);
		//DomainCity
		//City cityName = new City();
		//cityName.setCityName(city);
		//community.setCity(cityName);
		//해쉬태그
		Hashtag hashVO = new Hashtag();
		hashVO.setCommunityCode(communityCode);
		hashVO.setPartyCode(0);
		hashVO.setRole(true);
		map = hashtagService.getHashtag(hashVO);
		modelAndView.addObject("hashtag", map.get("hashtag"));
		//댓글
		modelAndView.addObject("boardCode",community.getCommunityBoard());
		modelAndView.addObject("detailCode",communityCode);
		//게시글 좋아요 개수
		int likeCount = likeService.countLike(new Like(Integer.parseInt(community.getCommunityBoard()),communityCode));
		modelAndView.addObject("likeCountBoard",likeCount);
		//관련글
		map = communityService.getCommunityRelated(community.getCommunityBoard(), community.getCity());
		modelAndView.addObject("related", map.get("related"));//관련글
		System.out.println("\nCommunityController:::getCommunity() 끝:::");
		modelAndView.addObject("community", community);
		
		return modelAndView;
	}

	@RequestMapping(value="getCommunityList")
	public ModelAndView getCommunityList(@ModelAttribute("Search") Search search,
										 @RequestParam(value="communityBoard",required=false, defaultValue = "0")int communityBoard,
										 HttpSession session)throws Exception {
		System.out.println("\nCommunityController:::getCommunityList() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		Map<String,Object> map = new HashMap<String, Object>();
		modelAndView.setViewName("/community/getCommunityList.jsp");
		if(search.getCurrentPage() == 0){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		//공개범위
		//User user = (User) session.getAttribute("user");
		//if(user == null) {
		//	map.put("openRange", 1);
		//}
		
		map.put("communityBoard", communityBoard);
		map.put("search", search);
		map = communityService.getCommunityList(map);
			
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		modelAndView.addObject("resultPage",resultPage);
		modelAndView.addObject("bestlist", map.get("bestlist"));
		modelAndView.addObject("list", map.get("list"));
		
		System.out.println("\nCommunityController:::getCommunityList() 끝:::");
		return modelAndView;
	}
	@RequestMapping(value="updateCommunityView",method=RequestMethod.GET)
	public ModelAndView updateCommunityView(@RequestParam("communityCode")int communityCode)throws Exception{
		System.out.println("\nCommunityController:::updateCommunityView() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		Map<String,Object> map = new HashMap<String, Object>(); 
		modelAndView.setViewName("/community/updateCommunity.jsp");
		//게시물 정보
		Community community = communityService.getCommunity(communityCode);
		//해시태그
		Hashtag hashVO = new Hashtag();
		hashVO.setCommunityCode(communityCode);
		hashVO.setPartyCode(0);
		hashVO.setRole(true);
		map = hashtagService.getHashtag(hashVO);
		modelAndView.addObject("hashtag", map.get("hashtag"));
		modelAndView.addObject("community", community);
		System.out.println("\nCommunityController:::updateCommunityView() 끝:::");
		return modelAndView;
	}
	
	@RequestMapping(value="updateCommunity",method=RequestMethod.POST)
	public ModelAndView updateCommunity(@ModelAttribute("community") Community community,
										@RequestParam(value="Thumbnail") MultipartFile file,
										@RequestParam(value="cityName", required=false)String city,
			 							@RequestParam(value="hashtag" , required=false)String hashtag,HttpServletRequest request)throws Exception {
		System.out.println("\nCommunityController:::updateCommunity() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		//ThumbNail업로드
		String safeFile ="";
		if(!file.isEmpty()) {
			safeFile = FileNameUUId.convert(file, "ThumbNail", request);
		}else {
			safeFile += "noThumbnail.png"; 
		}
		community.setCommunityThumbnail(safeFile);
		//해시태그
		Hashtag hashVo = new Hashtag();
		hashVo.setHashtag(hashtag);
		hashVo.setCommunityCode(community.getCommunityCode());
		hashVo.setRole(true);
		hashtagService.updateHashtag(hashVo);
		//DomainCity
		City cityName = new City();
		cityName.setCityName(city);
		community.setCity(cityName);
		
		
		communityService.updateCommunity(community);
		modelAndView.setViewName("/community/getCommunity?communityCode="+community.getCommunityCode());
		System.out.println("\nCommunityController:::updateCommunity() 끝:::");
		return modelAndView;
	}
	
	@RequestMapping(value="deleteCommunity", method=RequestMethod.GET)
	public ModelAndView daleteCommunity(@RequestParam(value="communityCode")int communityCode)throws Exception{
		System.out.println("\nCommunityController:::daleteCommunity() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/community/getCommunityList?communityBoard=0");
		Community community = communityService.getCommunity(communityCode);
		Hashtag hashtag = community.getCommunityHashtagCode();
		communityService.deleteCommunity(communityCode);
//		nullpointException
		//hashtagService.deleteHashtag(hashtag.getHashtagCode());
		System.out.println("\nCommunityController:::daleteCommunity() 끝:::");
		return modelAndView;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="fileUpload",method=RequestMethod.POST)
	public void fileUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload)throws Exception{
		System.out.println("\nCommunityController:::fileUpload() 시작:::");
		UUID uid = UUID.randomUUID();
		JSONObject json = new JSONObject();
		OutputStream out = null;
		PrintWriter printWriter = null;
		String Path = request.getSession().getServletContext().getRealPath("/resources/images/Content");
		System.out.println(Path);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try{
			String originFileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			String uploadPath = Path+"/"+uid+"_"+originFileName;
			//폴더 없으면 만들어줌 *
//			if(!destD.exists()) { *
//        		destD.mkdirs(); *
//        	} *
			out = new FileOutputStream(new File(uploadPath));
            out.write(bytes);
            out.flush();//out에 저장된 데이터 전송하고 초기화

            printWriter = response.getWriter();
            response.setContentType("text/html");
            String fileUrl = "/resources/images/Content/"+uid+"_"+originFileName;
            System.out.println("fileUrl = "+fileUrl);
            System.out.println(request.getContextPath());
            
            json.put("uploaded", 1);
            json.put("fileName", originFileName);
            json.put("url", fileUrl);
            printWriter.println(json);
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            if(out != null){out.close();}
            if(printWriter != null){printWriter.close();}		
		}
		System.out.println("\nCommunityController:::fileUpload() 끝:::");
	}//end of fileUpload
	
}//end of class













