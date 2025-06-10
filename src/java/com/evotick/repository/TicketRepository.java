/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.repository;

import com.evotick.model.Event;
import com.evotick.model.EventPackage;
import com.evotick.model.Ticket;
import com.evotick.model.Transaction;
import com.evotick.model.TransactionStatus;
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
public class TicketRepository extends BaseRepository<Ticket> {

    private final String TABLE_NAME = "tickets";
    private final String INSERT_SQL = "insert into tickets (ticket_id, transaction_id, unique_code) values (?, ?, ?)";
    private final String UPDATE_SQL = "update tickets set transaction_id = ?, unique_code = ? where ticket_id = ?";
    private final String DELETE_SQL = "delete from tickets where ticket_id = ?";
    private final String SELECT_ALL_SQL = "select tickets.ticket_id, tickets.transaction_id, tickets.unique_code, "
            + "transactions.transaction_id as transaction_transaction_id, transactions.event_id as transaction_event_id, transactions.user_id as transaction_user_id, "
            + "transactions.purchased_at as transaction_purchased_at, transactions.amount as transaction_amount, transactions.status_id as transaction_status_id, transactions.package_id as transaction_package_id, "
            + "users.user_id as user_user_id, users.username as user_username, users.full_name as user_full_name, users.email as user_email "
            + "from tickets "
            + "join transactions on tickets.transaction_id = transactions.transaction_id "
            + "join users on transactions.user_id = users.user_id limit ?, ?";
    private final String COUNT_SQL = "select count(ticket_id) as total from tickets";
    private final String SELECT_ONE_SQL = "select tickets.ticket_id, tickets.transaction_id, tickets.unique_code, "
            + "transactions.transaction_id as transaction_transaction_id, transactions.event_id as transaction_event_id, transactions.user_id as transaction_user_id, "
            + "transactions.purchased_at as transaction_purchased_at, transactions.amount as transaction_amount, transactions.status_id as transaction_status_id, transactions.package_id as transaction_package_id, "
            + "users.user_id as user_user_id, users.username as user_username, users.full_name as user_full_name, users.email as user_email "
            + "from tickets "
            + "join transactions on tickets.transaction_id = transactions.transaction_id "
            + "join users on transactions.user_id = users.user_id where ticket_id = ?";
    private final String SELECT_ONE_CUSTOM_SQL = "select tickets.ticket_id, tickets.transaction_id, tickets.unique_code, "
            + "transactions.transaction_id as transaction_transaction_id, transactions.event_id as transaction_event_id, transactions.user_id as transaction_user_id, "
            + "transactions.purchased_at as transaction_purchased_at, transactions.amount as transaction_amount, transactions.status_id as transaction_status_id, transactions.package_id as transaction_package_id, "
            + "users.user_id as user_user_id, users.username as user_username, users.full_name as user_full_name, users.email as user_email "
            + "from tickets "
            + "join transactions on tickets.transaction_id = transactions.transaction_id "
            + "join users on transactions.user_id = users.user_id where $1 = ?";

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
    protected void setInsertStatementParams(PreparedStatement statement, Ticket ticket) throws SQLException {
        statement.setString(1, ticket.getId() != null ? ticket.getId().toString() : UUID.randomUUID().toString());
        statement.setString(2, ticket.getTransaction() != null ? ticket.getTransaction().getId().toString() : null);
        statement.setString(3, ticket.getUnique_code());
    }

    @Override
    protected void setUpdateStatementParams(PreparedStatement statement, Ticket ticket) throws SQLException {
        statement.setString(1, ticket.getTransaction() != null ? ticket.getTransaction().getId().toString() : null);
        statement.setString(2, ticket.getUnique_code());
        statement.setString(3, ticket.getId().toString());
    }

    @Override
    protected Ticket mapResultSetToModel(ResultSet resultSet) throws SQLException {
        Ticket ticket = new Ticket();
        ticket.setId(UUID.fromString(resultSet.getString("ticket_id")));

        if (resultSet.getObject("transaction_transaction_id") != null) {
            Transaction transaction = new Transaction();
            transaction.setId(UUID.fromString(resultSet.getString("transaction_transaction_id")));

            Event event = new Event();
            event.setId(UUID.fromString(resultSet.getString("transaction_event_id")));
            transaction.setEvent(event);

            User user = new User();
            user.setId(UUID.fromString(resultSet.getString("transaction_user_id")));
            transaction.setUser(user);

            transaction.setPurchased_at(resultSet.getTimestamp("transaction_purchased_at"));
            transaction.setAmount(resultSet.getInt("transaction_amount"));

            TransactionStatus status = new TransactionStatus();
            status.setId(UUID.fromString(resultSet.getString("transaction_status_id")));
            transaction.setStatus(status);

            EventPackage eventPackage = new EventPackage();
            eventPackage.setId(UUID.fromString(resultSet.getString("transaction_package_id")));
            transaction.setStatus(status);

            ticket.setTransaction(transaction);
        }

        ticket.setUnique_code(resultSet.getString("unique_code"));

        return ticket;
    }

    public List<Ticket> getUserTicket(Connection db, String key, String value) {
        List<Ticket> models = new ArrayList<>();
        String sql = "select tickets.ticket_id, tickets.transaction_id, tickets.unique_code, "
                + "transactions.transaction_id as transaction_transaction_id, transactions.event_id as transaction_event_id, transactions.user_id as transaction_user_id, "
                + "transactions.purchased_at as transaction_purchased_at, transactions.amount as transaction_amount, transactions.status_id as transaction_status_id, transactions.package_id as transaction_package_id, "
                + "users.user_id as user_user_id, users.username as user_username, users.full_name as user_full_name, users.email as user_email "
                + "from tickets "
                + "join transactions on tickets.transaction_id = transactions.transaction_id "
                + "join users on transactions.user_id = users.user_id where " + key + " = ?";

        try (PreparedStatement statement = db.prepareStatement(sql)) {
            statement.setObject(1, value);
            System.out.println(statement.toString());
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Ticket ticket = mapResultSetToModel(resultSet);
                    models.add(ticket);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(TicketRepository.class.getName()).log(Level.SEVERE, null, ex);
        }
        return models;
    }
}
