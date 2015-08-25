package com.hexor.service;

import com.hexor.repo.Pager;
import com.hexor.repo.Topical;
import com.hexor.repo.User;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-30
 * Time: 16:03
 */
public interface ITopicalService {
    public int insertTopical(Topical topical,User trueUser);
    public int insertTopical(Topical topical);
    public List<Topical> selectByTagsLimit(Pager pager);
    public List<Topical> selectByViewsLimit(Pager pager);
    public long selectByTagsCount(String tags);
    public Topical selectById(String id);
    public long selectTotalCount();
    public void topicalViewsAdd(String id);
    public Topical checkVkey(String vkey);
    public long selectCountByAuthorId(int authorId);
    public List<Topical> selectLimitByAuthorId(Pager pager);
    public List<Topical> selectLimitInIds(String ids,Pager pager);
    public int deleteTopical(String tid);
    public int topicalTop(String id,String type,String order);
    public List<Topical> selectByUserId(String userId);
}
