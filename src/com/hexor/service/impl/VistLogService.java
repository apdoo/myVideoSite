package com.hexor.service.impl;

import com.hexor.dao.IVistLogMapper;
import com.hexor.repo.Pager;
import com.hexor.repo.VistLogBean;
import com.hexor.service.IVistLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Dong
 * Date: 14-9-11
 * Time: 下午3:33
 * To change this template use File | Settings | File Templates.
 */
@Service("com.hexor.service.impl.VistLogService")
public class VistLogService implements IVistLogService {

    @Autowired
    @Qualifier("com.hexor.dao.IVistLogMapper")
    private IVistLogMapper mapper;
    public void setMapper(IVistLogMapper delegate) {
        this.mapper = delegate;
    }
    @Override
    public List<VistLogBean> getAllVistLog() {
        return mapper.getAllVistLog();  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void insertVistLog(VistLogBean bean) {
        //To change body of implemented methods use File | Settings | File Templates.
        mapper.insertVistLog(bean);
    }

    @Override
    public long getVistLogsCount() {
        return mapper.getVistLogsCount();  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<VistLogBean> limit(Pager pager) {
        return mapper.limit(pager);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public long getIpVistCounts(String ip) {
        return mapper.getIpVistCounts(ip);
    }

    @Override
    public void deleteAll() {
        mapper.deleteAll();
    }


    /**
     * 获得今日访问页面的ip记录的条数
     * @param ip
     * @param date
     */
    @Override
    public long getTodayIpVistCount(String  ip,String date) {
        Map map=new HashMap();
        map.put("ip",ip);
        map.put("date", date);
        return mapper.getTodayIpVistCount(map);
    }
    /**
     * 用户访问记录
     * @param username
     * @return
     */
    @Override
    public List<VistLogBean> selectByUserUserName(String username) {
        return mapper.selectByUserUserName(username);
    }


}
