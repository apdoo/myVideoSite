package com.hexor.service.impl;

import com.hexor.dao.ICodeMapper;
import com.hexor.repo.ICode;
import com.hexor.service.ICodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-09-14
 * Time: 20:06
 */
@Service("com.hexor.service.impl.CodeService")
public class CodeService implements ICodeService{
    @Autowired
    @Qualifier("com.hexor.dao.ICodeMapper")
    private ICodeMapper mapper;
    public void setMapper(ICodeMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public void insertICode(String code) {
        ICode iCode=new ICode();
        iCode.setCode(code);
        iCode.setCard("card_" + code);
        iCode.setType("邀请码");
        mapper.insertICode(iCode);
    }

    @Override
    public List<ICode> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public ICode checkICode(String code) {
        return mapper.checkICode(code);
    }

    @Override
    public int removeICode(String code) {
        return mapper.removeICode(code);
    }
}
