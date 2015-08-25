package com.hexor.service.impl;

import com.hexor.dao.IUserBalanceMapper;
import com.hexor.dao.IUserMapper;
import com.hexor.repo.Pager;
import com.hexor.repo.User;
import com.hexor.repo.UserBalance;
import com.hexor.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Dong
 * Date: 14-8-27
 * Time: 下午4:08
 * To change this template use File | Settings | File Templates.
 */
@Service("com.hexor.service.impl.UserService")
@Transactional
public class UserService implements IUserService {

    @Autowired
    @Qualifier("com.hexor.dao.IUserMapper")
    private IUserMapper mapper;
    public void setMapper(IUserMapper delegate) {
        this.mapper = delegate;
    }

    @Autowired
    @Qualifier("com.hexor.dao.IUserBalanceMapper")
    private IUserBalanceMapper userBalanceMapper;

    public void setUserBalanceMapper(IUserBalanceMapper userBalanceMapper) {
        this.userBalanceMapper = userBalanceMapper;
    }

    @Override
    public List<User> getAllUser() {
        return mapper.getAllUser();  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public User checkUser(String username) {
        return mapper.checkUser(username);  //To change body of implemented methods use File | Settings | File Templates.
    }

    /**
     * 插入用户的方法
     * 事务处理必需抛出异常 spring 才会帮事务回滚
     * @param user
     */
    // @Transactional(rollbackFor={RuntimeException.class})事务注解 发生了异常就回滚
    @Override
    public void insertUser(User user) {
        //To change body of implemented methods use File | Settings | File Templates.
         mapper.insertUser(user);//在mapper中配置了插入成功后将成功后的用户id写入到当前的user的实例中
        int userId=user.getId();//用户id
         UserBalance balance= new UserBalance(userId,"初始资本",user.getPoints(),"获得初始资本 20 金币");
        userBalanceMapper.insertUserBalance(balance);
    }

    @Override
    public List<User> limit(Pager pager) {
        return mapper.limit(pager);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public long getUsersCount() {
        return mapper.getUsersCount();  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public User checkLogin(User user) {
        return mapper.checkLogin(user);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void loginUpdate(User user) {
        mapper.loginUpdate(user);
    }

    @Override
    public User getUserByUsername(String id) {
        return mapper.getUserByUsername(id);
    }

    @Override
    public void reducePointsById(String id) {
        mapper.reducePointsById(id);
    }

    @Override
    public void updateUser(User user) {
        mapper.updateUser(user);
    }

    @Override
    public User getUserById(int id) {
        return mapper.getUserById(id);
    }

    @Override
    public List<User> getUserByType() {
        return mapper.getUserByType();
    }

    @Override
    public void resetPoints() {
        mapper.resetPoints();
    }

    /**
     * 更新用户收藏视频列表
     * @param user
     */
    @Override
    public void updateFavoriteVideo(User user) {
        mapper.updateFavoriteVideo(user);
    }

    /**
     * 更新用户收藏的主题列表
     * @param user
     */
    @Override
    public void updateFavoriteTopical(User user) {
        mapper.updateFavoriteTopical(user);
    }

    /**
     * 更新用户发帖纪录
     * @param user
     */
    @Override
    public void updateTopicalIds(User user) {
        mapper.updateTopicalIds(user);
    }

    /**
     * 用户积分扣除
     * @param reduce 扣除的积分
     * @param id 用户id
     * @param type 收支类型
     * @param description 收支描述
     * @param updateType 更改类型 add增加金币 reduce减少金币
     */
    @Override
    public void updatePointAndBalance(int reduce, int id,String type,String description,String updateType) {
        Map map=new HashMap();
        map.put("reduce",reduce);
        map.put("id",id);
        map.put("updateType",updateType);
        mapper.updatePointAndBalance(map);//用户表中用户积分扣除
        UserBalance balance= new UserBalance(id,type,reduce,description);//新建收支
        userBalanceMapper.insertUserBalance(balance);//插入一条该用户的收支信息
    }

    /**
     * 用户积分扣除
     * @param reduce 扣除的积分
     * @param id 用户id
     * @param type 收支类型
     * @param description 收支描述
     * @param updateType 更改类型 add增加金币 reduce减少金币
     * @param date 收支时间
     */
    @Override
    public void updatePointAndBalance(int reduce, int id,String type,String description,String updateType,String date) {
        Map map=new HashMap();
        map.put("reduce",reduce);
        map.put("id",id);
        map.put("updateType",updateType);
        mapper.updatePointAndBalance(map);//用户表中用户积分扣除
        UserBalance balance= new UserBalance(id,type,reduce,description,date);//新建收支
        userBalanceMapper.insertUserBalance(balance);//插入一条该用户的收支信息
    }

    /**
     * 修改用户密码
     * @param user
     */
    @Override
    public void updateUserPassword(User user) {
        mapper.updateUserPassword(user);
    }

    /**
     * 修改用户头像标志
     * @param id 用户id
     * @param temp 用户temp字段 0-用户使用默认头像  不是0的话就是自定义头像图片名字
     */
    @Override
    public void updateUserAvator(int id, String temp) {
        Map map=new HashMap();
        map.put("id",id);
        map.put("temp",temp);
        mapper.updateUserAvator(map);
    }

    /**
     * 修改用户的类型 0-普通用户 1-vip用户 -1 被禁止的用户
     * @param username
     * @param type
     */
    @Override
    public void updateUserType(String username, int type) {
        Map map=new HashMap();
        map.put("username",username);
        map.put("type",type);
        mapper.updateUserType(map);
    }

    /**
     * 修改用户的金币数量 +-gold
     * @param username
     * @param gold
     */
    @Override
    public void updateUserPoints(String username, int gold) {
        Map map=new HashMap();
        map.put("username",username);
        map.put("gold",gold);
        mapper.updateUserPoints(map);
    }

}
