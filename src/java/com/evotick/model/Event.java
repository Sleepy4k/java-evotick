/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.UUID;

/**
 *
 * @author Pandu
 */
public class Event implements Serializable {

  private UUID id;

  private String name;

  private String description;

  private Timestamp start_date;

  private Timestamp end_date;

  private String location;

  private EventStatus status;

  private EventType type;

  private String penyelenggara;

  private String poster_url;

  private User created_by;

  private ArrayList<EventPackage> packages;

  public Event() {
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

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public Timestamp getStart_date() {
    return start_date;
  }

  public void setStart_date(Timestamp start_date) {
    this.start_date = start_date;
  }

  public Timestamp getEnd_date() {
    return end_date;
  }

  public void setEnd_date(Timestamp end_date) {
    this.end_date = end_date;
  }

  public String getLocation() {
    return location;
  }

  public void setLocation(String location) {
    this.location = location;
  }

  public EventStatus getStatus() {
    return status;
  }

  public void setStatus(EventStatus status) {
    this.status = status;
  }

  public EventType getType() {
    return type;
  }

  public void setType(EventType type) {
    this.type = type;
  }

  public String getPenyelenggara() {
    return penyelenggara;
  }

  public void setPenyelenggara(String penyelenggara) {
    this.penyelenggara = penyelenggara;
  }

  public String getPoster_url() {
    return poster_url;
  }

  public void setPoster_url(String poster_url) {
    this.poster_url = poster_url;
  }

  public User getCreated_by() {
    return created_by;
  }

  public void setCreated_by(User created_by) {
    this.created_by = created_by;
  }

  public ArrayList<EventPackage> getPackages() {
    return packages;
  }

  public void setPackages(ArrayList<EventPackage> packages) {
    this.packages = packages;
  }

  @Override
  public String toString() {
    return "Event{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", description='" + description + '\'' +
            ", start_date=" + start_date +
            ", end_date=" + end_date +
            ", location='" + location + '\'' +
            ", status=" + status +
            ", type=" + type +
            ", penyelenggara='" + penyelenggara + '\'' +
            ", poster_url='" + poster_url + '\'' +
            ", created_by=" + created_by +
            ", packages=" + packages +
            '}';
  }
}
