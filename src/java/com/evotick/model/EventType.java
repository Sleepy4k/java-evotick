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
public class EventType implements Serializable {

  private UUID id;

  private String title;

  private String guest;

  private Timestamp duration;

  private String rules;

  private String venue;

  public EventType() {
  }

  public UUID getId() {
    return id;
  }

  public void setId(UUID id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getGuest() {
    return guest;
  }

  public void setGuest(String guest) {
    this.guest = guest;
  }

  public Timestamp getDuration() {
    return duration;
  }

  public void setDuration(Timestamp duration) {
    this.duration = duration;
  }

  public String getRules() {
    return rules;
  }

  public void setRules(String rules) {
    this.rules = rules;
  }

  public String getVenue() {
    return venue;
  }

  public void setVenue(String venue) {
    this.venue = venue;
  }

}
