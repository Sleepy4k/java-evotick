/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.helper;

import com.evotick.config.DatabaseConfig;
import com.mysql.cj.jdbc.Driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pandu
 */
public class DatabaseManager {

  private static Connection connection;

  public static Connection getConnection() {
    if (connection == null) {
      try {
        Driver driver = new Driver();
        DriverManager.registerDriver(driver);

        String url = String.format("jdbc:mysql://%s:%d/%s",
          DatabaseConfig.DB_HOST, DatabaseConfig.DB_PORT, DatabaseConfig.DB_NAME);

        connection = DriverManager.getConnection(url, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASS);
      } catch (SQLException ex) {
        Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
      }
    }

    return connection;
  }

  public static void closeConnection() {
    if (connection != null) {
      try {
        connection.close();
      } catch (SQLException ex) {
        Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
      }
    }
  }
}
