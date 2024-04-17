package com.ec.app.expert;

import java.util.List;
import com.ec.model.dto.ExpertDTO;

public class InfoResponse {
    private List<ExpertDTO> expertList;

    public InfoResponse(List<ExpertDTO> expertList) {
        this.expertList = expertList;
    }

    public List<ExpertDTO> getExpertList() {
        return expertList;
    }

    public void setExpertList(List<ExpertDTO> expertList) {
        this.expertList = expertList;
    }
}
