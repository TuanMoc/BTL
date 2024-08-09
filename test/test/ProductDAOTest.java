/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dal.ProductDAO;
import model.Product;
import java.util.List;

public class ProductDAOTest {
    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        List<Product> productList = productDAO.getAll();

        System.out.println("List of Products:");
        for (Product product : productList) {
            System.out.println("ID: " + product.getId());
            System.out.println("Name: " + product.getName());
            System.out.println("Price: " + product.getPrice());
            System.out.println("Description: " + product.getDescribe());
            System.out.println("Image: " + product.getImage());
            System.out.println("Category ID: " + product.getCid());
            System.out.println("------------------------------------");
        }
    }
}
