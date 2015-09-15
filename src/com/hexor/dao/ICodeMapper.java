package com.hexor.dao;

import com.hexor.repo.ICode;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-30
 * Time: 16:00
 */
@Service("com.hexor.dao.ICodeMapper")
public interface ICodeMapper {
    /**
     * 插入一条邀请码信息
     * @param iCode
     */
    public void insertICode(ICode iCode);

    /**
     * 查询所有的邀请码信息
     * @return
     */
    public List<ICode> selectAll();
    /**
     * 检查邀请码
     */
    public ICode checkICode(String code);

    /***
     * 移除邀请码
     * @param code
     * @return
     */
    public int removeICode(String code);
}
