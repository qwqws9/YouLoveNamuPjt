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
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.stereotype.Repository;

import com.youlove.common.DateFormat;
import com.youlove.service.domain.Flight;
import com.youlove.service.domain.Hotel;
import com.youlove.service.domain.Tour;
import com.youlove.service.guide.WishBeenDao;

@Repository("wishBeenDaoImpl")
public class WishBeenDaoImpl implements WishBeenDao {
	
	 //WebDriver
    private WebDriver driver;
    
    //private WebElement webElement;
    
    private ChromeOptions option;
    //Properties
    public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
    // http://chromedriver.chromium.org/downloads 크롬 드라이버 버전에 맞게 설치
    public static final String WEB_DRIVER_PATH = "C:\\Users\\ejfrm\\Desktop\\selenium\\chromedriver.exe";
    
    //크롤링 할 URL
    private String base_url;
	
	@Override
	public List<Flight> searchFlight(Flight flight) throws Exception {
		
	        //System Property SetUp
	        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
	        
	        option = new ChromeOptions();
	        option.addArguments("user-agent= Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36");
	        option.addArguments("headless");
	        //option.addArguments("disable-gpu");
	        
	        //Driver SetUp
	        driver = new ChromeDriver(option);
	       
	        /*
	         * 좌석 클래스 
	         * 프리미엄 일반석 - PremiumEconomy
	         * 비즈니스 - Business
	         * 일등석 - First
	         * 일반석 - Economy
	         */
	        base_url = "http://flights.wishbeen.com/ko-KR/flights/#/result?originplace="+flight.getStartWay()+"&destinationplace="+flight.getEndWay()+"&"
	        		+ "outbounddate="+flight.getStartDay()+"&inbounddate="+flight.getEndDay()+"&cabinclass="+flight.getGrade()+"&adults="+flight.getAdult()+"&children="+flight.getChildren()+"&infants=0";
	  
	        
	        List<Flight> list = new ArrayList<Flight>();
	        
	        
	        try {
	            //get page (= 브라우저에서 url을 주소창에 넣은 후 request 한 것과 같다)
	            driver.get(base_url);
	            //driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
	            WebDriverWait wait = new WebDriverWait(driver, 20);
//	            wait.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("공동운항")));
	            wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("#main-container > div > div > div.js-results-main-panel > div > div.wide-wrapper.container.result.js-results-container > section.container.tickets > div.js-paginator.paginator-box > div > div > div.results-count")));
	            
	            
	            //driver.getPageSource();
	          //  #main-container > div > div > div.js-results-main-panel > div > div.wide-wrapper.container.result.js-results-container > section.container.tickets > div.js-itinerary-list.items-list > div > div.js-itinerary-list-container
	            
	           // webElement = driver.findElement(By.cssSelector("#main-container > div > div > div.js-results-main-panel > div > div.wide-wrapper.container.result.js-results-container > section.container.tickets > div.js-itinerary-list.items-list > div > div.js-itinerary-list-container"));
	            //System.out.println("================================================================");
		        //System.out.println(webElement.getText());
		        //System.out.println("================================================================");
		        //System.out.println(webElement.);
	            //System.out.println(driver.getPageSource());
	            //System.out.println("================================================================");
	           //webElement = driver.findElement(By.cssSelector(".img-box"));
	           //System.out.println(webElement.getText());
	            
	            //webElement = driver.findElement(By.linkText("항공편 세부 정보"));
	            //System.out.println(webElement);
	            //#view1986 > article > footer > ul.left-side > li > button
	            
	            
	           // webElement = driver.findElement(By.cssSelector("#DetailsContainer0"));
	            //System.out.println(webElement.getText());
	           
	            String html = driver.getPageSource();
	            Document doc = Jsoup.parse(html);
	            //System.out.println(doc);
	            
	            System.out.println("-------------------------------------------------");
	            //Elements el = doc.select("img[width=32]");
	            Elements el = doc.select("div[id^='view']");
	            String view = "";
//	            Elements el = doc.select("#main-container > div > div > div.js-results-main-panel > div > div.wide-wrapper.container.result.js-results-container > section.container.tickets > div.js-itinerary-list.items-list > div > div.js-itinerary-list-container");
	            
	           
	            for(Element e : el) {
	            	flight = new Flight();
	            	view = e.attr("id");
	            	//System.out.println(view = e.attr("id"));
	    			//css=#view4903 .route-box:nth-child(2) .title
//	    			System.out.println("출국 탑승 항공명 : "+e.select("#"+view+" .route-box:nth-child(1) .title").text());
//	    			System.out.println("출국 항공사 로고 : "+e.select("#"+view+" .route-box:nth-child(1) .js-carrier-logo").attr("src"));
//	    			System.out.println("출국 출발지->경유지: "+e.select("#"+view+" .route-box:nth-child(1) .points-box:nth-child(2)").text());
//	    			System.out.println("출국 경유지->도착지: "+e.select("#"+view+" .route-box:nth-child(1) .points-box:nth-child(3)").text());
//	    			System.out.println("출국 소요시간: "+e.select("#"+view+" .route-box:nth-child(1) .subtitle").text());
//	    			System.out.println();
//	    			System.out.println("귀국 탑승 항공명 : "+e.select("#"+view+" .route-box:nth-child(2) .title").text());
//	    			System.out.println("귀국 항공사 로고 : "+e.select("#"+view+" .route-box:nth-child(2) .js-carrier-logo").attr("src"));
//	    			System.out.println("귀국 출발지->경유지: "+e.select("#"+view+" .route-box:nth-child(2) .points-box:nth-child(2)").text());
//	    			System.out.println("귀국 경유지->도착지: "+e.select("#"+view+" .route-box:nth-child(2) .points-box:nth-child(3)").text());
//	    			System.out.println("귀국 소요시간: "+e.select("#"+view+" .route-box:nth-child(2) .subtitle").text());
//	    			System.out.println();
//	    			System.out.println("가격: "+e.select("#"+view+" .price-text").text().replace("?", "")+"원");
//	    			System.out.println("출국 좌석등급: "+e.select("#"+view+" .direction:nth-child(1) .points-box:nth-child(2) .subtitle span").text());
//	    			System.out.println("귀국 좌석등급: "+e.select("#"+view+" .direction:nth-child(2) .points-box:nth-child(2) .subtitle span").text());
//	    			System.out.println("출국 경유지 대기시간: "+e.select("#"+view+" .direction:nth-child(1) .date-time > span").text());
//	    			System.out.println("귀국 경유지 대기시간: "+e.select("#"+view+" .direction:nth-child(2) .date-time > span").text());
//	    			System.out.println("출발지->경유지 비행시간: "+e.select("#"+view+" .count_2_2_s:nth-child(2) > .flighttime").text());
//	    			System.out.println("경유지->도착지 비행시간: "+e.select("#"+view+" .count_2_2_s:nth-child(5) > .flighttime").text());
//	    			System.out.println("경유지->도착지 비행시간: "+e.select("#"+view+" .count_undefined:nth-child(2) > .flighttime").text());
//	    			System.out.println("경유지->도착지 비행시간: "+e.select("#"+view+" .count_undefined:nth-child(5) > .flighttime").text());
	    			flight.setStartFlightName(e.select("#"+view+" .route-box:nth-child(1) .title").text());
	    			flight.setStartFlightLogo(e.select("#"+view+" .route-box:nth-child(1) .js-carrier-logo").attr("src"));
	    			flight.setStartTimeone(e.select("#"+view+" .route-box:nth-child(1) .points-box:nth-child(2)").text());
	    			flight.setStartTimetwo(e.select("#"+view+" .route-box:nth-child(1) .points-box:nth-child(3)").text());
	    			flight.setStartTimeTotal(e.select("#"+view+" .route-box:nth-child(1) .subtitle").text());
	    			
	    			flight.setEndFlightName(e.select("#"+view+" .route-box:nth-child(2) .title").text());
	    			flight.setEndFlightLogo(e.select("#"+view+" .route-box:nth-child(2) .js-carrier-logo").attr("src"));
	    			flight.setEndTimeone(e.select("#"+view+" .route-box:nth-child(2) .points-box:nth-child(2)").text());
	    			flight.setEndTimetwo(e.select("#"+view+" .route-box:nth-child(2) .points-box:nth-child(3)").text());
	    			flight.setEndTimeTotal(e.select("#"+view+" .route-box:nth-child(2) .subtitle").text());
	    			
	    			flight.setPrice(e.select("#"+view+" .price-text").text());
	    			flight.setStartGrade(e.select("#"+view+" .direction:nth-child(1) .points-box:nth-child(2) .subtitle span").text());
	    			flight.setEndGrade(e.select("#"+view+" .direction:nth-child(2) .points-box:nth-child(2) .subtitle span").text());
	    			
	    			
	    			list.add(flight);
	    			System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            driver.close();
	        }
		return list;
	}
	
	

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
	
	@Override
	public Tour selectPageDetail(String tourId,String cost,String checkin,String checkout) throws Exception {
		
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
				tour.setCost(cost);
				tour.setCheckin(checkin);
				tour.setCheckout(checkout);
				
				
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

	@Override
	public List<Hotel> initHotel(Hotel hotel) throws Exception {
		
		String[] date = DateFormat.hotelDate();

		String address;
		if(hotel.getKeyword().equals("init")) {
			address = "https://www.wishbeen.co.kr/city?serviceType=europe&tab=sleep&addHotelInfos=true&rooms=%5B%7B%22adults%22:2,%22children%22:0,%22ages%22:%5B%5D%7D%5D&onlyEnableBooking=true&checkInDate="+date[0]+"&checkOutDate="+date[1]+"&perPage=30";
		}else {
			address = "https://www.wishbeen.co.kr/city?serviceType=europe&searchByContent="+hotel.getKeyword()+"&tab=sleep&"
					+ "addHotelInfos=true&rooms=%5B%7B%22adults%22:"+hotel.getAdult()+",%22children%22:"+hotel.getChildren()+",%22ages%22:%5B%5D%7D%5D&"
							+ "onlyEnableBooking=true&checkInDate="+hotel.getCheckin()+"&checkOutDate="+hotel.getCheckout()+"&perPage=30";
		}
		Document doc = Jsoup.connect(address).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36").get();
		
		//System.out.println(doc);
		List<Hotel> list = new ArrayList<Hotel>();
		
		Elements el;
		for(int i = 1; i < 100; i++) {
			el = doc.select(".spots-contents:nth-child("+i+")");
			// for문 돌리면서 비교하자 마지막 자식까지 왔는지 체크
			if(el.isEmpty()) {
				break;
			}
			for(Element e : el) {
				hotel = new Hotel();
				System.out.println("상세 조회시 아이디값 : "+e.select(".spot-info-box").attr("data-id"));
				System.out.println("숙소명 : "+e.select(".spot-name").text());
				System.out.println("숙소 썸네일 src : "+e.select(".spots-contents > .spot-img a img").attr("src"));
				System.out.println("숙소 간략설명 : "+e.select(".spot-state").text());
				System.out.println("숙소 위치 도시?? : " + e.select(".desc > .town").text());
				System.out.println("숙소 1박당 가격 : " + e.select(".hotel-info > .cost").text());
				System.out.println();
				System.out.println("=======================================================================================");
				hotel.setHotelId(e.select(".spot-info-box").attr("data-id"));
				hotel.setHotelName(e.select(".spot-name").text());
				hotel.setHotelThumb(e.select(".spots-contents > .spot-img a img").attr("src"));
				hotel.setHotelShortDesc(e.select(".spot-state").text());
				hotel.setHotelLoc(e.select(".desc > .town").text());
				hotel.setPrice(e.select(".hotel-info > .cost").text());
				hotel.setCheckin(date[0]);
				hotel.setCheckout(date[1]);
				list.add(hotel);
			}
		}
		
		return list;
	}

	

	
	
	
	

}
