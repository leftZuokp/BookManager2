package com.peng.bms.service.impl;

import com.peng.bms.mapper.BookReviewMapper;
import com.peng.bms.model.BookReview;
import com.peng.bms.service.BookReviewService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class BookReviewServiceImpl implements BookReviewService {

    @Resource
    private BookReviewMapper bookReviewMapper;

    @Override
    public Integer getCount() {
        return bookReviewMapper.selectCount();
    }

    @Override
    public Integer getSearchCount(Map<String, Object> params) {
        return bookReviewMapper.selectCountBySearch(params);
    }

    @Override
    public List<BookReview> searchReviewsByPage(Map<String, Object> params) {
        return bookReviewMapper.selectBySearch(params);
    }

    @Override
    public Integer addReview(BookReview review) {
        return bookReviewMapper.insertSelective(review);
    }

    @Override
    public Integer deleteReview(Integer reviewid) {
        return bookReviewMapper.deleteByPrimaryKey(reviewid);
    }

    @Override
    public List<BookReview> getReviewsByBookId(Integer bookid) {
        return bookReviewMapper.selectByBookId(bookid);
    }

    @Override
    public Integer getAvgRatingByBookId(Integer bookid) {
        return bookReviewMapper.selectAvgRatingByBookId(bookid);
    }
}
