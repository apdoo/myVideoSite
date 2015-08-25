package com.hexor.service;

import com.hexor.repo.Pager;
import com.hexor.repo.TopicalReplay;
import com.hexor.repo.User;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-07
 * Time: 16:24
 */
public interface ITopicalReplayService {
    public void insertTopicalReplay(String tid,String content, User user);
    public long selectReplaysCount(String id);
    public List<TopicalReplay> selectReplaysLimit(Pager pager);
    public long selectTotalCount();
    public int deleteTopicalReplays(String tid);
    public List<TopicalReplay> selectByUserId(String userid);
}
