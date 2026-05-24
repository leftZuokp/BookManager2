package com.peng.bms.model;

public class Notice {
    private Integer noticeid;
    private String noticetitle;
    private String noticecontent;
    private String noticetime;
    private String authorname;

    public Integer getNoticeid() { return noticeid; }
    public void setNoticeid(Integer noticeid) { this.noticeid = noticeid; }
    public String getNoticetitle() { return noticetitle; }
    public void setNoticetitle(String noticetitle) { this.noticetitle = noticetitle; }
    public String getNoticecontent() { return noticecontent; }
    public void setNoticecontent(String noticecontent) { this.noticecontent = noticecontent; }
    public String getNoticetime() { return noticetime; }
    public void setNoticetime(String noticetime) { this.noticetime = noticetime; }
    public String getAuthorname() { return authorname; }
    public void setAuthorname(String authorname) { this.authorname = authorname; }
}
