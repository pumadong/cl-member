package com.cl.member.model.member;

import java.math.BigDecimal;
import java.util.Date;

public class MemberScoreIO {
    private Integer id;

    private Integer memberId;

    private String formCode;

    private Byte scoreTypeId;

    private BigDecimal operateScore;

    private BigDecimal beforeScore;

    private BigDecimal afterScore;

    private String remark;

    private String createPerson;

    private Date createDate;

    private String createIp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public String getFormCode() {
        return formCode;
    }

    public void setFormCode(String formCode) {
        this.formCode = formCode;
    }

    public Byte getScoreTypeId() {
        return scoreTypeId;
    }

    public void setScoreTypeId(Byte scoreTypeId) {
        this.scoreTypeId = scoreTypeId;
    }

    public BigDecimal getOperateScore() {
        return operateScore;
    }

    public void setOperateScore(BigDecimal operateScore) {
        this.operateScore = operateScore;
    }

    public BigDecimal getBeforeScore() {
        return beforeScore;
    }

    public void setBeforeScore(BigDecimal beforeScore) {
        this.beforeScore = beforeScore;
    }

    public BigDecimal getAfterScore() {
        return afterScore;
    }

    public void setAfterScore(BigDecimal afterScore) {
        this.afterScore = afterScore;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCreatePerson() {
        return createPerson;
    }

    public void setCreatePerson(String createPerson) {
        this.createPerson = createPerson;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreateIp() {
        return createIp;
    }

    public void setCreateIp(String createIp) {
        this.createIp = createIp;
    }
}