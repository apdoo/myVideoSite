package com.hexor.service.impl;

import com.hexor.dao.ITopicalMapper;
import com.hexor.dao.IUserMapper;
import com.hexor.repo.Pager;
import com.hexor.repo.Topical;
import com.hexor.repo.User;
import com.hexor.service.ITopicalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-07
 * Time: 16:15
 */
@Service("com.hexor.service.impl.TopicalService")
public class TopicalService implements ITopicalService{
    @Autowired
    @Qualifier("com.hexor.dao.ITopicalMapper")
    private ITopicalMapper mapper;
    public void setMapper(ITopicalMapper delegate) {
        this.mapper = delegate;
    }

    /**
     * 插入一条新发布的信息同时纪录到用户的发帖纪录字段中
     * @param topical 主题信息
     * @param trueUser 发布的该主题的用户信息
     * @return
     */
    @Override
    public int insertTopical(Topical topical,User trueUser) {
        topical.setAuthorId(trueUser.getId());
        topical.setAuthor(trueUser.getUsername());

         return mapper.insertTopical(topical);
    }

    /**
     * 插入一条新发布的信息
     * @param topical 主题信息
     * @return
     */
    @Override
    public int insertTopical(Topical topical) {
        return mapper.insertTopical(topical);
    }

    /**
     * 按照主题标签分页
     * @param pager
     * @return
     */
    @Override
    public List<Topical> selectByTagsLimit(Pager pager) {
        return mapper.selectByTagsLimit(pager);
    }

    /**
     * 最热主题分页信息
     * @param pager
     * @return
     */
    @Override
    public List<Topical> selectByViewsLimit(Pager pager) {
        return mapper.selectByViewsLimit(pager);
    }

    @Override
    public long selectByTagsCount(String tags) {
        return mapper.selectByTagsCount(tags);
    }

    @Override
    public Topical selectById(String id) {
        return mapper.selectById(id);
    }

    @Override
    public long selectTotalCount() {
        return mapper.selectTotalCount();
    }

    @Override
    public void topicalViewsAdd(String  id) {
        Map map=new HashMap();
        map.put("id",id);
        map.put("views","views");
        mapper.topicalViewsAdd(map);
    }

    /**
     * 给管理员同步下载区主题的方法
     * 检查当前下载的vkey是否已经存在
     * @param vkey
     * @return
     */
    @Override
    public Topical checkVkey(String vkey) {
        return mapper.checkVkey(vkey);
    }

    /**
     * 根据作者id查找发布的主题的总数
     * @param authorId
     * @return
     */
    @Override
    public long selectCountByAuthorId(int authorId) {
        return mapper.selectCountByAuthorId(authorId);
    }

    /**
     * 根据作者id分页查询发布的主题列表信息
     * @param pager
     * @return
     */
    @Override
    public List<Topical> selectLimitByAuthorId(Pager pager) {
        return mapper.selectLimitByAuthorId(pager);
    }

    /**
     * 查询收藏的主题信息列表
     * @param topicalIds
     * @param pager
     * @return
     */
    @Override
    public List<Topical> selectLimitInIds(String topicalIds, Pager pager) {
        Map map=new HashMap();
        if(topicalIds.startsWith(",")&&topicalIds.length()>1){
            topicalIds=topicalIds.substring(1,topicalIds.length());
        }
        String ids[]=topicalIds.split(",");
        map.put("ids",ids);
        map.put("star",pager.getIndex());
        map.put("data",pager.getData());
        return mapper.selectLimitInIds(map);
    }

    /**
     * 删除帖子
     * @param tid
     */
    @Override
    public int deleteTopical(String tid) {
        return mapper.deleteTopical(tid);
    }

    /**
     * 帖子置顶
     * @param id
     * @param type 0-普通 1-置顶
     * @param order
     * @return
     */
    @Override
    public int topicalTop(String id, String type,String order) {
        Map map=new HashMap();
        map.put("id",id);
        map.put("order",order);
        map.put("type",type);
        return mapper.topicalTop(map);
    }

    /**
     * 根据用户id查询用户发帖记录
     * @param userId
     * @return
     */
    @Override
    public List<Topical> selectByUserId(String userId) {
        return mapper.selectByUserId(userId);
    }
}
