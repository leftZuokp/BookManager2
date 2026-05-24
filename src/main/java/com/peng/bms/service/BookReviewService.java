package com.peng.bms.service;

import com.peng.bms.model.BookReview;
import java.util.List;
import java.util.Map;

public interface BookReviewService {
    Integer getCount();
    Integer getSearchCount(Map<String, Object> params);
    List<BookReview> searchReviewsByPage(Map<String, Object> params);
    Integer addReview(BookReview review);
    Integer deleteReview(Integer reviewid);
    List<BookReview> getReviewsByBookId(Integer bookid);
    Integer getAvgRatingByBookId(Integer bookid);
}
