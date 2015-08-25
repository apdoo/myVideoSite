package com.hexor.service.impl;

import com.hexor.dao.IUserBalanceMapper;
import com.hexor.repo.Pager;
import com.hexor.repo.UserBalance;
import com.hexor.service.IUserBalanceService;
import com.hexor.util.Configurer;
import com.hexor.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-18
 * Time: 10:33
 * 用户收支service
 */
@Service("com.hexor.service.impl.UserBalanceService")
public class UserBalanceService implements IUserBalanceService{
    @Autowired
    @Qualifier("com.hexor.dao.IUserBalanceMapper")
    private IUserBalanceMapper userBalanceMapper;

    public void setUserBalanceMapper(IUserBalanceMapper userBalanceMapper) {
        this.userBalanceMapper = userBalanceMapper;
    }
    /**
     * 新建一条收支信息
     * @param userBalance
     */
    @Override
    public void insertUserBalance(UserBalance userBalance) {
        userBalanceMapper.insertUserBalance(userBalance);
    }

    /**
     * 查询用户收支记录信息
     * @param userId 用户id
     * @return
     */
    @Override
    public List<UserBalance> selectBalacneByUserId(int userId) {
        return userBalanceMapper.selectBalacneByUserId(userId);
    }
    /**
     * 查询用户每日登录领奖
     * @param userId 用户id
     * @return 返回信息条数 0条表示未领取 1条表示领取
     */
    @Override
    public int selectUserDaily(int userId) {
        Map map=new HashMap();
        map.put("userId",userId);
        map.put("type",(String) Configurer.getContextProperty("balance.type.daily"));//类型-每日登录
        map.put("time", DateUtil.getDateFolder());//当天的日期YYYYMMDD
        return userBalanceMapper.selectUserDaily(map);
    }

    @Override
    public long selectUserTotalBalanceCount(int userId) {
        return userBalanceMapper.selectUserTotalBalanceCount(userId);
    }

    @Override
    public List<UserBalance> limit(Pager pager) {
        return userBalanceMapper.limit(pager);
    }

    /**
     * 用户收支记录
     * @param userid
     * @return
     */
    @Override
    public List<UserBalance> selectByUserId(String userid) {
        return userBalanceMapper.selectByUserId(userid);
    }
}
