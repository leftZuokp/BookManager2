package com.peng.bms.mapper;

import com.peng.bms.model.Notice;
import java.util.List;
import java.util.Map;

public interface NoticeMapper {
    int insertSelective(Notice record);
    int deleteByPrimaryKey(Integer noticeid);
    int updateByPrimaryKeySelective(Notice record);
    Notice selectByPrimaryKey(Integer noticeid);
    Integer selectCount();
    int selectCountBySearch(Map<String, Object> searchParam);
    List<Notice> selectBySearch(Map<String, Object> searchParam);
    List<Notice> selectLatest(Map<String, Object> param);
}
