/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.repository;

import com.evotick.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pandu
 */
public class UserRepository {

  public UserRepository() {
  }

  private final String INSERT_SQL = "insert into users (user_id, username, full_name, email, password, phone, address) values (?, ?, ?, ?, ?, ?, ?);";
  private final String UPDATE_SQL = "update users set username = ?, full_name = ?, email = ?, password = ?, phone = ?, address = ? where user_id = ?;";
  private final String DELETE_SQL = "delete from users where user_id = ?;";
  private final String SELECT_SQL = "select user_id, username, full_name, email, password, phone, address from users limit ?, ?";
  private final String COUNT_SQL = "select count(user_id) as total from users";
  private final String SELECT_ONE_SQL = "select user_id, username, full_name, email, password, phone, address from users where user_id = ?;";
  private final String SELECT_ONE_CUSTOM_SQL = "select user_id, username, full_name, email, password, phone, address from users where $1 = ?;";

  public void insert(Connection db, User user) {
    try (PreparedStatement statement = db.prepareStatement(INSERT_SQL)) {

      statement.setString(1, user.getId().toString());
      statement.setString(2, user.getUsername());
      statement.setString(3, user.getFull_name());
      statement.setString(4, user.getEmail());
      statement.setString(5, user.getPassword());
      statement.setString(6, user.getPhone());
      statement.setString(7, user.getAddress());

      statement.executeUpdate();
    } catch (SQLException ex) {
      Logger.getLogger(UserRepository.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  public void update(Connection db, User user) {
    try (PreparedStatement statement = db.prepareStatement(UPDATE_SQL)) {

      statement.setString(1, user.getUsername());
      statement.setString(2, user.getFull_name());
      statement.setString(3, user.getEmail());
      statement.setString(4, user.getPassword());
      statement.setString(5, user.getPhone());
      statement.setString(6, user.getAddress());
      statement.setString(7, user.getId().toString());

      statement.executeUpdate();
    } catch (SQLException ex) {
      Logger.getLogger(UserRepository.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  public void delete(Connection db, User user) {
    try (PreparedStatement statement = db.prepareStatement(DELETE_SQL)) {

      statement.setString(1, user.getId().toString());

      statement.executeUpdate();
    } catch (SQLException ex) {
      Logger.getLogger(UserRepository.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  public List<User> select(Connection db, int skip, int max) {
    ArrayList<User> list = new ArrayList<>(max);
    try (PreparedStatement statement = db.prepareStatement(SELECT_SQL);) {

      statement.setInt(1, skip);
      statement.setInt(2, max);

      try (ResultSet resultSet = statement.executeQuery()) {
        while (resultSet.next()) {
          User user = new User();
          user.setId(UUID.fromString(resultSet.getString("user_id")));
          user.setUsername(resultSet.getString("username"));
          user.setFull_name(resultSet.getString("full_name"));
          user.setEmail(resultSet.getString("email"));
          user.setPassword(resultSet.getString("password"));
          user.setPhone(resultSet.getString("phone"));
          user.setAddress(resultSet.getString("address"));
          user.setIs_admin(false);
          list.add(user);
        }
      }
    } catch (SQLException ex) {
      Logger.getLogger(UserRepository.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
      return list;
    }
  }

  public Long count(Connection db) {
    Long total = 0L;
    try (PreparedStatement statement = db.prepareStatement(COUNT_SQL); ResultSet resultSet = statement.executeQuery()) {

      if (resultSet.next()) {
        total = resultSet.getLong("total");
      }
    } catch (SQLException ex) {
      Logger.getLogger(UserRepository.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
      return total;
    }
  }

  public User find(Connection db, UUID uuid) {
    User user = null;
    try (PreparedStatement statement = db.prepareStatement(SELECT_ONE_SQL);) {

      statement.setString(1, uuid.toString());

      try (ResultSet resultSet = statement.executeQuery()) {
        if (resultSet.next()) {
          user = new User();
          user.setId(UUID.fromString(resultSet.getString("user_id")));
          user.setUsername(resultSet.getString("username"));
          user.setFull_name(resultSet.getString("full_name"));
          user.setEmail(resultSet.getString("email"));
          user.setPassword(resultSet.getString("password"));
          user.setPhone(resultSet.getString("phone"));
          user.setAddress(resultSet.getString("address"));
          user.setIs_admin(false);
        }
      }
    } catch (SQLException ex) {
      Logger.getLogger(UserRepository.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
      return user;
    }
  }

  public User find(Connection db, String key, String value) {
    User user = null;
    String query = SELECT_ONE_CUSTOM_SQL.replace("$1", key);
    try (PreparedStatement statement = db.prepareStatement(query);) {

      statement.setString(1, value);

      try (ResultSet resultSet = statement.executeQuery()) {
        if (resultSet.next()) {
          user = new User();
          user.setId(UUID.fromString(resultSet.getString("user_id")));
          user.setUsername(resultSet.getString("username"));
          user.setFull_name(resultSet.getString("full_name"));
          user.setEmail(resultSet.getString("email"));
          user.setPassword(resultSet.getString("password"));
          user.setPhone(resultSet.getString("phone"));
          user.setAddress(resultSet.getString("address"));
          user.setIs_admin(false);
        }
      }
    } catch (SQLException ex) {
      Logger.getLogger(UserRepository.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
      return user;
    }
  }
}
