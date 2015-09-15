package com.hexor.util;

import java.util.HashSet;
import java.util.Random;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-09-14
 * Time: 20:35
 * 邀请码生成工具类
 */
public class CodeUtil {
    private static String codeChars = "0123456789abcdefghkmnpqrstuvwxyzABCDEFGHKLMNPQRSTUVWXYZ";

    /**
     * 获得邀请码组成的set集合
     * @param number 生成邀请码的数量
     * @param length 生成邀请码的长度
     * @return
     */
    public static Set getCodes(int number,int length){
        Random random = new Random();
        int charsLength=codeChars.length();
        Set<String> set = new HashSet<String>();//set 保证不会重复插入
        Random rand = new Random();
        for(int i=0;i<number;i++){
            StringBuilder validationCode = new StringBuilder();
            for (int j = 0; j < length; j++) {
                char codeChar = codeChars.charAt(random.nextInt(charsLength));
                validationCode.append(codeChar);
            }
            set.add(validationCode.toString());
        }
        return set;
    }

    public static void main(String[] args) {
        Set<String> set=getCodes(10,6);
        for (String str : set) {
            //生成插入邀请码的sql
            System.out.println(str);
        }
    }
}
