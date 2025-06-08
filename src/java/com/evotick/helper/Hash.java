/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.helper;

import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Pandu
 */
public class Hash {

  public static String hashPassword(String password) {
    int logRounds = 12;
    String salt = BCrypt.gensalt(logRounds);

    return BCrypt.hashpw(password, salt);
  }

  public static boolean verify(String password, String hash) {
    if (password.isEmpty() || hash.isEmpty()) return false;
    
    String hashed = hashPassword(password);

    return hash.equals(hashed);
  }
}
