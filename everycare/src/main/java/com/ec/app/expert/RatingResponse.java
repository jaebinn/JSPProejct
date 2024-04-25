package com.ec.app.expert;

class RatingResponse {
    private float totalRating;

    public RatingResponse(float totalRating) {
        this.totalRating = totalRating;
    }

    public float getTotalRating() {
        return totalRating;
    }

    public void setTotalRating(float totalRating) {
        this.totalRating = totalRating;
    }
}
