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
public class Ticket implements Serializable {

  private UUID id;

  private Transaction transaction;

  private String unique_code;

  public Ticket() {
  }

  public UUID getId() {
    return id;
  }

  public void setId(UUID id) {
    this.id = id;
  }

  public Transaction getTransaction() {
    return transaction;
  }

  public void setTransaction(Transaction transaction) {
    this.transaction = transaction;
  }

  public String getUnique_code() {
    return unique_code;
  }

  public void setUnique_code(String unique_code) {
    this.unique_code = unique_code;
  }

}
