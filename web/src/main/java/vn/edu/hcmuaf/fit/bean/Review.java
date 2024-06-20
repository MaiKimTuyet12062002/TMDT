package vn.edu.hcmuaf.fit.bean;

import java.sql.Timestamp;
import java.util.Date;

public class Review {
    private int accountID;
    private int productID;
    private String contentReview;
    private Timestamp dateReview;

    private String nameID;

    public Review(int accountID, String contentReview, Timestamp dateReview, String nameID, int score) {
        this.accountID = accountID;
        this.contentReview = contentReview;
        this.dateReview = dateReview;
        this.nameID = nameID;
    }

    public Review(int accountID, int productID, String contentReview, Timestamp dateReview, String nameID) {
        this.accountID = accountID;
        this.productID = productID;
        this.contentReview = contentReview;
        this.dateReview = dateReview;
        this.nameID = nameID;
    }

    public Review() {

    }

    @Override
    public String toString() {
        return "Review{" +
                "accountID=" + accountID +
                ", productID=" + productID +
                ", contentReview='" + contentReview + '\'' +
                ", dateReview=" + dateReview +
                ", nameID='" + nameID + '\'' +
                '}';
    }

    //    public int c {
//        return accountID;
//    }
    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }
    public int getProductID() {
        return productID;
    }
    public void setProductID(int productID) {
        this.productID = productID;
    }
    public String getContentReview() {
        return contentReview;
    }
    public void setContentReview(String contentReview) {
        this.contentReview = contentReview;
    }

    public Timestamp getDateReview() {
        return dateReview;
    }

    public void setDateReview(Timestamp dateReview) {
        this.dateReview = dateReview;
    }

    public int getAccountID() {
        return accountID;
    }

    public String getNameID() {
        return nameID;
    }

    public void setNameID(String nameID) {
        this.nameID = nameID;
    }

}
