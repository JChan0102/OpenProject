package com.openproject;

public class memberVO {
    private String userId;
    private String userPwd;
    private String userName;
    private String userPhoto;

    public memberVO(String userId, String userPwd, String userName, String userPhoto){
     this.userId=userId;
     this.userPwd=userPwd;
     this.userName=userName;
     this.userPhoto=userPhoto;
    }


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhoto() {
        return userPhoto;
    }

    public void setUserPhoto(String userPhoto) {
        this.userPhoto = userPhoto;
    }
}
