package com.ec.app.expert;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ec.model.dao.ExpertDAO;
import com.ec.model.dto.ExpertCareerListDTO;
import com.ec.model.dto.ExpertDTO;
import com.ec.model.dto.ExpertLicenseListDTO;
import com.ec.model.dto.Expert_file_indexesDTO;
import com.ec.action.Action;
import com.ec.action.Transfer;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ExpertAddOkAction implements Action{

	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		HttpSession session = req.getSession();
//		resp.setCharacterEncoding("UTF-8");
//		resp.setContentType("text/html; charset=utf-8");
		
		// cos 이용
		//	파일이 실제로 저장된 경로
		String saveFolder = req.getServletContext().getRealPath("file");
		System.out.println("파일저장 경로 : "+saveFolder);
		// 저장될 파일의 최대 크기(1.5GB)
		int size = (int)(1024*1024*1024*1.5);
		// req : HttpServletRequest 객체
		// saveFolder : 파일이 저장될 경로
		// size : 업로드 파일의 최대 크기
		// "UTF-8" : 파일 이름의 인코딩 방식
		// new DefaultFileRenamePolicy() : 동일한 이름의 파일이 업로드되었을때 자동으로 파일 이름 변경
		// MultipartRequest쓰는순간 req를 사용하지 못함
		MultipartRequest multi = new MultipartRequest(req, saveFolder, size,
				"UTF-8", new DefaultFileRenamePolicy());
		
		ExpertDTO expertdto = new ExpertDTO();
		ExpertCareerListDTO expertcarrerdto = new ExpertCareerListDTO();
		ExpertLicenseListDTO expertlicensedto = new ExpertLicenseListDTO();
		Expert_file_indexesDTO expertfiledto = new Expert_file_indexesDTO();
		
		// 전문가테이블의 들어갈 정보들 파라미터 수집
		expertdto.setUser_id(multi.getParameter("e_id_value")); // 유저아이디 파라미터 수집
		expertdto.setResume(multi.getParameter("resume_value")); // 자개소개 파라미터 수집
		
		Boolean boo = true;
		if(multi.getParameter("is_drivable_yes") == "is_drivable_no") { // 운전가능여부 파라미터 수집
			expertdto.setIs_drivable(!boo);
		} else {
			expertdto.setIs_drivable(boo);
		}
	
		expertdto.setLocation(multi.getParameter("location_value")); // 근무가능지역 파라미터 수집
		expertdto.setKeyword_list(multi.getParameter("keyWordList")); // 키워드 파라미터 수집
		
		
		String starttime = multi.getParameter("available_time_value1");
		String endtime = multi.getParameter("available_time_value2");
		String available_time = starttime + " ~ " + endtime;
		System.out.println("근무가능 시간 : "+available_time);
		expertdto.setAvailable_time(available_time); // 근무 가능한 시간 파라미터 수집	
		
		String cost_value = multi.getParameter("cost_value"); // 희망급여 파라미터 수집
		if(cost_value != null && !cost_value.isEmpty()) {
			try {
				expertdto.setCost(Integer.parseInt(cost_value));
			} catch (NumberFormatException e) {
				System.out.println("cost_value를 숫자로 변환할 수 없습니다.");
				e.printStackTrace();
			}
		}
		
		expertdto.setAccount(multi.getParameter("account")); // 계좌정보 파라미터 수집
		
		// 전문가의 경력과 자격증을 제외한것부터 저장
		ExpertDAO edao = new ExpertDAO();
		edao.insertExpert(expertdto);
		
		// 저장해야 expert_idx가 생성됨 이걸 경력테이블과 자격증 테이블에 넣어줘야함
		Long expert_idx = edao.expert_info(expertdto.getUser_id()).getExpert_idx();
		
		
		
		
		// 전문가의 경력테이블에 들어갈 정보들 파라미터 수집
		String career_name[] = multi.getParameterValues("career_name");
		String start_time[] = multi.getParameterValues("start_time");
		String end_time[] = multi.getParameterValues("end_time");
		
		// start_time과 end_time이 String으로 받았지만 sql.date로 변환해서 넣어야함
		
		for(int i = 0; i < career_name.length; i++) {
			if(career_name[i] != null && career_name[i] != "" && 
				start_time[i] != null && start_time[i] != "" &&
				end_time[i] != null && end_time[i] != "") {
				expertcarrerdto.setExpert_idx(expert_idx);
				expertcarrerdto.setCareer_name(career_name[i]);
				
				// start_time[]배열의 첫번째 요소 가져오기
				String start_timeStr = start_time[i];
				String end_timeStr = end_time[i];
				// java.util.Date로 파싱
				SimpleDateFormat dateFormat_start_timeStr = new SimpleDateFormat("yyyyMMdd");
				SimpleDateFormat dateFormat_end_timeStr = new SimpleDateFormat("yyyyMMdd");
				try {
					// start_time
					java.util.Date Util_start_time = dateFormat_start_timeStr.parse(start_timeStr);
					java.sql.Date Sql_start_time = new java.sql.Date(Util_start_time.getTime());
					expertcarrerdto.setStart_time(Sql_start_time);
					// end_time
					java.util.Date Util_end_time = dateFormat_end_timeStr.parse(end_timeStr);
					java.sql.Date Sql_end_time = new java.sql.Date(Util_end_time.getTime());
					expertcarrerdto.setEnd_time(Sql_end_time);
				} catch (ParseException e) {
					System.out.println("경력기간 파싱 과정에서 타입 미스매치오류"+e);
					e.printStackTrace();
				}
				
				edao.insertExpert_career_list(expertcarrerdto);
				
			}
		}
		// 전문가의 라이센스테이블에 들어갈 정보들 파라미터 수집
		String license_name[] = multi.getParameterValues("license_name");
		String acquire_date[] = multi.getParameterValues("acquire_date");
		for(int j = 0; j < license_name.length; j++) {
			if(license_name[j] != null && license_name[j] != "" &&
					acquire_date[j] != null && acquire_date[j] != "") {
				expertlicensedto.setExpert_idx(expert_idx);
				expertlicensedto.setLicense_name(license_name[j]);
				
				// acquire_date[] 배열의 첫번째 요소 가져오기
				String acquire_dateStr = acquire_date[j];
				// java.util.Date로 파싱
				SimpleDateFormat dateFormat_acquire_dateStr = new SimpleDateFormat("yyyyMMdd");
				
				try {
					java.util.Date Util_acquire_date = dateFormat_acquire_dateStr.parse(acquire_dateStr);
					java.sql.Date Sql_acquire_date = new java.sql.Date(Util_acquire_date.getTime());
					expertlicensedto.setAcquire_date(Sql_acquire_date);
				} catch (ParseException e) {
					System.out.println("자격증 취득일자 파싱 과정에서 타입 미스매치오류"+e);
					e.printStackTrace();
				}
				edao.insertExpert_license_list(expertlicensedto);
			}
		}
		
		// 전문가 프로필사진 업로드시 파라미터 수집
		// multi.getFileNames() : 모든 업로드된 파일 이름을 enumeration형태로 반환
		Enumeration<?> temp = multi.getFileNames();
//		// String타입 arylist객체 생성
//		ArrayList<String> fileNames = new ArrayList<String>();
//		// temp.hasMoreElements : temp의 요소가 있다면 true 없다면 false반환
//		
		// 파일 이름 뒤에 추가할 숫자
		
		while(temp.hasMoreElements()) {
			// true인 동안 while문을 돌면서 업로드된 파일 이름을 가져와 fileNames리스트에 추가
			String name = (String)temp.nextElement();
			
			File file = multi.getFile(name);
			
			if(file != null) {
				String fileName = multi.getFilesystemName(name);
				String filePath = saveFolder + File.separator + fileName;
				
				System.out.println("시스템파일명 : "+fileName);
				System.out.println("파일 경로 : "+filePath);
				System.out.println("원본파일명 : "+multi.getParameter("orgFileName"));
				
				expertfiledto.setSystem_name(fileName);
				expertfiledto.setOriginal_name(multi.getParameter("orgFileName"));
				expertfiledto.setExpert_idx(expert_idx);
				
				edao.insertExpert_file_indexes(expertfiledto);
				
			} else {
				System.out.println("파일 업로드 실패!");
			}
		}
//		
//		// while문을 수행할 때 아무것도 첨부하지 않고 보내도 날아가므로 실제보다 1개가 더날아감
//		// 때문에 사이즈에서 -1
//			int len = fileNames.size();
//			fileNames.remove("file"+(len-1));
//		// 파일을 업로드받은 최신순으로 받기위해 역순으로 꺼내옴
//		Collections.reverse(fileNames);
//		
//		for(String name : fileNames) {
//			System.out.println("뭐가나올까?"+name);
//			expertfiledto.setSystem_name(name);
//			expertfiledto.setOriginal_name(name);
//			expertfiledto.setIs_license_identification(false);
//			expertfiledto.setExpert_idx(expert_idx);
//		}
//		System.out.println("fileDTO"+expertfiledto.getSystem_name());
//		System.out.println("fileDTO"+expertfiledto.getOriginal_name());
//		System.out.println("fileDTO"+expertfiledto.getExpert_idx());
		
		session.setAttribute("expertSession", expert_idx);
		
		Transfer transfer = new Transfer();
		transfer.setRedirect(true);
		transfer.setPath(req.getContextPath()+"/");
		
		return transfer;
	}
}








