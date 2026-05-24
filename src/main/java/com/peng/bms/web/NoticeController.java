package com.peng.bms.web;

import com.peng.bms.model.Notice;
import com.peng.bms.service.NoticeService;
import com.peng.bms.utils.MyResult;
import com.peng.bms.utils.MyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/notice")
public class NoticeController {

    @Autowired
    NoticeService noticeService;

    // 获得数量
    @GetMapping(value = "/getCount")
    public Integer getCount() {
        return noticeService.getCount();
    }

    // 分页查询公告 params: {page, limit, noticetitle}
    @GetMapping(value = "/queryNoticesByPage")
    public Map<String, Object> queryNoticesByPage(@RequestParam Map<String, Object> params) {
        MyUtils.parsePageParams(params);
        int count = noticeService.getSearchCount(params);
        List<Notice> notices = noticeService.searchNoticesByPage(params);
        return MyResult.getListResultMap(0, "success", count, notices);
    }

    // 查询最新公告
    @GetMapping(value = {"/queryLatestNotices", "/reader/queryLatestNotices"})
    public List<Notice> queryLatestNotices(@RequestParam(defaultValue = "5") Integer limit) {
        return noticeService.queryLatestNotices(limit);
    }

    // 添加公告
    @PostMapping(value = "/addNotice")
    public Integer addNotice(@RequestBody Map<String, Object> params) {
        Notice notice = new Notice();
        notice.setNoticetitle((String) params.get("noticetitle"));
        notice.setNoticecontent((String) params.get("noticecontent"));
        notice.setAuthorname((String) params.get("authorname"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        notice.setNoticetime(sdf.format(new Date()));
        return noticeService.addNotice(notice);
    }

    // 删除公告
    @DeleteMapping(value = "/deleteNotice")
    public Integer deleteNotice(@RequestBody Notice notice) {
        return noticeService.deleteNotice(notice);
    }

    // 更新公告
    @PutMapping(value = "/updateNotice")
    public Integer updateNotice(@RequestBody Notice notice) {
        return noticeService.updateNotice(notice);
    }
}
