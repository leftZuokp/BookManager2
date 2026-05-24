package com.peng.bms.service.impl;

import com.peng.bms.mapper.UserMapper;
import com.peng.bms.model.User;
import com.peng.bms.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    private static final Map<String, User> tokenStore = new ConcurrentHashMap<>();

    @Override
    public User login(User user) {
        return userMapper.selectByUsernameAndPasswordAndIsAdmin(user.getUsername(), user.getUserpassword(), user.getIsadmin());
    }

    @Override
    public void saveUser(String token, User user) {
        tokenStore.put(token, user);
    }

    @Override
    public User getUser(String token) {
        return tokenStore.get(token);
    }

    @Override
    public void removeUser(String token) {
        tokenStore.remove(token);
    }

    @Override
    public Integer register(String username, String password) {
        User tmp = userMapper.selectByUsername(username);
        if(tmp != null) return 0;

        User user = new User();
        user.setUsername(username);
        user.setUserpassword(password);
        user.setIsadmin((byte)0);
        return userMapper.insertSelective(user);
    }

    @Override
    public void setPassword(Integer id, String password) {
        User user = new User();
        user.setUserid(id);
        user.setUserpassword(password);
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public Integer getCount() {
        return userMapper.selectCount();
    }

    @Override
    public List<User> queryUsers() {
        return userMapper.selectAll();
    }

    @Override
    public int getSearchCount(Map<String, Object> params) {
        return userMapper.selectCountBySearch(params);
    }

    @Override
    public List<User> searchUsersByPage(Map<String, Object> params) {
        return userMapper.selectBySearch(params);
    }

    @Override
    public Integer addUser(User user) {
        return userMapper.insertSelective(user);
    }

    @Override
    public Integer deleteUser(User user) {
        if(user.getUserid() == 1) return 0;
        return userMapper.deleteByPrimaryKey(user.getUserid());
    }

    @Override
    public Integer deleteUsers(List<User> users) {
        int count = 0;
        for(User user : users) {
            count += deleteUser(user);
        }
        return count;
    }

    @Override
    public Integer updateUser(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

}
