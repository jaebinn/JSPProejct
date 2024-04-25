package com.ec.app.user;

import java.io.BufferedReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dto.UserDTO;
import com.ec.validation.InputValidationChecker;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class UserInfoUpdateOkAction implements Action {

	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//한글 깨짐을 방지하기 위한 인코딩 설정
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		//공통으로 사용할 변수
		UserDTO udto = null;
		
		//JSON 관련은 com.ms.test.ajax.Test_AjaxController 참조
		StringBuilder sb = new StringBuilder();
		BufferedReader reader = req.getReader();
		String line;
		while((line = reader.readLine()) != null) {
			sb.append(line);
		}
		String raw = sb.toString();
		
		JsonObject jsonObj = (JsonObject) JsonParser.parseString(raw);
		JsonArray jsonArr = (JsonArray) jsonObj.get("inputs");
		
		String formID = jsonObj.get("formID").getAsString();
		
		String inpName[] = new String[jsonArr.size()];
		String inpVal[] = new String[jsonArr.size()];
		for(int i = 0; i < jsonArr.size(); i++) {
	    	inpName[i] = ((JsonObject) jsonArr.get(i)).get("name").getAsString();
	    	inpVal[i] = ((JsonObject) jsonArr.get(i)).get("value").getAsString();
		}
		
		//값이 제대로 전송되었는지 검증?
		// 일단 지금은 절대 안할거임

		// 플래그
		//비밀번호 업데이트인지 여부
		boolean isPWupdate = false;
		//비밀번호 업데이트의 성공 여부
		Boolean isPWupdateSuccess = false;
		//유효성 검사 성공여부
		boolean isValidationSuccess = true;
		
		//대충 여기쯤에 값 검증을 넣자
		// 아니면 값 검증용 메서드 내지는 클래스를 따로 뽑을 수도 있을거임
		
		//받아온 input값들을 순회하며 전부 유효성 검사를 하는 반복문
		// 중간에 유효성 검사를 실패하는 경우 반복문은 바로 종료됨
		for(int i = 0; i < inpName.length; i++) {
			switch(inpName[i]) {
			case "username":
				if(!InputValidationChecker.inputChecker_name(inpVal[i])) {
					isValidationSuccess = false;
				}
				break;
			//usersex - user.gender는 여기서 바로 검사함
			case "usersex":
				if(!inpVal[i].equals("M-K") && !inpVal[i].equals("W-K") && !inpVal[i].equals("M-F") && !inpVal[i].equals("W-F")) {
					isValidationSuccess = false;
				}
				break;
			//jsp단과의 호환성을 위해 JSON쪽 name 값을 userbirth로 유지
			case "userbirth":
				if(!InputValidationChecker.inputChecker_age(inpVal[i])) {
					isValidationSuccess = false;
				}
				break;
			case "tel_mobile":
				if(!InputValidationChecker.inputChecker_telMobile(inpVal[i])) {
					isValidationSuccess = false;
				}
				break;
			case "tel_sub":
				if(!InputValidationChecker.inputChecker_tel(inpVal[i])) {
					isValidationSuccess = false;
				}
				break;
			case "email":
				if(!InputValidationChecker.inputChecker_email(inpVal[i])) {
					isValidationSuccess = false;
				}
				break;
			case "zip":
				if(!InputValidationChecker.inputChecker_zipcode(inpVal[i])) {
					isValidationSuccess = false;
				}
				break;
			//비밀번호 관련
			// 비밀번호 입력.equals(기존 비밀번호) 는 체크하지 않음
			// 그건 Service 가서ㅇㅇ
			case "existing_userpw":
				if(InputValidationChecker.inputChecker_pw(inpVal[i])) {
					if(InputValidationChecker.inputChecker_pw(inpVal[i+1])) {
						if(InputValidationChecker.inputChecker_pw(inpVal[i+2])) {
							if(inpVal[i+1].equals(inpVal[i+2])) {
								i += 10;
								break;
							}
						}
					}
				}
				i += 10;
				isValidationSuccess = false;
			}
			//유효성에 걸린 경우 바로 반복문 나가기
			if(!isValidationSuccess)
				break;
		}
		
		System.out.println("UserInfoUpdateOkAction isValidationSuccess : " + isValidationSuccess);
		
		//formID값에 따른 분기처리
		// 위에서 진행한 값 검증의 결과에 따라 Service 호출 여부를 분기함
		if(isValidationSuccess) {
			switch(formID) {
			case "update-default-info":
				System.out.println("Service 호출 분기처리 들어옴");
				System.out.println("inpVal[2] : " + inpVal[2]);
				UserDTO dfdto = new UserDTO();
				dfdto.setUser_id((String)req.getSession().getAttribute("loginUser"));
				dfdto.setName(inpVal[0]);
				dfdto.setGender(inpVal[1]);
				dfdto.setAge(inpVal[2]);
				udto = new UserInfoUpdateService().updateDefaultFormService(dfdto);
				break;
			case "update-password-info":
				isPWupdate = true;
				UserDTO pwdto = new UserDTO();
				pwdto.setUser_id((String)req.getSession().getAttribute("loginUser"));
				pwdto.setPw(inpVal[1]);
				//경우의 수가 3개인데 따로 DTO를 싸기는 그래서 반환값을 Boolean으로 함
				// null  > 기존 비밀번호 입력이 틀림
				// false > DB 입력에서 문제가 생김
				// true  > 다 성공
				isPWupdateSuccess = new UserInfoUpdateService().updatePwFormService(inpVal[0], pwdto);
				break;
			case "update-contacts-info":
				UserDTO ctdto = new UserDTO();
				ctdto.setUser_id((String)req.getSession().getAttribute("loginUser"));
				ctdto.setTel_mobile(inpVal[0]);
				ctdto.setTel_sub(inpVal[1]);
				ctdto.setEmail(inpVal[2]);
				udto = new UserInfoUpdateService().updateContactsFormService(ctdto);
				break;
			case "update-addr-info":
				UserDTO addto = new UserDTO();
				addto.setUser_id((String)req.getSession().getAttribute("loginUser"));
				addto.setZipcode(inpVal[0]);
				addto.setAddr(inpVal[1]);
				addto.setAddr_detail(inpVal[2]);
				addto.setAddr_etc(inpVal[3]);
				udto = new UserInfoUpdateService().updateAddrFormService(addto);
				break;
			}
		}
		
		//유효성 체크 통과를 실패했으면 바로 결과값을 싸서 보낸다
		if(!isValidationSuccess) {
			JsonObject failObj = new JsonObject();
			failObj.addProperty("formID", formID);
			failObj.addProperty("isSuccess", false);
			failObj.addProperty("failReason", "Validation");
			resp.getWriter().print(new Gson().toJson(failObj));
			return null;
		}
		
		//비밀번호 업데이트 && 기존 비밀번호가 틀린 경우
		if(isPWupdate && null == isPWupdateSuccess) {
			JsonObject failObj = new JsonObject();
			failObj.addProperty("formID", formID);
			failObj.addProperty("isSuccess", false);
			failObj.addProperty("failReason", "PasswordWrong");
			resp.getWriter().print(new Gson().toJson(failObj));
			return null;
		}
		
		//DB 수정/조회 성공여부 체크
		// ( 비밀번호 외 업데이트 AND 반환값 null ) OR ( 비밀번호 업데이트 AND DB UPDATE 실패시 )
		if((!isPWupdate && udto == null) || (isPWupdate && !isPWupdateSuccess)) {
			//실패시
			// 실패 전달용 JSON을 싸서 보낸다
			JsonObject failObj = new JsonObject();
			failObj.addProperty("formID", formID);
			failObj.addProperty("isSuccess", false);
			failObj.addProperty("failReason", "Server");
			resp.getWriter().print(new Gson().toJson(failObj));
			return null;
		}
		
		//성공시 - 원래는 여기서 바뀐 user_id로 세션을 업데이트해줬는데
		// user_id 수정기능을 없앴으니까 세션 관련도 없앰
		//하여간 수정된 사항을 JSON으로 싸서 AJAX로 응답해준다
		// 리턴값 예시
		//{
		//  formID: "update-default-info",
		//  isSuccess: true
		//  result: [
		//    {
		//      inputType: "text",      <<- result 배열 내부 요소는 각각 input 하나/컬럼 하나에
		//      name: "userid",        대응하는 JSON 객체임
		//      value: "qqwweerr"
		//    },
		//    ...
		//  ]
		//}
		
		//JSON 변환 관련 객체
		Gson gson = new Gson();
		JsonObject resObj = new JsonObject();
		
		//일반 프로퍼티 선언/초기화
		resObj.addProperty("formID", formID);
		resObj.addProperty("isSuccess", true);
		
		//비밀번호 업데이트 외의 경우 배열을 만들고 그 안에 객체를 넣는다
		if(!isPWupdate) {
			JsonArray resArr = new JsonArray();
	
			//inputs 프로퍼티 선언/초기화
			switch(formID) {
			case "update-default-info":
				resArr.add(gson.toJsonTree(new InnerResJsonObj("text", "username", udto.getName())));
				resArr.add(gson.toJsonTree(new InnerResJsonObj("radio", "usersex", udto.getGender())));
				//jsp와의 호환을 위해 JSON쪽 name 값을 userbirth로 유지함
				resArr.add(gson.toJsonTree(new InnerResJsonObj("text", "userbirth", udto.getAge())));
				break;
			case "update-contacts-info":
				resArr.add(gson.toJsonTree(new InnerResJsonObj("text", "tel_mobile", udto.getTel_mobile())));
				resArr.add(gson.toJsonTree(new InnerResJsonObj("text", "tel_sub", udto.getTel_sub())));
				resArr.add(gson.toJsonTree(new InnerResJsonObj("email", "email", udto.getEmail())));
				break;
			case "update-addr-info":
				resArr.add(gson.toJsonTree(new InnerResJsonObj("text", "zip", udto.getZipcode())));
				resArr.add(gson.toJsonTree(new InnerResJsonObj("text", "addr", udto.getAddr())));
				resArr.add(gson.toJsonTree(new InnerResJsonObj("text", "addrdetail", udto.getAddr_detail())));
				resArr.add(gson.toJsonTree(new InnerResJsonObj("text", "addretc", udto.getAddr_etc())));
				break;
			}
			
			//JSON배열을 JSON객체에 넣어준다
			resObj.add("result", resArr);
		}
		
		//JSON 객체 출력
		resp.getWriter().print(gson.toJson(resObj));
		
		return null;
	}
}

//JSON 파일 생성을 위한 클래스
// 이거 다른 파일로 빼거나 하자
class InnerResJsonObj {
	String inputType;
	String name;
	String value;
	InnerResJsonObj(String type, String name, String value) {
		this.inputType = type;
		this.name = name;
		this.value = value;
	}
	public String getType() {
		return inputType;
	}
	public String getName() {
		return name;
	}
	public String getValue() {
		return value;
	}
	
}