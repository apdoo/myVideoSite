package com.hexor.dao;

import com.hexor.repo.Pager;
import com.hexor.repo.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Dong
 * Date: 14-8-27
 * Time: 下午2:49
 * To change this template use File | Settings | File Templates.
 */
@Service("com.hexor.dao.IUserMapper")
public interface IUserMapper {

    public List<User> getAllUser();

    public User checkUser(String username);
    public User checkLogin(User user);
    public void insertUser(User user);

    public List<User> limit(Pager pager);
    public long getUsersCount();

    public void loginUpdate(User user);

    public User getUserByUsername(String name);
    public User getUserById(int id);
    public void reducePointsById(String id);
    public void updateUser(User user);
    public List<User> getUserByType();
    public void resetPoints();
    public void updateFavoriteVideo(User user);
    public void updateFavoriteTopical(User user);
    public void updateTopicalIds(User user);
    public void updatePointAndBalance(Map map);
    public void updateUserPassword(User user);
    public void updateUserAvator(Map map);
    public void updateUserType(Map map);
    public void updateUserPoints(Map map);

}
