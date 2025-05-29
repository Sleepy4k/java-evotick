/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.config;

/**
 *
 * @author Pandu
 */
public class DatabaseConfig {

  public static String DB_HOST = "";
  public static int DB_PORT = 3306;
  public static String DB_USER = "root";
  public static String DB_PASS = "";
  public static String DB_NAME = "evotick";

  @Override
  public String toString() {
    return String.format("DatabaseConfig [ %s %s %s %d %s ]", DB_USER, DB_PASS, DB_HOST, DB_PORT, DB_NAME);
  }
}
