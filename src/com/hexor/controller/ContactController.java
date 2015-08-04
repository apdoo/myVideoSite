package com.hexor.controller;

import com.hexor.repo.Contact;
import com.hexor.service.IContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-30
 * Time: 16:20
 * 留言板控制器
 */
@Controller
@RequestMapping(value="contact")
public class ContactController extends BaseController{

    @Autowired
    @Qualifier("com.hexor.service.impl.ContactService")
    private IContactService contactService;
    public void setContactService(IContactService contactService) {
        this.contactService = contactService;
    }

    /**
     * 提交留言
     * @param contact
     * @param session
     * @param request
     */
    @RequestMapping(value="submitContact")
    public void submitContact(Contact contact,HttpSession session,HttpServletRequest request){

    }

}
