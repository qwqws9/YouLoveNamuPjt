package com.youlove.service.guideimpl;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Repository;

import com.youlove.service.domain.Tour;
import com.youlove.service.guide.WishBeenDao;

@Repository("wishBeenDaoImpl")
public class WishBeenDaoImpl implements WishBeenDao {

	@Override
	public List<Tour> initTour() throws Exception {
		
		String address = "https://www.wishbeen.co.kr/city?serviceType=europe&tab=attraction";
		Document doc = Jsoup.connect(address).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36").get();
		
				List<Tour> list = new ArrayList<>();
				
				//true면 10페이지 이후도 존재하는것. 아래 searchKeyword , viewPageNum=11 , url 파라미터로 보낼것
				System.out.println(doc.select(".paging .btn-next").text().equals("다음"));
				
				System.out.println(doc.select(".paging li"));
				Elements el = doc.select(".paging li");
				
				int pageCount = 0;
				int firstPageNum = Integer.parseInt(el.first().text());
				for(Element e : el) {
					pageCount = Integer.parseInt(e.text());
				}
				System.out.println("개수만큼 페이지 수 만들것"+pageCount); // 개수만큼 페이지 수 만들것.
				
				Tour tour;
				
				String hashtag;
				String[] sp;
				int idx;
				for(int i = 1; i < 100; i++) {
					tour = new Tour();
					el = doc.select(".spots-contents:nth-child("+i+")");
					// for문 돌리면서 비교하자 마지막 자식까지 왔는지 체크
					if(el.isEmpty()) {
						break;
					}
					for(Element e : el) {
						//System.out.println("상세 조회시 아이디값 : "+e.select(".spot-info-box").attr("data-id"));
						//System.out.println("관광지명 : "+e.select(".spot-name").text());
						//System.out.println("관광지 썸네일 src : "+e.select(".spots-contents > .spot-img a img").attr("src"));
						//System.out.println("관광지 간략설명 : "+e.select(".spot-state").text());
						//System.out.println("관광지 위치 도시?? : " + e.select(".desc > .town").text());
						//System.out.println("태그 : " + e.select(".tag").text());
						//System.out.println();
						//System.out.println("=======================================================================================");
						tour.setTourId(e.select(".spot-info-box").attr("data-id"));
						tour.setTourName(e.select(".spot-name").text());
						tour.setTourThumb(e.select(".spots-contents > .spot-img a img").attr("src"));
						tour.setTourShortDesc(e.select(".spot-state").text());
						tour.setTourLoc(e.select(".desc > .town").text());
						hashtag = e.select(".tag").text();
						idx = 1;
						if(hashtag.contains(",")) {
							hashtag.trim();
							sp = hashtag.split(",");
							hashtag="";
							for(String s : sp) {
								if(sp.length == idx) {
									hashtag += "#"+s;
								}else {
									hashtag += "#"+s+" ";
								}
								idx++;
							}
						}else if(hashtag.contains(" ")) {
							sp = hashtag.split("\\s");
							hashtag="";
							for(String s : sp) {
								if(sp.length == idx) {
									hashtag += "#"+s;
								}else {
									hashtag += "#"+s+" ";
								}
								idx++;
							}
						}else if(!hashtag.equals("")) {
							hashtag = "#"+hashtag;
						}
						tour.setHashtag(hashtag);
					}
					tour.setPageCount(pageCount);
					tour.setFirstPageNum(firstPageNum);
					tour.setNextBtn(doc.select(".paging .btn-next").text().equals("다음"));
					tour.setKeyword("init");
					tour.setPageNum(1);
					list.add(tour);
				}
		
		
		return list;
	}

	@Override
	public List<Tour> selectPageNum(Tour tour) throws Exception {
		
		String address = "";
		if(tour.getKeyword().equals("init")) {
			address = "https://www.wishbeen.co.kr/city?serviceType=europe&tab=attraction&viewPageNum="+tour.getPageNum()+"&perPage=20";
		}else {
			address = "https://www.wishbeen.co.kr/city?serviceType=europe&searchByContent="+tour.getKeyword()+"&tab=attraction&viewPageNum="+tour.getPageNum()+"&perPage=20";
		}
		Document doc = Jsoup.connect(address).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36").get();
		
				List<Tour> list = new ArrayList<>();
				
				//true면 10페이지 이후도 존재하는것. 아래 searchKeyword , viewPageNum=11 , url 파라미터로 보낼것
				//System.out.println(doc.select(".paging .btn-next").text().equals("다음"));
				
				//System.out.println(doc.select(".paging li"));
				Elements el = doc.select(".paging li");
				
				int pageCount = 0;
				int firstPageNum = Integer.parseInt(el.first().text());
				int pageNum = tour.getPageNum();
				String keyword = tour.getKeyword();
				for(Element e : el) {
					pageCount = Integer.parseInt(e.text());
				}
				System.out.println("개수만큼 페이지 수 만들것"+pageCount); // 개수만큼 페이지 수 만들것.
				
				
				
				String hashtag;
				String[] sp;
				int idx;
				for(int i = 1; i < 100; i++) {
					tour = new Tour();
					el = doc.select(".spots-contents:nth-child("+i+")");
					// for문 돌리면서 비교하자 마지막 자식까지 왔는지 체크
					if(el.isEmpty()) {
						break;
					}
					for(Element e : el) {
						//System.out.println("상세 조회시 아이디값 : "+e.select(".spot-info-box").attr("data-id"));
						//System.out.println("관광지명 : "+e.select(".spot-name").text());
						//System.out.println("관광지 썸네일 src : "+e.select(".spots-contents > .spot-img a img").attr("src"));
						//System.out.println("관광지 간략설명 : "+e.select(".spot-state").text());
						//System.out.println("관광지 위치 도시?? : " + e.select(".desc > .town").text());
						//System.out.println("태그 : " + e.select(".tag").text());
						//System.out.println();
						//System.out.println("=======================================================================================");
						tour.setTourId(e.select(".spot-info-box").attr("data-id"));
						tour.setTourName(e.select(".spot-name").text());
						tour.setTourThumb(e.select(".spots-contents > .spot-img a img").attr("src"));
						tour.setTourShortDesc(e.select(".spot-state").text());
						tour.setTourLoc(e.select(".desc > .town").text());
						hashtag = e.select(".tag").text();
						idx = 1;
						if(hashtag.contains(",")) {
							hashtag.trim();
							sp = hashtag.split(",");
							hashtag="";
							for(String s : sp) {
								if(sp.length == idx) {
									hashtag += "#"+s;
								}else {
									hashtag += "#"+s+" ";
								}
								idx++;
							}
						}else if(hashtag.contains(" ")) {
							sp = hashtag.split("\\s");
							hashtag="";
							for(String s : sp) {
								if(sp.length == idx) {
									hashtag += "#"+s;
								}else {
									hashtag += "#"+s+" ";
								}
								idx++;
							}
						}else if(!hashtag.equals("")) {
							hashtag = "#"+hashtag;
						}
						tour.setHashtag(hashtag);
					}
					tour.setPageCount(pageCount);
					tour.setFirstPageNum(firstPageNum);
					tour.setNextBtn(doc.select(".paging .btn-next").text().equals("다음"));
					tour.setKeyword(keyword);
					tour.setPageNum(pageNum);
					list.add(tour);
				}
		
		
		return list;
	}

	@Override
	public Tour selectPageDetail(String tourId) throws Exception {
		
				//String detailCode = "ec47cea9ae64f8c7";
				String address = "https://www.wishbeen.co.kr/spot/"+tourId;
				Document doc = Jsoup.connect(address).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36").get();
				
				//System.out.println(doc.toString());
				//System.out.println(doc.select("#spot_base_info_panel > dt:nth-child(1)"));
				//#spot_base_info_panel > dt:nth-child(1)
				String html = doc.toString();
				
				//System.out.println(html.indexOf("g_data['spotModalData']")+27);
				//System.out.println(html.indexOf("defaultSpotObject")-6);
				String a = html.substring(html.indexOf("g_data['spotModalData']")+27, html.indexOf("defaultSpotObject")-6);
				//System.out.println(a.indexOf("spot"));
				//System.out.println(a.trim());
				String b = a.trim();
				b = b.substring(6);
				//System.out.println(b);
				Tour tour = new Tour();
				
				JSONObject json = new JSONObject();
				JSONParser parse = new JSONParser();
				json = (JSONObject)parse.parse(b);
//				System.out.println(json);

				System.out.println("국가 : " + json.get("country"));
				System.out.println("도시 : " +json.get("city"));
				System.out.println("주소 : " +json.get("address"));
				System.out.println("관광지 아이디값 : " + json.get("_id"));
				System.out.println("긴 설명 : " + json.get("longDesc"));
				System.out.println("관광지명 : " + json.get("name"));
				System.out.println("비용 : " + json.get("cost"));
				System.out.println("가는법 : " + json.get("way"));
				System.out.println("오픈시간 : " + json.get("open"));
				System.out.println("간략설명 : " + json.get("shortDesc"));
				System.out.println("휴무일 : " + json.get("close"));
				tour.setCountryTour((String)json.get("country"));
				tour.setCityTour((String)json.get("city"));
				tour.setAddress((String)json.get("address"));
				tour.setTourId((String)json.get("_id"));
				tour.setLongDesc((String)json.get("longDesc"));
				tour.setTourName((String)json.get("name"));
				tour.setCostTour((String)json.get("cost"));
				tour.setWayTour((String)json.get("way"));
				tour.setOpenTour((String)json.get("open"));
				tour.setCloseTour((String)json.get("close"));
				tour.setTourShortDesc((String)json.get("shortDesc"));
				
				
				
				JSONArray array1 = (JSONArray)json.get("spotImages");
				
				
				json = (JSONObject)json.get("location");
				json = (JSONObject)json.get("loc");
				JSONArray array = (JSONArray)json.get("coordinates");
				Double lng = (Double)array.get(0); //경도
				Double lat = (Double)array.get(1); //위도
				System.out.println("경도 : " +lng);
				System.out.println("위도 : " +lat);
				
				tour.setLatTour(lat);
				tour.setLngTour(lng);
				
				
				//System.out.println(array.toString());
				List<String> list = new ArrayList<String>();
				System.out.println("관광지 사진 수 : "+array1.size());
				for(int i = 0; i < array1.size(); i++) {
					json = (JSONObject)array1.get(i);
					json = (JSONObject)json.get("original");
					System.out.println(json.get("src"));
					list.add((String)json.get("src"));
					System.out.println("================");
				}
				tour.setSpotImage(list);
				
				/*
				 * country
				 * city
				 * address
				 * _id
				 * longDesc
				 * Agoda - starRating
				 * 
				 * 
				 */
//				
				
				
		
		return tour;
	}
	
	

}
