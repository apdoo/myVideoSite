package com.hexor.repo;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-09-14
 * Time: 19:35
 * 邀请码表
 */
public class ICode {
    private int id;
    private String card;//卡号
    private String code;//卡密代码
    private String type;//卡密代码


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
