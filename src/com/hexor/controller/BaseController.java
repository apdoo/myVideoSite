package com.hexor.controller;

import com.hexor.repo.Pager;
import com.hexor.util.PagerUtil;
import org.apache.log4j.Logger;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-24
 * Time: 9:40
 * 基础控制器
 */
public class BaseController {
    /**
     * 返回设置好的分页实例
     * @param wantPage 想要查找的页数
     * @param type limit的desc的字段
     * @param count 总数
     */
    public Pager pagerSet(String wantPage,String type,long count){
        Pager pager=null;
        if(wantPage==null) wantPage="1";//
        try{
            pager= PagerUtil.build(PagerUtil.SetPager(count, Integer.parseInt(wantPage.trim())));
        }catch(Exception e){
            pager=PagerUtil.build(PagerUtil.SetPager(count, 1));
        }finally {
            if(!type.equals("")) pager.setType(type);//如果有设置type
        }
        return pager;
    }

    /**
     * 返回设置好的分页实例
     * @param wantPage 想要查找的页数
     * @param count 总数
     */
    public Pager pagerSet(String wantPage,long count){
      return pagerSet(wantPage,"",count);
    }

    /**
     * String类型访问页数转换为int类型访问页数
     * @param wantPage 想要访问的页数
     * @param defaultPage 转换报错的时候，默认页数
     * @return
     */
    public int getIntPage(String wantPage,int defaultPage){
        int page=defaultPage;
        try{
            page=Integer.parseInt(wantPage.trim());
        }catch (Exception e){
            page=defaultPage;
        }
        return page;
    }

    /**
     * 转换目录的格式
     * @param categories
     * @param defaultCategories
     * @param maxCategories
     * @return
     */
    public int getIntCategories(String categories,int defaultCategories,int maxCategories){
        int result=1;
        try{
            result=Integer.parseInt(categories.trim());
            if(result>maxCategories){
                result=defaultCategories;
            }
        }catch (Exception e){
            result=1;
        }
        return result;
    }
}
