/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bazica;

import java.sql.Connection;
import java.sql.DriverManager;


public class DB {
    private static DB instance;
    private static Connection con;

    private DB() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshopDB?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "adis1");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static DB getInstance() {
        if (instance == null) {
            instance = new DB();
        }

        return instance;
    }

    public Connection getConnection() {
        return con;
    }
}