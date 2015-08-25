package com.hexor.service.impl;

import com.hexor.dao.ITopicalReplayMapper;
import com.hexor.repo.Pager;
import com.hexor.repo.TopicalReplay;
import com.hexor.repo.User;
import com.hexor.service.ITopicalReplayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-07
 * Time: 16:24
 */
@Service("com.hexor.service.impl.TopicalReplayService")
public class TopicalReplayService implements ITopicalReplayService {

    @Autowired
    @Qualifier("com.hexor.dao.ITopicalReplayMapper")
    private ITopicalReplayMapper mapper;
    public void setMapper(ITopicalReplayMapper delegate) {
        this.mapper = delegate;
    }

    @Override
    public void insertTopicalReplay(String tid, String content,User user) {
        TopicalReplay topicalReplay=new TopicalReplay();
        topicalReplay.setTopicalId(Integer.parseInt(tid));
        topicalReplay.setAuthor(user.getUsername());
        topicalReplay.setReplayAuthorId(user.getId());
        topicalReplay.setContent(content);
        mapper.insertTopicalReplay(topicalReplay);
    }

    @Override
    public long selectReplaysCount(String id) {
       return mapper.selectReplaysCount(id);
    }

    @Override
    public List<TopicalReplay> selectReplaysLimit(Pager pager) {
        return mapper.selectReplaysLimit(pager);
    }

    @Override
    public long selectTotalCount() {
        return mapper.selectTotalCount();
    }

    /**
     * 删除帖子对应的回复数
     * @param tid
     */
    @Override
    public int deleteTopicalReplays(String tid) {
        return mapper.deleteTopicalReplays(tid);
    }

    @Override
    public List<TopicalReplay> selectByUserId(String userid) {
        return mapper.selectByUserId(userid);
    }
}
