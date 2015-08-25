package com.hexor.service.impl;

import com.hexor.dao.IUserDownloadLogMapper;
import com.hexor.repo.UserDownloadLog;
import com.hexor.service.IUserDownloadLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-30
 * Time: 16:09
 */
@Service("com.hexor.service.impl.UserDownloadLogService")
public class UserDownloadLogService implements IUserDownloadLogService{
    @Autowired
    @Qualifier("com.hexor.dao.IUserDownloadLogMapper")
    private IUserDownloadLogMapper mapper;
    public void setMapper(IUserDownloadLogMapper delegate) {
        this.mapper = delegate;
    }


    @Override
    public void insertUserDownloadLog(UserDownloadLog userDownloadLog) {
        mapper.insertUserDownloadLog(userDownloadLog);
    }
    /**
     * 检查是否是第一次下载
     * @param url 检测的url
     * @param userId 用户id
     * @return
     */
    @Override
    public UserDownloadLog checkDownloadUrl(String url,int userId){
        Map map=new HashMap();
        map.put("url",url);
        map.put("userId",userId);
        return mapper.checkDownloadUrl(map);
    }

    /**
     * 用户下载记录
     * @param userid
     * @return
     */
    @Override
    public List<UserDownloadLog> selectByUserId(String userid) {
        return mapper.selectByUserId(userid);
    }
}
