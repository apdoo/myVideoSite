package com.hexor.util;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-19
 * Time: 15:18
 */
public class MyStringUtil {
    /**
     *字符在字符串中出现的次数
     *
     *@paramstring
     *@parama
     *@return
     */
    public static int occurTimes(String string,String a){
        int pos=-2;
        int n=0;
        while(pos!=-1){
            if(pos==-2){
                pos=-1;
                }
            pos=string.indexOf(a,pos+1);
            if(pos!=-1){
                n++;
                }
            }
        return n;
    }

    public static void main(String[] args) {
        System.out.println( MyStringUtil.occurTimes(",3,4,5",","));
        System.out.println( MyStringUtil.occurTimes(",3",","));
        System.out.println( MyStringUtil.occurTimes(",3,4",","));
        System.out.println( MyStringUtil.occurTimes(",3,4,5,6,7",","));
    }
}
