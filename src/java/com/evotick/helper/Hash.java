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
    String salt = BCrypt.gensalt(12);

    return BCrypt.hashpw(password, salt);
  }

  public static boolean verify(String password, String hash) {
    if (password.isEmpty() || hash.isEmpty()) return false;

    return BCrypt.checkpw(password, hash);
  }
}
