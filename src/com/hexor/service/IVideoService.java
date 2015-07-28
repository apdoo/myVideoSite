package com.hexor.service;

import com.hexor.repo.Pager;
import com.hexor.repo.Video;

import java.io.IOException;
import java.util.List;

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
}
