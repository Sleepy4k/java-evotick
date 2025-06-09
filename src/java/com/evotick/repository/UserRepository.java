/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.repository;

import com.evotick.model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

/**
 *
 * @author Pandu
 */
public class UserRepository extends BaseRepository<User> {

  private final String TABLE_NAME = "users";
  private final String INSERT_SQL = "insert into users (user_id, username, full_name, email, password, phone, address) values (?, ?, ?, ?, ?, ?, ?);";
  private final String UPDATE_SQL = "update users set username = ?, full_name = ?, email = ?, password = ?, phone = ?, address = ? where user_id = ?;";
  private final String DELETE_SQL = "delete from users where user_id = ?;";
  private final String SELECT_ALL_SQL = "select user_id, username, full_name, email, password, phone, address from users limit ?, ?";
  private final String COUNT_SQL = "select count(user_id) as total from users";
  private final String SELECT_ONE_SQL = "select user_id, username, full_name, email, password, phone, address from users where user_id = ?;";
  private final String SELECT_ONE_CUSTOM_SQL = "select user_id, username, full_name, email, password, phone, address from users where $1 = ?;";

  @Override
  protected String getTableName() {
    return TABLE_NAME;
  }

  @Override
  protected String getInsertSql() {
    return INSERT_SQL;
  }

  @Override
  protected String getUpdateSql() {
    return UPDATE_SQL;
  }

  @Override
  protected String getDeleteSql() {
    return DELETE_SQL;
  }

  @Override
  protected String getSelectAllSql() {
    return SELECT_ALL_SQL;
  }

  @Override
  protected String getCountSql() {
    return COUNT_SQL;
  }

  @Override
  protected String getSelectOneSql() {
    return SELECT_ONE_SQL;
  }

  @Override
  protected String getSelectOneCustomSql() {
    return SELECT_ONE_CUSTOM_SQL;
  }

  @Override
  protected void setInsertStatementParams(PreparedStatement statement, User user) throws SQLException {
    statement.setString(1, user.getId().toString());
    statement.setString(2, user.getUsername());
    statement.setString(3, user.getFull_name());
    statement.setString(4, user.getEmail());
    statement.setString(5, user.getPassword());
    statement.setString(6, user.getPhone());
    statement.setString(7, user.getAddress());
  }

  @Override
  protected void setUpdateStatementParams(PreparedStatement statement, User user) throws SQLException {
    statement.setString(1, user.getUsername());
    statement.setString(2, user.getFull_name());
    statement.setString(3, user.getEmail());
    statement.setString(4, user.getPassword());
    statement.setString(5, user.getPhone());
    statement.setString(6, user.getAddress());
    statement.setString(7, user.getId().toString());
  }

  @Override
  protected User mapResultSetToModel(ResultSet resultSet) throws SQLException {
    User user = new User();
    user.setId(UUID.fromString(resultSet.getString("user_id")));
    user.setUsername(resultSet.getString("username"));
    user.setFull_name(resultSet.getString("full_name"));
    user.setEmail(resultSet.getString("email"));
    user.setPassword(resultSet.getString("password"));
    user.setPhone(resultSet.getString("phone"));
    user.setAddress(resultSet.getString("address"));
    user.setIs_admin(false);
    return user;
  }
}
