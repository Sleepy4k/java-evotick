/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.repository;

import com.evotick.model.TransactionStatus;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

/**
 *
 * @author Pandu
 */
public class TransactionStatusRepository extends BaseRepository<TransactionStatus> {

  private final String TABLE_NAME = "transaction_status";
  private final String INSERT_SQL = "insert into transaction_status (transaction_status_id, name) values (?, ?)";
  private final String UPDATE_SQL = "update transaction_status set name = ? where transaction_status_id = ?";
  private final String DELETE_SQL = "delete from transaction_status where transaction_status_id = ?";
  private final String SELECT_ALL_SQL = "select transaction_status.transaction_status_id, transaction_status.name from transaction_status limit ?, ?";
  private final String COUNT_SQL = "select count(transaction_status_id) as total from transaction_status";
  private final String SELECT_ONE_SQL = "select transaction_status.transaction_status_id, transaction_status.name from transaction_status where transaction_status_id = ?";
  private final String SELECT_ONE_CUSTOM_SQL = "select transaction_status.transaction_status_id, transaction_status.name from transaction_status where $1 = ?";

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
  protected void setInsertStatementParams(PreparedStatement statement, TransactionStatus transactionStatus) throws SQLException {
    statement.setObject(1, transactionStatus.getId() != null ? transactionStatus.getId() : UUID.randomUUID());
    statement.setString(2, transactionStatus.getName());
  }

  @Override
  protected void setUpdateStatementParams(PreparedStatement statement, TransactionStatus transactionStatus) throws SQLException {
    statement.setString(1, transactionStatus.getName());
    statement.setObject(2, transactionStatus.getId());
  }

  @Override
  protected TransactionStatus mapResultSetToModel(ResultSet resultSet) throws SQLException {
    TransactionStatus transactionStatus = new TransactionStatus();
    transactionStatus.setId(UUID.fromString(resultSet.getString("transaction_status_id")));
    transactionStatus.setName(resultSet.getString("name"));
    return transactionStatus;
  }
}
