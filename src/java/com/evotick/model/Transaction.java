/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.UUID;

/**
 *
 * @author Pandu
 */
public class Transaction implements Serializable {

  private UUID id;

  private Event event;

  private User user;

  private Timestamp purchased_at;

  private int amount;

  private TransactionStatus status;

  private EventPackage eventPackage;

  private Ticket ticket;

  public Transaction() {
  }

  public UUID getId() {
    return id;
  }

  public void setId(UUID id) {
    this.id = id;
  }

  public Event getEvent() {
    return event;
  }

  public void setEvent(Event event) {
    this.event = event;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public Timestamp getPurchased_at() {
    return purchased_at;
  }

  public void setPurchased_at(Timestamp purchased_at) {
    this.purchased_at = purchased_at;
  }

  public int getAmount() {
    return amount;
  }

  public void setAmount(int amount) {
    this.amount = amount;
  }

  public TransactionStatus getStatus() {
    return status;
  }

  public void setStatus(TransactionStatus status) {
    this.status = status;
  }

  public EventPackage getEventPackage() {
    return eventPackage;
  }

  public void setEventPackage(EventPackage eventPackage) {
    this.eventPackage = eventPackage;
  }

  public Ticket getTicket() {
    return ticket;
  }

  public void setTicket(Ticket ticket) {
    this.ticket = ticket;
  }

  @Override
  public String toString() {
    return "Transaction{" +
            "id=" + id +
            ", event=" + event +
            ", user=" + user +
            ", purchased_at=" + purchased_at +
            ", amount=" + amount +
            ", status=" + status +
            ", eventPackage=" + eventPackage +
            ", ticket=" + ticket +
            '}';
  }
}
