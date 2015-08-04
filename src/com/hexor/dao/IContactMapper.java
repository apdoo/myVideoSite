package com.hexor.dao;

import com.hexor.repo.Contact;
import org.springframework.stereotype.Service;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-30
 * Time: 16:00
 */
@Service("com.hexor.dao.IContactMapper")
public interface IContactMapper {
    public void insertContact(Contact contact);
}
