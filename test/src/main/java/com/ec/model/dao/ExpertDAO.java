package com.ec.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.ExpertCareerListDTO;
import com.ec.model.dto.ExpertDTO;
import com.ec.model.dto.ExpertLicenseListDTO;
import com.ec.model.dto.ExpertOnlyDTO;
import com.ec.model.dto.Expert_file_indexesDTO;
import com.ec.mybatis.SQLMapConfig;

public class ExpertDAO {
	private SqlSession ss;
	
	public ExpertDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
		
	public boolean insertUser(ExpertDTO expert) {
		return ss.insert("Expert.insert",expert) == 1;
	}

	public ExpertDTO getExpertById(long expert_id) {
		return ss.selectOne("Expert.getExpertById",expert_id);
	}

	public long getExpertCnt() {
		return ss.selectOne("Expert.getExpertCnt");
	}
	public long getExpertKeywordCnt(String selectedKeywords) {
		return ss.selectOne("Expert.getExpertKeywordCnt", selectedKeywords);
	}
	public long getSearchKeywordCnt(String keyword) {
		return ss.selectOne("Expert.getSearchKeywordCnt",keyword);
	}
	public List<ExpertDTO> getList(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		return ss.selectList("Expert.getList",datas);
	}
	public List<ExpertDTO> getExpertSortByRegister(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		return ss.selectList("Expert.getExpertSortByRegister",datas);
	}
	public List<ExpertDTO> getExpertSortByLike(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		return ss.selectList("Expert.getExpertSortByLike", datas);
	}
	public List<ExpertDTO> getExpertSortByLowCost(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		return ss.selectList("Expert.getExpertSortByLowCost", datas);
	}
	
	public List<ExpertDTO> getExpertSortByHighCost(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		return ss.selectList("Expert.getExpertSortByHighCost", datas);
	}

	public boolean updateLikeCount(long expert_idx, int like_cnt) {
		Map<String, Object> params = new HashMap<>();
	    params.put("expert_idx", expert_idx);
	    params.put("like_cnt", like_cnt);
	    return ss.update("Expert.updateLikeCount", params) == 1;
	}
	
	public List<ExpertDTO> getExpertSortByKeyword(int startRow, int pageSize, String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		datas.put("keyword", keyword);
	    return ss.selectList("Expert.getExpertSortByKeyword", datas);
	}
	public boolean updateExpertLikeCount(Long expert_idx, int totalCnt) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("expert_idx", expert_idx);
		datas.put("totalCnt", totalCnt);
        return ss.update("Expert.updateExpertLikeCount", datas) == 1;
    }
	// 전문가 테이블 추가
	public boolean insertExpert(ExpertDTO expert) {
		return ss.insert("Expert.insertExpert", expert) == 1;
	}

	// 전문가 테이블에서 아이디를 매개로 정보 찾아오기
	public ExpertDTO expert_info(String user_id) {
		return ss.selectOne("Expert.selectExpertInfo", user_id);
	}
	public boolean insertExpert_license_list(ExpertLicenseListDTO expertlicense) {
		return ss.insert("Expert.insertLicense",expertlicense) == 1;
	}	
	public boolean insertExpert_career_list(ExpertCareerListDTO expertcareer) {
		return ss.insert("Expert.insertCareer",expertcareer) == 1;
	}

	public List<ExpertDTO> getLikeTopThree() {
        return ss.selectList("Expert.topThree");
	}

	public long getExpertCnt(String keyword) {
		return ss.selectOne("Expert.getExpertCntWithKey",keyword);
	}

	public List<ExpertDTO> getExpertList(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		return ss.selectList("Expert.getExpertList",datas);
	}

	public List<ExpertDTO> getExpertSearchList(int startRow, int pageSize, String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		datas.put("keyword", keyword);
	    return ss.selectList("Expert.getExpertSearchKeyword", datas);
	}
	// 전문가 파일업로드 추가(프로필사진)
	public boolean insertExpert_file_indexes(Expert_file_indexesDTO expertfiledto) {
		return ss.insert("Expert.insertExpert_file_indexes", expertfiledto) == 1;
	}

//	public Expert_file_indexesDTO getProfile() {
//		return ss.selectOne("Expert.getProfile");
//	}
	
	public String getExpertLoction(Long expert_idx) {
		return ss.selectOne("Expert.getLocation",expert_idx);
	}
	public String getUser_nameByExpert_idx(long expert_idx) {
	      return ss.selectOne("Expert.getUser_nameByExpert_idx", expert_idx);
	   }
	public long getExpertIdxByName(String expert_name) {
		return ss.selectOne("Expert.getExpertIdxByName", expert_name);
	}

	public ExpertDTO getExpertInfoByChat(long chat_idx) {
		return ss.selectOne("Expert.getExpertInfoByChat", chat_idx);
	}

	public String getExpertPhone(ExpertDTO expert) {
		return ss.selectOne("Expert.getExpertPhone", expert);
	}
	public String getAvailableTime(long expert_idx) {
		return ss.selectOne("Expert.getAvailableTime", expert_idx);
	}

	public String getProfile(long expert_idx) {
		return ss.selectOne("Expert.getProfile", expert_idx);
	}

	public int getPaymentKey() {
		return ss.selectOne("Expert.selectPaymentKey");
	}

	public boolean updatePaymentKey() {
		return ss.update("Expert.updateKey") == 1;
	}
	
	//expertinfo.jsp -----------------------------------------------------------------
	
	// 키워드 넣기
	public boolean updateKeywordList(ExpertOnlyDTO dto) {
		return 1 == ss.update("Expert.updateKeyword_list", dto);
	}
	
	// 파일 가져오기
	public Expert_file_indexesDTO getFullProfileByExpertIdx(long expert_idx) {
		return ss.selectOne("Expert.selectProfile", expert_idx);
	}
	
	// expert_idx로 파일 삭제
	public boolean deleteFileByExpertIdx(long expert_idx) {
		return 1 == ss.delete("Expert.deleteProfile", expert_idx);
	}
	
	// 전문가 마이페이지용
	// 트랜잭션 적용
	
	//한 행 ExpertOnlyDTO로 받아오기
	public ExpertOnlyDTO getExpertRowById(SqlSession tsss, String user_id) {
		return tsss.selectOne("Expert.getExpertFull", user_id);
	}

	//main block 업데이트
	public boolean updateMainForm(SqlSession tsss, ExpertOnlyDTO eodto) {
		return 1 == tsss.update("Expert.updateMain", eodto);
	}
	
	//resume block 업데이트
	public boolean updateResumeForm(ExpertOnlyDTO eodto) {
		return 1 == ss.update("Expert.updateResume", eodto);
	}
	
	//etcinfo block 업데이트
	public boolean updateEtcinfoForm(ExpertOnlyDTO eodto) {
		return 1 == ss.update("Expert.updateEtcinfo", eodto);
	}
}