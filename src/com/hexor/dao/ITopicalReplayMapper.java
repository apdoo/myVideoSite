package com.hexor.dao;

import com.hexor.repo.Pager;
import com.hexor.repo.TopicalReplay;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-07
 * Time: 16:22
 */
@Service("com.hexor.dao.ITopicalReplayMapper")
public interface ITopicalReplayMapper {
    public void insertTopicalReplay(TopicalReplay topicalReplay);
    public long selectReplaysCount(String id);
    public List<TopicalReplay> selectReplaysLimit(Pager pager);
    public long selectTotalCount();
    public int deleteTopicalReplays(String tid);
    public List<TopicalReplay> selectByUserId(String userid);
}
