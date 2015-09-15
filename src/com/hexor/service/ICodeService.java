package com.hexor.service;

import com.hexor.repo.Contact;
import com.hexor.repo.ICode;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-30
 * Time: 16:03
 */
public interface ICodeService {
    /**
     * 插入一条邀请码信息
     * @param code
     */
    public void insertICode(String code);

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
