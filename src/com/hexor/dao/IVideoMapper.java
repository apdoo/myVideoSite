package com.hexor.dao;

import com.hexor.repo.Pager;
import com.hexor.repo.Video;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-21
 * Time: 21:37
 */
@Service("com.hexor.dao.IVideoMapper")
public interface IVideoMapper {
    public List<Video> selectRecently();
    public long getTotalCounts();
    public List<Video> limit(Pager pager);
    public List<Video> getMostViewsVideos(int count);
    public List<Video> selectRand(int count);
}
