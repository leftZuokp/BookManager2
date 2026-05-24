package com.peng.bms.web;

import com.peng.bms.model.BookReview;
import com.peng.bms.service.BookReviewService;
import com.peng.bms.utils.MyResult;
import com.peng.bms.utils.MyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/bookReview")
public class BookReviewController {

    @Autowired
    BookReviewService bookReviewService;

    // 获得数量
    @GetMapping(value = "/getCount")
    public Integer getCount() {
        return bookReviewService.getCount();
    }

    // 分页查询评论 params: {page, limit, bookname, username}
    @GetMapping(value = "/queryReviewsByPage")
    public Map<String, Object> queryReviewsByPage(@RequestParam Map<String, Object> params) {
        MyUtils.parsePageParams(params);
        int count = bookReviewService.getSearchCount(params);
        List<BookReview> reviews = bookReviewService.searchReviewsByPage(params);
        return MyResult.getListResultMap(0, "success", count, reviews);
    }

    // 根据图书ID查询评论
    @GetMapping(value = {"/getReviewsByBookId", "/reader/getReviewsByBookId"})
    public List<BookReview> getReviewsByBookId(@RequestParam Integer bookid) {
        return bookReviewService.getReviewsByBookId(bookid);
    }

    // 获取图书平均评分
    @GetMapping(value = {"/getAvgRating", "/reader/getAvgRating"})
    public Integer getAvgRating(@RequestParam Integer bookid) {
        return bookReviewService.getAvgRatingByBookId(bookid);
    }

    // 添加评论
    @PostMapping(value = {"/addReview", "/reader/addReview"})
    public Integer addReview(@RequestBody Map<String, Object> params) {
        BookReview review = new BookReview();
        review.setBookid((Integer) params.get("bookid"));
        review.setUserid((Integer) params.get("userid"));
        review.setRating((Integer) params.get("rating"));
        review.setContent((String) params.get("content"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        review.setReviewtime(sdf.format(new Date()));
        return bookReviewService.addReview(review);
    }

    // 删除评论
    @DeleteMapping(value = "/deleteReview")
    public Integer deleteReview(@RequestParam Integer reviewid) {
        return bookReviewService.deleteReview(reviewid);
    }
}
