package com.hexor.dao;

import com.hexor.repo.Pager;
import com.hexor.repo.Topical;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-30
 * Time: 16:00
 */
@Service("com.hexor.dao.ITopicalMapper")
public interface ITopicalMapper {
    public int insertTopical(Topical topical);
    public List<Topical> selectByTagsLimit(Pager pager);
    public List<Topical> selectByViewsLimit(Pager pager);
    public long selectByTagsCount(String tags);
    public Topical selectById(String id);
    public long selectTotalCount();
    public void topicalViewsAdd(Map map);
    public Topical checkVkey(String vkey);
    public long selectCountByAuthorId(int authorId);
    public List<Topical> selectLimitByAuthorId(Pager pager);
    public List<Topical> selectLimitInIds(Map map);
    public int deleteTopical(String tid);
    public int topicalTop(Map map);
    public List<Topical> selectByUserId(String userId);
}
