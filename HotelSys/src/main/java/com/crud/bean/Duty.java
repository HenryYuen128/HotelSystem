package com.crud.bean;

import java.util.Date;

public class Duty {
    private Integer id;

    private String realname;

    private Date ondutytime;

    private Date offdutytime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public Date getOndutytime() {
        return ondutytime;
    }

    public void setOndutytime(Date ondutytime) {
        this.ondutytime = ondutytime;
    }

    public Date getOffdutytime() {
        return offdutytime;
    }

    public void setOffdutytime(Date offdutytime) {
        this.offdutytime = offdutytime;
    }
}