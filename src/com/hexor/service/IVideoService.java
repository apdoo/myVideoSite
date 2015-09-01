package com.hexor.service;

import com.hexor.repo.Pager;
import com.hexor.repo.Video;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-21
 * Time: 21:49
 */

public interface IVideoService {
    public List<Video> selectRecently() throws Exception;
    public long getTotalCounts();
    public List<Video> limit(Pager pager) throws Exception;
    public List<Video> getMostViewsVideos(int count) throws Exception;
    public List<Video> selectRand(int count) throws Exception;
    public Video selectByVkey(String vkey) throws Exception;
    public long searchTotalCounts(String title);
    public List<Video> searchVideosLimit(Pager pager) throws IOException;
    public void videoAddSelf(Map map);
    public void videoReduceSelf(Map map);
    public List<Video> selectVideosInVkeys(List<String> list) throws IOException;
    public Video getOnlyVideoName(String vkey);
    public List<Video> selectAll();
    public List<Video> selectByToday(String updatetime);
}
