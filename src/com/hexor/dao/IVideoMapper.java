package com.hexor.dao;

import com.hexor.repo.Pager;
import com.hexor.repo.Video;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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
    public Video selectByVkey(String vkey);
    public long searchTotalCounts(String title);
    public List<Video> searchVideosLimit(Pager pager);
    public void videoAddSelf(Map map);
    public void videoReduceSelf(Map map);
    public List<Video> selectVideosInVkeys(List<String> list);
    public List<Video> selectAll();
}
