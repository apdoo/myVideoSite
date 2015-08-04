package com.hexor.service.impl;

import com.hexor.dao.IVideoMapper;
import com.hexor.repo.Pager;
import com.hexor.repo.Video;
import com.hexor.service.IVideoService;
import com.hexor.util.Configurer;
import com.hexor.util.EncodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-21
 * Time: 21:50
 */
@Service("com.hexor.service.impl.VideoService")
public class VideoService implements IVideoService{
    private String videoRoot=(String) Configurer.getContextProperty("video.root");//视频路径
    private String imageRoot=(String) Configurer.getContextProperty("image.root");//视频图片根路径
    @Autowired
    @Qualifier("com.hexor.dao.IVideoMapper")
    private IVideoMapper mapper;

    public void setMapper(IVideoMapper delegate) {
        this.mapper = delegate;
    }

    /**
     * 获得最新的9条视频信息
     * @return
     */
    @Override
    public List<Video> selectRecently() throws Exception {
        List<Video> list= mapper.selectRecently();
        return handleVideoList(list);
    }

    /**
     * 查询总视频数
     * @return
     */
    @Override
    public long getTotalCounts() {
        return mapper.getTotalCounts();
    }

    @Override
    public List<Video> limit(Pager pager) throws Exception {
        List<Video> list=mapper.limit(pager);
        return handleVideoList(list);
    }

    /**
     * 查询观看最多的视频信息
     * @param count 数量
     * @return
     * @throws Exception
     */
    @Override
    public List<Video> getMostViewsVideos(int count)throws Exception {
        List<Video> list= mapper.getMostViewsVideos(count);
        return handleVideoList(list);
    }

    /**
     * 查询随机的一组视频信息
     * @param count 查询的数量
     * @return
     * @throws Exception
     */
    @Override
    public List<Video> selectRand(int count) throws Exception {
        List<Video> list=mapper.selectRand(count);
        return  handleVideoList(list);
    }

    /**
     * 根据vkey查询出一条视频信息
     * @param vkey
     * @return
     */
    @Override
    public Video selectByVkey(String vkey) throws Exception {
        return handleVideo(mapper.selectByVkey(vkey));
    }

    /**
     * 搜索视频的总数
     * @param title
     * @return
     */
    @Override
    public long searchTotalCounts(String title) {
        return mapper.searchTotalCounts(title);
    }
    /**
     * 分页实现搜索视频
     * @param pager
     * @return
     * @throws IOException
     */
    @Override
    public List<Video> searchVideosLimit(Pager pager) throws IOException {
        return handleVideoList(mapper.searchVideosLimit(pager));
    }

    /**
     * 视频观看、点赞、收藏自增
     * @param map
     */
    @Override
    public void videoAddSelf(Map map) {
        mapper.videoAddSelf(map);
    }

    /**
     * 视频观看、点赞、收藏自减
     * @param map
     */
    @Override
    public void videoReduceSelf(Map map) {
        mapper.videoReduceSelf(map);
    }

    @Override
    public List<Video> selectVideosInVkeys(List<String> list) throws IOException {
        return handleVideoList(mapper.selectVideosInVkeys(list));
    }

    /**
     * 对视频信息的视频播放路和图片路径径进行处理
     * @param video
     * @return
     */
    public Video handleVideo(Video video) throws Exception{
        video.setImgName(imageRoot + video.getImgName());
        video.setVideoName(videoRoot+video.getVideoName());
        return video;
    }
    
    /**
     * 对视频信息list进行图片路径处理和视频vkey加密
     * @param list
     * @return
     */
    public List<Video> handleVideoList(List<Video> list) throws IOException {
        for(int i=0;i<list.size();i++){
            list.get(i).setImgName(imageRoot + list.get(i).getImgName());//设置图片路径
            list.get(i).setVkey(EncodeUtil.encodeString(list.get(i).getVkey()));//加密视频vkey
        }
        return list;
    }
}
