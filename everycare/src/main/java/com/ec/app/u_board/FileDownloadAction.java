package com.ec.app.u_board;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;


public class FileDownloadAction implements Action {
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String system_name = req.getParameter("system_name");
		String original_name = req.getParameter("original_name");
		String saveFolder = req.getServletContext().getRealPath("file");
		
		InputStream is = null;
		OutputStream os = null;
		
		//다운로드 받으려는 파일을 자바의 객체로 가져옴
		File file = new File(saveFolder,system_name);
		//그 파일을 향한 통로 개설(파일 데이터를 자바쪽으로 읽어오기 위한 스트림)
		is = new FileInputStream(file);
		
		//다운로드를 위한 준비
		resp.reset();
		//파일 다운로드를 요청한 클라이언트의 정보(브라우저,...)
		String client = req.getHeader("User-Agent");

		//파일을 응답해줄 준비, 세팅(응답 정보를 작성하는 과정, 파일 데이터를 응답할 것이라는 사전 정보 작성)
		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-Description", "JSP Generated Data");
		
		String dwName = "";
		try {
			//파일 이름 인코딩(띄어쓰기)
			try {
				dwName = URLEncoder.encode(original_name,"UTF-8").replaceAll("\\+", "%20");
			} catch (UnsupportedEncodingException e) {
				dwName = URLEncoder.encode(system_name,"UTF-8").replaceAll("\\+", "%20");
			}
			
			//클라이언트의 브라우저가 MSIE라면
			if(client.indexOf("MSIE") != -1) {
				//이렇게 세팅  >>>>>>>>>>>>>>>>>>>>>>		attachment; fileName=apple.png
				resp.setHeader("Content-Disposition", "attachment; fileName="+dwName);
			}
			//그 외의 브라우저라면
			else {
				//저렇게 세팅 >>>>>>>>>>>>>>>>>>>>>>		attachment; fileName="apple.png"
				resp.setHeader("Content-Disposition", "attachment; fileName=\""+dwName+"\"");
			}
			//응답할 내용의 길이(파일의 길이)
			resp.setHeader("Content-Length", file.length()+"");
			
			//다운로드 받을 클라이언트 컴퓨터를 향한 통로 개설
			os = resp.getOutputStream();
			
			//파일 다운로드 : is를 통해 파일 데이터를 읽어서 os를 통해 그 데이터를 작성
			//b : 버퍼
			byte[] b = new byte[(int)file.length()];
			int len = 0;
			//is.read() : 버퍼에 데이터 읽기(파일 끝까지 읽었다면 -1)
			while((len = is.read(b,0,b.length)) != -1) {
				//읽은 데이터(len)을 os를 통해 작성
				os.write(b,0,len);
			}
		} catch (Exception e) {
			System.out.println("filedownloadaction : "+e);
		} finally {
			//통로들 다 닫기
			if(is != null) {
				is.close(); 
			}
			if(os != null) {
				os.close();
			}
		}
		return null;
	}
}
















