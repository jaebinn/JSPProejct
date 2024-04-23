package com.ec.app.user;

import java.io.BufferedReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dto.UserDTO;
import com.ec.validation.InputValidationChecker;

public class UserInfoEtcUpdateOkAction implements Action {

	/*	송수신값 정리
	 * request
	 * "isEmpty:true"					모든 키워드 삭제시
	 * "isEmpty:false,key1,key2,..."	키워드 추가/수정/삭제시
	 * 
	 * response
	 * "isSuccess:false,reason:*reason"					전송값 오류/유효성 실패/DB 문제등
	 * "isSuccess:true,isEmpty:true"					모든 키워드 삭제시
	 * "isSuccess:true,isEmpty:false,key1,key2,..."		키워드 추가/수정/삭제시
	 * */
	
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
		
		//출력 확인
		System.out.println(raw);
		
		//쪼개기
		String val[] = raw.split(",");
		
		//검증
		if(val.length < 1) {
			//대충 값이 안왔을때
			System.out.println("empty req");
			resp.getWriter().print("isSuccess:false,reason:empty");
			return null;
		} else if(val.length == 1 && val[0].isBlank()) {
			//값이 왔는데 내용이 없는 경우
			System.out.println("empty or blank only req");
			resp.getWriter().print("isSuccess:false,reason:emptyorblank");
			return null;
		}
		
		for(int i = 1; i < val.length; i++) {
			//유효성 검사
			//유효성 검사와 동시에 값을 하나의 문자열로 합친다
			if(!InputValidationChecker.inputChecker_keyword(val[i])) {
				System.out.println("validation fail");
				resp.getWriter().print("isSuccess:false,reason:valifail");
				return null;
			}
		}
		
		//DB에 넣을 문자열 구성
		//isEmpty:false,
		//01234567890123 - 14idx - substring(14)
		String inputStr = "";
		
		System.out.println(raw.length());
		
		if(val[0].split(":")[1].equals("false")) {
			//키워드가 존재하는 경우(isEmpty:false)
			inputStr = raw.substring(14);
		}
		//키워드가 존재하지 않는 경우(isEmpty:true)
		//빈 문자열을 그대로 DB에 넣음
		
		System.out.println("inputStr :" + inputStr);
		
		//Service를 통해서 DB 찍턴
		String res;
		UserDTO inputdto = new UserDTO();
		inputdto.setUser_id((String)req.getSession().getAttribute("loginUser"));
		inputdto.setUser_etc(inputStr);
		if(null == (res = new UserInfoUpdateService().updateUserEtcService(inputdto))) {
			//DB 찍턴 실패 - update 실패 혹은 결과 select 실패시
			System.out.println("DB fail");
			resp.getWriter().print("isSuccess:false,reason:dbfail");
			return null;
		}
		
		//로그
		System.out.println("we good - from UserInfoEtcUpdateOkAction.execute");
		
		// response
		
		//저장된 값이 공백 - "" 인 경우(저장된 키워드가 없는 경우)
		// isEmpty:true로 반환
		// 반환값 > "isSuccess:true,isEmpty:true
		if(res.isBlank()) {
			resp.getWriter().print("isSuccess:true,isEmpty:true");
			return null;
		}
		
		//저장된 값이 있는 경우
		// isEmpty:true
		// 반환값 > "isSuccess:true,isEmpty:false,key1,key2,..."
		resp.getWriter().print("isSuccess:true,isEmpty:false," + res);
		
		return null;
	}

}