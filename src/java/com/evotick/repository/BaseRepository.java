/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.repository;

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
public abstract class BaseRepository<T> {

  protected abstract String getTableName();

  protected abstract String getInsertSql();

  protected abstract String getUpdateSql();

  protected abstract String getDeleteSql();

  protected abstract String getSelectAllSql();

  protected abstract String getCountSql();

  protected abstract String getSelectOneSql();

  protected abstract String getSelectOneCustomSql();

  protected abstract void setInsertStatementParams(PreparedStatement statement, T model) throws SQLException;

  protected abstract void setUpdateStatementParams(PreparedStatement statement, T model) throws SQLException;

  protected abstract T mapResultSetToModel(ResultSet resultSet) throws SQLException;

  public void insert(Connection db, T model) {
    try (PreparedStatement statement = db.prepareStatement(getInsertSql())) {
      setInsertStatementParams(statement, model);
      statement.executeUpdate();
    } catch (SQLException ex) {
      Logger.getLogger(BaseRepository.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  public void update(Connection db, T model) {
    try (PreparedStatement statement = db.prepareStatement(getUpdateSql())) {
      setUpdateStatementParams(statement, model);
      statement.executeUpdate();
    } catch (SQLException ex) {
      Logger.getLogger(BaseRepository.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  public void delete(Connection db, UUID id) {
    try (PreparedStatement statement = db.prepareStatement(getDeleteSql())) {
      statement.setString(1, id.toString());
      statement.executeUpdate();
    } catch (SQLException ex) {
      Logger.getLogger(BaseRepository.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  public List<T> select(Connection db, int skip, int max) {
    ArrayList<T> list = new ArrayList<>(max);
    try (PreparedStatement statement = db.prepareStatement(getSelectAllSql())) {
      statement.setInt(1, skip);
      statement.setInt(2, max);

      try (ResultSet resultSet = statement.executeQuery()) {
        while (resultSet.next()) {
          list.add(mapResultSetToModel(resultSet));
        }
      }
    } catch (SQLException ex) {
      Logger.getLogger(BaseRepository.class.getName()).log(Level.SEVERE, null, ex);
    }
    return list;
  }

  public Long count(Connection db) {
    Long total = 0L;
    try (PreparedStatement statement = db.prepareStatement(getCountSql()); ResultSet resultSet = statement.executeQuery()) {
      if (resultSet.next()) {
        total = resultSet.getLong("total");
      }
    } catch (SQLException ex) {
      Logger.getLogger(BaseRepository.class.getName()).log(Level.SEVERE, null, ex);
    }
    return total;
  }

  public T find(Connection db, UUID id) {
    T model = null;
    try (PreparedStatement statement = db.prepareStatement(getSelectOneSql())) {
      statement.setString(1, id.toString());
      try (ResultSet resultSet = statement.executeQuery()) {
        if (resultSet.next()) {
          model = mapResultSetToModel(resultSet);
        }
      }
    } catch (SQLException ex) {
      Logger.getLogger(BaseRepository.class.getName()).log(Level.SEVERE, null, ex);
    }
    return model;
  }

  public T find(Connection db, String key, String value) {
    T model = null;
    String query = getSelectOneCustomSql().replace("$1", key); // Placeholder for column name
    try (PreparedStatement statement = db.prepareStatement(query)) {
      statement.setString(1, value);
      try (ResultSet resultSet = statement.executeQuery()) {
        if (resultSet.next()) {
          model = mapResultSetToModel(resultSet);
        }
      }
    } catch (SQLException ex) {
      Logger.getLogger(BaseRepository.class.getName()).log(Level.SEVERE, null, ex);
    }
    return model;
  }
}
