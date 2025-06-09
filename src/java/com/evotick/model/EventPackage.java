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
public class EventPackage implements Serializable {

  private UUID id;

  private String name;

  private double price;

  private int quota;

  private String detail;

  private Event event;

  public EventPackage() {
  }

  public UUID getId() {
    return id;
  }

  public void setId(UUID id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }

  public int getQuota() {
    return quota;
  }

  public void setQuota(int quota) {
    this.quota = quota;
  }

  public String getDetail() {
    return detail;
  }

  public void setDetail(String detail) {
    this.detail = detail;
  }

  public Event getEvent() {
    return event;
  }

  public void setEvent(Event event) {
    this.event = event;
  }

  @Override
  public String toString() {
    return "EventPackage{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", price=" + price +
            ", quota=" + quota +
            ", detail='" + detail + '\'' +
            ", event=" + (event != null ? event.getId() : "null") +
            '}';
  }
}
