package com.hexor.dao;

import com.hexor.repo.UserDownloadLog;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-30
 * Time: 16:00
 * 用户下载记录dao
 */
@Service("com.hexor.dao.IUserDownloadLogMapper")
public interface IUserDownloadLogMapper {
    public void insertUserDownloadLog(UserDownloadLog userDownloadLog);

    /**
     * 检查是否是第一次下载
     * @param map
     * @return
     */
    public UserDownloadLog checkDownloadUrl(Map map);

    /**
     * 用户下载记录
     * @param userid
     * @return
     */
    public List<UserDownloadLog> selectByUserId(String userid);
}
