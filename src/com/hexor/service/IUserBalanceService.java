package com.hexor.service;

import com.hexor.repo.Pager;
import com.hexor.repo.UserBalance;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-18
 * Time: 10:32
 */
public interface IUserBalanceService {
    public void insertUserBalance(UserBalance userBalance);
    /**
     * 查询用户收支记录信息
     * @param userId 用户id
     * @return
     */
    public List<UserBalance> selectBalacneByUserId(int userId);

    /**
     * 查询用户每日登录领奖
     * @param userId 用户id
     * @return 返回信息条数 0条表示未领取 1条表示领取
     */
    public int selectUserDaily(int userId);
    /**
     * 查询用户收支记录总条数
     * @param userId
     * @return
     */
    public long selectUserTotalBalanceCount(int userId);
    /**
     * 分页查找用户收支记录信息
     * @param pager
     * @return
     */
    public List<UserBalance> limit(Pager pager);
    /**
     * 用户收支记录
     * @param userid
     * @return
     */
    public List<UserBalance> selectByUserId(String userid);
}
