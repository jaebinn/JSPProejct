package com.ec.app.user;

import com.google.gson.JsonElement;

class UserCounts {
    private Long totalUsers;
    private Long expertCount;
    private Long matchingCount;

    public UserCounts(Long totalUsers, Long expertCount, Long matchingCount) {
        this.totalUsers = totalUsers;
        this.expertCount = expertCount;
        this.matchingCount = matchingCount;
    }
}
