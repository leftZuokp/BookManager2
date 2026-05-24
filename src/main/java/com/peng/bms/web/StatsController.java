package com.peng.bms.web;

import com.peng.bms.service.BookInfoService;
import com.peng.bms.service.BookReviewService;
import com.peng.bms.service.BorrowService;
import com.peng.bms.service.UserService;
import com.peng.bms.utils.MyResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(value = "/stats")
public class StatsController {

    @Autowired
    BookInfoService bookInfoService;

    @Autowired
    BorrowService borrowService;

    @Autowired
    UserService userService;

    @Autowired
    BookReviewService bookReviewService;

    // 获取系统统计数据
    @GetMapping(value = {"/getOverview", "/reader/getOverview"})
    public Map<String, Object> getOverview() {
        Map<String, Object> data = new HashMap<>();
        data.put("bookCount", bookInfoService.getCount());
        data.put("borrowCount", borrowService.getCount());
        data.put("userCount", userService.getCount());
        data.put("reviewCount", bookReviewService.getCount());
        return MyResult.getResultMap(200, "success", data);
    }
}
