package com.hexor.repo;

import com.hexor.util.DateUtil;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-14
 * Time: 16:39
 * 用户账户收支信息
 * 记录用户新增收支与扣除收支
 */
public class UserBalance {
    private int id;//id号
    private int userId;//会员id
    private String type;//收支类型
    private int amount;//收支数额
    private String description;//收支描述
    private String time= DateUtil.getStrOfDateTime();//收支发生的时间

    public UserBalance() {
    }
    public UserBalance(int userId, String type, int amount, String descriptionion,String time) {
        this.userId = userId;
        this.type = type;
        this.amount = amount;
        this.description = descriptionion;
        this.time=time;
    }


    public UserBalance(int userId, String type, int amount, String descriptionion) {
        this.userId = userId;
        this.type = type;
        this.amount = amount;
        this.description = descriptionion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }



    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
