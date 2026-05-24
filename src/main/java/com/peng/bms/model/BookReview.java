package com.peng.bms.model;

public class BookReview {
    private Integer reviewid;
    private Integer bookid;
    private Integer userid;
    private String username;
    private String bookname;
    private Integer rating;
    private String content;
    private String reviewtime;

    public Integer getReviewid() { return reviewid; }
    public void setReviewid(Integer reviewid) { this.reviewid = reviewid; }
    public Integer getBookid() { return bookid; }
    public void setBookid(Integer bookid) { this.bookid = bookid; }
    public Integer getUserid() { return userid; }
    public void setUserid(Integer userid) { this.userid = userid; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getBookname() { return bookname; }
    public void setBookname(String bookname) { this.bookname = bookname; }
    public Integer getRating() { return rating; }
    public void setRating(Integer rating) { this.rating = rating; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public String getReviewtime() { return reviewtime; }
    public void setReviewtime(String reviewtime) { this.reviewtime = reviewtime; }
}
