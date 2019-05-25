package navers;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class Api_naver {
	
	public static String getJson(String theme, String query) {
		  // 초기
		  String clientId = "y_T9fZP0NBgooCU_rVRM";// 애플리케이션 클라이언트 아이디값";
		  String clientSecret = "uVShZ1KEVE";// 애플리케이션 클라이언트 시크릿값";
		  String json = null;
		  try {
		   // 검색
		   String text = URLEncoder.encode(query, "UTF-8");
		   String apiURL = "https://openapi.naver.com/v1/search/"+ theme +"?query=" + text; 
		   // json 결과
		   // String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;
		   // // xml 결과
		   URL url = new URL(apiURL);
		   HttpURLConnection con = (HttpURLConnection) url.openConnection();
		   con.setRequestMethod("GET");
		   con.setRequestProperty("X-Naver-Client-Id", clientId);
		   con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		   // getResponseCode() : 네이버로 부터 받는 코드 : 200번 성공
		   // , 400번 주소오류, 500번 프로그램오류
		   int responseCode = con.getResponseCode();
		   BufferedReader br;
		   if (responseCode == 200) { // 정상 호출
		    br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		   } else { // 에러 발생
		    br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		   }
		   String inputLine;
		   StringBuffer response = new StringBuffer();
		   while ((inputLine = br.readLine()) != null) {
		    response.append(inputLine);
		   }
		   br.close();
		   json = response.toString();
		   System.out.println(json);
		  } catch (Exception e) {
		   System.out.println(e);
		  }
		  return json;
		 }
		

}
