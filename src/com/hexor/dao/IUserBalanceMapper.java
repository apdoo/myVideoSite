package com.hexor.dao;

import com.hexor.repo.Pager;
import com.hexor.repo.UserBalance;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-14
 * Time: 17:16
 * 用户收支信息dao
 */
@Service("com.hexor.dao.IUserBalanceMapper")
public interface IUserBalanceMapper {

    public void insertUserBalance(UserBalance userBalance);
    /**
     * 查询用户收支记录总条数
     * @param userId
     * @return
     */
    public long selectUserTotalBalanceCount(int userId);
    /**
     * 查询用户收支记录信息
     * @param userId 用户id
     * @return
     */
    public List<UserBalance> selectBalacneByUserId(int userId);

    /**
     * 分页查找用户收支记录信息
     * @param pager
     * @return
     */
    public List<UserBalance> limit(Pager pager);
    /**
     * 查询用户的每日登录领奖记录
     * @param map
     * @return
     */
    public int selectUserDaily(Map map);

    /**
     * 用户收支记录
     * @param userid
     * @return
     */
    public List<UserBalance> selectByUserId(String userid);
}
