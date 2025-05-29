/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.helper;

import java.security.SecureRandom;

/**
 *
 * @author Pandu
 */
public class NonceGenerator {
  public static String generateNonce(Integer lengthBytes) {
    // Initialize SecureRandom, which is cryptographically strong
    SecureRandom secureRandom = new SecureRandom();

    // Determine the length in bytes, defaulting to 16 if not provided
    int len = (lengthBytes != null) ? lengthBytes : 16;

    // Generate random bytes
    byte[] randomBytes = new byte[len];
    secureRandom.nextBytes(randomBytes); // Fills the byte array with random bytes

    // Convert the byte array to a hexadecimal string
    StringBuilder hexString = new StringBuilder(2 * randomBytes.length);
    for (byte b : randomBytes) {
      // Convert byte to hexadecimal.
      // (b & 0xFF) ensures the byte is treated as an unsigned value.
      // Integer.toHexString ensures a 2-digit hex representation (e.g., 0A instead of A).
      hexString.append(String.format("%02x", b & 0xff));
    }

    return hexString.toString();
  }
}
