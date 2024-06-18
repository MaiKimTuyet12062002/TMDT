package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.category;
import vn.edu.hcmuaf.fit.db.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CatalogService {
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;

    public static List<category> ListCategory() {
        List<category> list = new ArrayList<>();
        String query = "select * from category where HideCat = 0";
        try {
            conn = new connect().getconConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                category cat = new category(rs.getString(1),
                        rs.getString(2));
                list.add(cat);
            }
        } catch (Exception e) {
            System.out.println("fail");
        }
        return list;
    }
    public static void addCatalog(category cat) {
        String query = "INSERT INTO category (IdCat, NameCat, HideCat)\n" +
                "VALUES (?,?,?);";
        try {
            conn = new connect().getconConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cat.getIdCat());
            ps.setString(2, cat.getNameCat());
            ps.setInt(3, 0);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("fail");
        }
    }
    public String getName(String id) {
        String query = "SELECT namecat FROM category WHERE IdCat = ?";
        String categoryName = null; // Initialize with null

        try {
            conn = new connect().getconConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id); // Set the parameter value
            ResultSet rs = ps.executeQuery();

            // Check if result set has data
            if (rs.next()) {
                categoryName = rs.getString("namecat"); // Get category name from result set
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print stack trace for debugging
            System.out.println("fail");
            // Close resources in finally block

        }
        return categoryName; // Return category name
    }
    public static void updateCatalog(category cat) {
        String query = "update category set NameCat=? WHERE IdCat = ?";
        try {
            conn = new connect().getconConnection();
            ps = conn.prepareStatement(query);

            ps.setString(1, cat.getNameCat());
            ps.setString(2, cat.getIdCat());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("fail");
        }
    }
    public void removeCatalog(String cid) {
        String query = "UPDATE category\n" +
                "SET HideCat = 1\n" +
                "WHERE IdCat = ?";
        try {
            conn = new connect().getconConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("fail");
        }
    }
    public static void main(String[] args) {
        CatalogService cata = new CatalogService();
       System.out.println(cata.getName("BT"));

    }
}
