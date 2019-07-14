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

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.youlove.common.Page;
import com.youlove.common.Search;
import com.youlove.service.community.CommunityService;
import com.youlove.service.domain.Community;
import com.youlove.service.domain.Hashtag;
import com.youlove.service.hashtag.HashtagService;
import com.youlove.web.hashtag.HashtagController;



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
	
	
	public CommunityController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	@Value("#{commonProperties['uploadPathThunbNail']}")
	String uploadPathThunbNail;
	@Value("#{commonProperties['uploadPathContent']}")
	String uploadPathContent;
	
	
	@RequestMapping(value="addCommunity",method=RequestMethod.POST)
	public ModelAndView addCommunity(@ModelAttribute("community") Community community,
									 @RequestParam(value="Thumbnail") MultipartFile file,
									 @RequestParam(value="hashtag", required=false)String hashtag)throws Exception{
		System.out.println("\nCommunityController:::addCommunity() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		String safeFile ="";
		System.out.println(file);
		if(file.isEmpty() != true) {
			String originFileName = file.getOriginalFilename(); 
			File target = new File(uploadPathThunbNail, originFileName);
			FileCopyUtils.copy(file.getBytes(),target);
			safeFile += originFileName;
		}else { safeFile += "noThumbnail.png"; }
		community.setCommunityThumbnail(safeFile);
		if(community.getOpenRange().equals("on")) {
			community.setOpenRange("1");
		}else {
			community.setOpenRange("2");
		}
		community.setWriter(1);
		community.setCommunityHashtagCode(1);
		communityService.addCommunity(community);
		
		
		
		
//		HashtagController hashtagController = new HashtagController();
//		Hashtag HashVo = new Hashtag();
//		HashVo.setCommunityCode(community.getCommunityCode());
//		HashVo.setHashtag(hashtag);
//		HashVo.setWriter(community.getWriter());
//		hashtagController.addHashtag(HashVo);
		
		
		
		modelAndView.setViewName("/community/getCommunity?communityCode="+community.getCommunityCode()+"&hashtag="+hashtag);
		System.out.println("\nCommunityController:::addCommunity() 끝:::");
		return modelAndView;
	} 
	
	@RequestMapping(value="getCommunity",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView getCommunity(@RequestParam(value="communityCode") int communityCode,
									 @RequestParam(value="hashtag", required=false)String hashtag)throws Exception {
		System.out.println("\nCommunityController:::getCommunity() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/community/getCommunity.jsp");
		System.out.println(hashtag);
		communityService.countCommunity(communityCode);
		Community community = communityService.getCommunity(communityCode);
//		HashtagController hashtagController = new HashtagController();
//		Hashtag HashVo = new Hashtag();
//		HashVo.setCommunityCode(communityCode);
//		HashVo.setHashtag(hashtag);
//		HashVo.setWriter(community.getWriter());
//		int hashtagCode = hashtagController.addHashtag(HashVo);
//		System.out.println("hashtagCode = "+hashtagCode);
//		community.setCommunityHashtagCode(hashtagCode);
//		
//		communityService.updateCommunity(community);
//		
		
		
		modelAndView.addObject("community", community);
		System.out.println("\nCommunityController:::getCommunity() 끝:::");
		return modelAndView;
	}

	@RequestMapping(value="getCommunityList")
	public ModelAndView getCommunityList(@ModelAttribute("Search") Search search,
										 @RequestParam(value="communityBoard",required=false, defaultValue = "0")int communityBoard)throws Exception {
		System.out.println("\nCommunityController:::getCommunityList() 시작:::");
		System.out.println("searchKeyword = "+search.getSearchKeyword());
		System.out.println("searchCondition = "+search.getSearchCondition());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/community/getCommunityList.jsp");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println("communityBoard = "+communityBoard);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("communityBoard", communityBoard);
		map.put("search", search);
		map = communityService.getCommunityList(map);
		/*map.put("search", search);
		map = communityService.getCommunityList(search);*/
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("=============================");
		System.out.println(resultPage);
		System.out.println(map.get("list"));
		System.out.println("=============================");
		modelAndView.addObject("resultPage",resultPage);
		modelAndView.addObject("list", map.get("list"));
		
		System.out.println("\nCommunityController:::getCommunityList() 끝:::");
		return modelAndView;
	}
	
	@RequestMapping(value="updateCommunity",method=RequestMethod.POST)
	public ModelAndView updateCommunity(@ModelAttribute("community") Community community)throws Exception {
		System.out.println("\nCommunityController:::updateCommunity() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/community/updateCommunity.jsp");
		
		
		System.out.println("\nCommunityController:::updateCommunity() 끝:::");
		return modelAndView;
	}
	
	@RequestMapping(value="deleteCommunity", method=RequestMethod.GET)
	public ModelAndView daleteCommunity(@RequestParam(value="communityCode")int communityCode)throws Exception{
		System.out.println("\nCommunityController:::daleteCommunity() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/community/getCommunityList.jsp");
		communityService.deleteCommunity(communityCode);
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
		//String Path = request.getSession().getServletContext().getRealPath("/upload");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try{
			String originFileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			String uploadPath = uploadPathContent+"/"+uid+"_"+originFileName;
			//폴더 없으면 만들어줌
//			if(!destD.exists()) {
//        		destD.mkdirs();
//        	}
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













