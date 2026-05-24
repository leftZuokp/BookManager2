package com.peng.bms.mapper;

import com.peng.bms.model.BookReview;
import java.util.List;
import java.util.Map;

public interface BookReviewMapper {
    int insertSelective(BookReview record);
    int deleteByPrimaryKey(Integer reviewid);
    BookReview selectByPrimaryKey(Integer reviewid);
    Integer selectCount();
    int selectCountBySearch(Map<String, Object> searchParam);
    List<BookReview> selectBySearch(Map<String, Object> searchParam);
    List<BookReview> selectByBookId(Integer bookid);
    Integer selectAvgRatingByBookId(Integer bookid);
}
