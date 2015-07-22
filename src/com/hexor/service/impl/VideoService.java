package com.hexor.service.impl;

import com.hexor.dao.IVideoMapper;
import com.hexor.repo.Video;
import com.hexor.service.IVideoService;
import com.hexor.util.Configurer;
import com.hexor.util.EncodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

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
    public List<Video> selectRecently() throws IOException {
        List<Video> list= mapper.selectRecently();
        for(int i=0;i<list.size();i++){
            list.get(i).setImgName(imageRoot + list.get(i).getImgName());//设置图片路径
            list.get(i).setVkey(EncodeUtil.encodeString(list.get(i).getVkey()));//加密视频vkey
        }
        return list;
    }
}
