package com.hexor.service.impl;

import com.hexor.dao.IContactMapper;
import com.hexor.repo.Contact;
import com.hexor.service.IContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-30
 * Time: 16:09
 */
@Service("com.hexor.service.impl.ContactService")
public class ContactService implements IContactService{
    @Autowired
    @Qualifier("com.hexor.dao.IContactMapper")
    private IContactMapper mapper;
    public void setMapper(IContactMapper delegate) {
        this.mapper = delegate;
    }
    @Override
    public void insertContact(Contact contact) {
        mapper.insertContact(contact);
    }
}
