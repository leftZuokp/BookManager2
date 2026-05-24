package com.peng.bms.service;

import com.peng.bms.model.Notice;
import java.util.List;
import java.util.Map;

public interface NoticeService {
    Integer getCount();
    Integer getSearchCount(Map<String, Object> params);
    List<Notice> searchNoticesByPage(Map<String, Object> params);
    Integer addNotice(Notice notice);
    Integer deleteNotice(Notice notice);
    Integer updateNotice(Notice notice);
    List<Notice> queryLatestNotices(int limit);
}
