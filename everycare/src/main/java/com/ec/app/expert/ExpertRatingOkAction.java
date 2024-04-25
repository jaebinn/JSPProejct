package com.ec.app.expert;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ReviewDAO;
import com.google.gson.Gson;

public class ExpertRatingOkAction implements Action {
    @Override
    public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long expert_idx = Long.parseLong(req.getParameter("expert_idx"));

        ReviewDAO rdao = new ReviewDAO();
        Long totalScore = rdao.getExpertRatingScore(expert_idx); // 총 점수를 가져오기
        int totalUser = rdao.getExpertCntByRatingUser(expert_idx); // 해당 전문가의 별점을 남긴 유저의 수
        
        float totalRating;
        if (totalScore != null && totalUser != 0) {
            totalRating = (float) totalScore / totalUser; // 평균 별점 계산
        } else {
            totalRating = 0.0f; // 평균 별점이 없는 경우 0으로 처리
        }
        System.out.println(totalRating);
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(new RatingResponse(totalRating));

        // JSON 형태의 응답 생성
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(jsonResponse);
        out.flush();

        return null;
    }
}
