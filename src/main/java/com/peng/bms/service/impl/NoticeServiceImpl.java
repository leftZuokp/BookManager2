package com.peng.bms.service.impl;

import com.peng.bms.mapper.NoticeMapper;
import com.peng.bms.model.Notice;
import com.peng.bms.service.NoticeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Resource
    private NoticeMapper noticeMapper;

    @Override
    public Integer getCount() {
        return noticeMapper.selectCount();
    }

    @Override
    public Integer getSearchCount(Map<String, Object> params) {
        return noticeMapper.selectCountBySearch(params);
    }

    @Override
    public List<Notice> searchNoticesByPage(Map<String, Object> params) {
        return noticeMapper.selectBySearch(params);
    }

    @Override
    public Integer addNotice(Notice notice) {
        return noticeMapper.insertSelective(notice);
    }

    @Override
    public Integer deleteNotice(Notice notice) {
        return noticeMapper.deleteByPrimaryKey(notice.getNoticeid());
    }

    @Override
    public Integer updateNotice(Notice notice) {
        return noticeMapper.updateByPrimaryKeySelective(notice);
    }

    @Override
    public List<Notice> queryLatestNotices(int limit) {
        Map<String, Object> param = new HashMap<>();
        param.put("limit", limit);
        return noticeMapper.selectLatest(param);
    }
}
