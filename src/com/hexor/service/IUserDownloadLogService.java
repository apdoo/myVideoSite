package com.hexor.service;


import com.hexor.repo.UserDownloadLog;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-30
 * Time: 16:03
 * 用户下载记录service
 */
public interface IUserDownloadLogService {
    public void insertUserDownloadLog(UserDownloadLog userDownloadLog);
    /**
     * 检查是否是第一次下载
     * @return
     */
    public UserDownloadLog checkDownloadUrl(String url,int userId);
    /**
     * 用户下载记录
     * @param userid
     * @return
     */
    public List<UserDownloadLog> selectByUserId(String userid);
}
