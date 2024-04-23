package com.ec.validation;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.regex.Pattern;

public class InputValidationChecker {
	/**
	 * ID 체크<br>
	 * 4-32글자, 공백 없이, 영/숫/특, 특문은 첫글자 x
	 * @param id : 체크할 ID 문자열
	 * @return 체크 성공여부
	 * */
	public static boolean inputChecker_ID(String id) {
		if(Pattern.matches("^(?!^[!@#$%^&*\\-=_+])[a-zA-Z0-9!@#$%^&*=\\-_+]{4,32}$", id)) {
			return true;
		}
		return false;
	}
	
	/**
	 * pw 체크<br>
	 * 8-64글자, 공백 없이, 영/숫/특, 숫/특 각각 최소 1개
	 * @param pw : 검사할 pw 문자열
	 * @return 체크 성공여부
	 * */
	public static boolean inputChecker_pw(String pw) {
		if(Pattern.matches("^(?=.*[!@#$%^&*\\-=_+])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*\\-=_+]{8,64}$", pw)) {
			return true;
		}
		return false;
	}
	
	/**
	 * 이름 체크<br>
	 * 한글만, 공백 없이, 모음/자음만 적을 수 없음(ㄱㄴㄷ ㅑㅏㅓ 등)
	 * @param name : 검사할 이름 문자열
	 * @return 검사 성공여부
	 * */
	public static boolean inputChecker_name(String name) {
		if(Pattern.matches("^[가-힣]{1,}$", name)) {
			return true;
		}
		return false;
	}
	
	/**
	 * 휴대폰 전화번호 체크<br>
	 * 숫자/특문(-)만, 휴대폰 전화번호 양식(010-xxx-xxxx, 010-xxxx-xxxx)
	 * @param tel : 검사할 전화번호 문자열
	 * @return 검사 성공여부
	 * */
	public static boolean inputChecker_telMobile(String tel) {
		if(Pattern.matches("^010-(\\d{3,4})-(\\d{4})$", tel)) {
			return true;
		}
		return false;
	}
	
	/**
	 * 전화번호 체크<br>
	 * 숫자/특문(-)만, 휴대전화/집전화 양식 모두 가능
	 * @param tel : 검사할 전화번호 문자열
	 * @return 검사 성공여부
	 * */
	public static boolean inputChecker_tel(String tel) {
		if(Pattern.matches("^0((10-(\\d{4})-(\\d{4}))|(2|3[1-3]|4[1-4]|5[1-5]|6[1-4])-(\\d{3,4})-(\\d{4}))$", tel)) {
			return true;
		}
		return false;
	}
	
	/**
	 * 이메일<br>
	 * 이건 잘.. 모르겠음
	 * @param email : 검사할 이메일 문자열
	 * @return 검사 성공여부
	 * */
	public static boolean inputChecker_email(String email) {
		if(Pattern.matches("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$", email)) {
			return true;
		}
		return false;
	}
	
	/**
	 * 생년월일<br>
	 * java.sql.Date 양식(yyyy-mm-dd), 1900-01-01 ~ 2099-12-31까지 입력 가능<br>
	 * 윤년, 달에 따른 최대 일수와 나이 제한은 정규식 외의 방법으로 체크함<br>
	 * 나이 제한은 만 14세(만 14세가 되는 해부터)를 기준으로 함 - 24년 기준으로 ~10년생까지 통과
	 * @param birth : 검사할 생년월일 문자열
	 * @return 검사 성공여부
	 * */
//	public static boolean inputChecker_birth(String birth) {
//		//문자열 양식이 맞는지 체크
//		if(Pattern.matches("^(19\\d{2}|20\\d{2})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$", birth)) {
//			String ech[] = birth.split("-");
//			//유효한 일수인지 확인(윤년이 아닌데 입력값이 02-29라던가)
//			if(Integer.parseInt(ech[2]) <= YearMonth.of(Integer.parseInt(ech[0]), Integer.parseInt(ech[1])).lengthOfMonth()) {
//				//현재 년을 기준으로 만 14세(정확히는 만 14세가 되는 해)이상인지 확인 - 24년 기준으로 10년생까지(~2010) ok
//				if(Integer.parseInt(ech[0]) <= LocalDate.now().getYear() - 14) {
//					return true;
//				}
//			}
//		}
//		return false;
//	}
	
	/**
	 * 나이<br>
	 * 만 14세 미만은 통과 불가
	 * @param age : 검사할 나이 문자열
	 * @return 검사 성공여부
	 * */
	public static boolean inputChecker_age(String age) {
		if(Pattern.matches("^\\d+$", age)) {
			if(Integer.parseInt(age) >= 14) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 우편번호<br>
	 * 숫자만, 5자리, 01000 ~ 63999까지
	 * @param zipcode : 검사할 우편번호 문자열
	 * @return 검사 성공여부
	 * */
	public static boolean inputChecker_zipcode(String zipcode) {
		if(Pattern.matches("^(0[1-9]|[1-5][0-9]|6[0-3])(\\d{3})$", zipcode)) {
			return true;
		}
		return false;
	}
	
	/**
	 * 키워드(user.user_etc)<br>
	 * 한글/영어/숫자/특문(!@#$%^&*-=_+)만, 1~18자리, 특수문자로만 구성될 수 없음
	 * @param keyword : 검사할 키워드 문자열
	 * @return 검사 성공여부
	 * */
	public static boolean inputChecker_keyword(String keyword) {
		if(Pattern.matches("^(?=.*[가-힣a-zA-Z])[가-힣a-zA-Z0-9!@#$%^&*\\-=_+ ]{1,18}$", keyword)) {
			return true;
		}
		return false;
	}
}
