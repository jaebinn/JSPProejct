package com.ec.app.expert;

import java.io.File;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dto.Expert_file_indexesDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ExpertInfoViewFileUpdateOkAction implements Action {

	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		//로그인검증
		String loginUser = (String) req.getSession().getAttribute("loginUser");
		Integer expert_idx = (Integer) req.getSession().getAttribute("expertSession");
		
		String saveFolder = req.getServletContext().getRealPath("file");
		int size = (int)(1024*1024*1024*1.5);
		System.out.println("ExpertInfoViewFormUpdateOkAction case file - realpath : " + saveFolder);
		MultipartRequest multi = new MultipartRequest(req, saveFolder, size, "UTF-8", new DefaultFileRenamePolicy());
		Enumeration<?> temp = multi.getFileNames();
		String fileName = null;
		if(temp.hasMoreElements()) {
			fileName = (String)temp.nextElement();
		}
		
		boolean isFileUploaded = fileName.isBlank() ? false : true;
		if(isFileUploaded) {
			//파일 업로드시
			String originName = multi.getOriginalFileName(fileName);
			String systemName = multi.getFilesystemName(fileName);

			System.out.println(originName);
			System.out.println(systemName);
			
			//파일 인덱스 저장
			Expert_file_indexesDTO fdto = new Expert_file_indexesDTO();
			fdto.setSystem_name(systemName);
			fdto.setOriginal_name(originName);
			fdto.setIs_license_identification(false);
			fdto.setExpert_idx(Long.valueOf(expert_idx));
			
			//우선 이미 파일이 존재하는지 확인
			Expert_file_indexesDTO tmp = new Expert_file_indexesDTO();
			if(null != (tmp = new ExpertDAO().getFullProfileByExpertIdx(expert_idx))) {
				//파일이 존재하는 경우 지운다
				if(new ExpertDAO().deleteFileByExpertIdx(expert_idx)) {
					//인덱스 삭제 성공시 실제 파일도 지운다
					File file = new File(saveFolder, tmp.getSystem_name());
					if(file.exists())
						file.delete();
				} else {
					//존재하는데 DB서 못 지운 경우
					resp.setContentType("text/html;charset=utf-8");
					PrintWriter out = resp.getWriter();
					out.print("<script>");
					out.print("alert('파일 업로드를 실패했습니다');");
					out.print("location.replace('" + req.getContextPath() + "/expertinfo.ep');");
					out.print("</script>");
					return null;
				}
			}
			//파일이 존재 > 삭제후 삽입, 파일이 없음 > 바로 삽입
			
			//서비스 없이 바로 DB에 insert
			if(new ExpertDAO().insertExpert_file_indexes(fdto)) {
				//insert 성공
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.print("<script>");
				out.print("alert('정보가 수정되었습니다');");
				out.print("location.replace('" + req.getContextPath() + "/expertinfo.ep');");
				out.print("</script>");
				return null;
			} else {
				//insert 실패
				// 삽입 실패시 실제 경로에 저장된 파일도 삭제
				File file = new File(saveFolder, systemName);
				// 파일이 존재하면 삭제
				if(file.exists())
					file.delete();
			}
		} else {
			//업로드된 파일이 없음
			
		}

		//실패
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print("<script>");
		out.print("alert('파일 업로드를 실패했습니다');");
		out.print("location.replace('" + req.getContextPath() + "/expertinfo.ep');");
		out.print("</script>");
		return null;
	}

}
