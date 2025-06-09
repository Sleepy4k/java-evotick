/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.model;

import java.io.Serializable;
import java.util.UUID;

/**
 *
 * @author Pandu
 */
public class User implements Serializable {

  private UUID id;

  private String username;

  private String full_name;

  private String email;

  private String password;

  private String phone;

  private String address;

  private boolean is_admin;

  public User() {
  }

  public User(String username, String password) {
    this.id = UUID.randomUUID();
    this.username = username;
    this.password = password;
  }

  public User(String username, String full_name, String email, String password) {
    this.username = username;
    this.full_name = full_name;
    this.email = email;
    this.password = password;
  }

  public User(String username, String full_name, String email, String password, String phone, String address) {
    this.id = UUID.randomUUID();
    this.username = username;
    this.full_name = full_name;
    this.email = email;
    this.password = password;
    this.phone = phone;
    this.address = address;
  }

  public User(UUID id, String username, String full_name, String email, String password, String phone, String address) {
    this.id = id;
    this.username = username;
    this.full_name = full_name;
    this.email = email;
    this.password = password;
    this.phone = phone;
    this.address = address;
  }

  public UUID getId() {
    return id;
  }

  public void setId(UUID id) {
    this.id = id;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getFull_name() {
    return full_name;
  }

  public void setFull_name(String full_name) {
    this.full_name = full_name;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public boolean getIs_admin() {
    return is_admin;
  }

  public void setIs_admin(boolean is_admin) {
    this.is_admin = is_admin;
  }

  @Override
  public String toString() {
    return "User{"
      + "id=" + id
      + ", username='" + username + '\''
      + ", full_name='" + full_name + '\''
      + ", email='" + email + '\''
      + ", phone='" + phone + '\''
      + ", address='" + address + '\''
      + ", is_admin=" + is_admin
      + '}';
  }
}
