package com.hexor.service;

import com.hexor.repo.Pager;
import com.hexor.repo.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Dong
 * Date: 14-8-27
 * Time: 下午3:06
 * To change this template use File | Settings | File Templates.
 */
public interface IUserService {

    public List<User> getAllUser();

    public User checkUser(String username);
    public void insertUser(User user)  ;

    public List<User> limit(Pager pager);
    public long getUsersCount();
    public User checkLogin(User user);
    public void loginUpdate(User user);
    public User getUserByUsername(String id);
    public void reducePointsById(String id);
    public void updateUser(User user);
    public User getUserById(int id);
    public List<User> getUserByType();
    public void resetPoints();
    public void updateFavoriteVideo(User user);
    public void updateFavoriteTopical(User user);
    public void updateTopicalIds(User user);
    public void updatePointAndBalance(int reduce,int id,String type,String description,String updateType);
    public void updatePointAndBalance(int reduce, int id,String type,String description,String updateType,String date);
    public void updateUserPassword(User user);
    public void updateUserAvator(int id,String temp);
    public void updateUserType(String username,int type);
    public void updateUserPoints(String username,int gold);
}
