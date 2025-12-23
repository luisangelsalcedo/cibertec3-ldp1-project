package eparking.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;

import eparking.enums.ReservationStatus;
import eparking.model.Reservation;
import eparking.util.ConexionMySQL;

public class ReservationDAO implements IReservationDAO {

    @Override
    public void insertReservation(Reservation reservation) {
        Connection connection = null;
        CallableStatement statement = null;

        try {
            connection = ConexionMySQL.getConnection();
            connection.setAutoCommit(false);

            statement = connection.prepareCall("{ call sp_insertar_Reservation(?,?,?,?,?,?,?)}");
            statement.setInt(1, reservation.getId());
            statement.setInt(2, reservation.getUserId());
            statement.setInt(3, reservation.getParkingId());
            statement.setString(4, reservation.getStatus().name());
            statement.setDate(5, java.sql.Date.valueOf(reservation.getCreationDate()));
            statement.setTime(6, java.sql.Time.valueOf(reservation.getStartTime()));
            statement.setTime(7, java.sql.Time.valueOf(reservation.getEndTime()));

            statement.execute();
            connection.commit();

        } catch (Exception e) {
            e.printStackTrace(System.out);
            try {
                if (connection != null) connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            ConexionMySQL.close(statement);
            ConexionMySQL.close(connection);
        }
    }

    @Override
    public void updateReservation(Reservation reservation) {
        Connection connection = null;
        CallableStatement statement = null;

        try {
            connection = ConexionMySQL.getConnection();
            statement = connection.prepareCall("{ call sp_actualizar_Reservation(?,?,?,?,?,?,?)}");
            statement.setInt(1, reservation.getId());
            statement.setInt(2, reservation.getUserId());
            statement.setInt(3, reservation.getParkingId());
            statement.setString(4, reservation.getStatus().name());
            statement.setDate(5, java.sql.Date.valueOf(reservation.getCreationDate()));
            statement.setTime(6, java.sql.Time.valueOf(reservation.getStartTime()));
            statement.setTime(7, java.sql.Time.valueOf(reservation.getEndTime()));

            statement.execute();

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            ConexionMySQL.close(statement);
            ConexionMySQL.close(connection);
        }
    }

    @Override
    public List<Reservation> getAllReservations() {
        List<Reservation> reservations = new ArrayList<>();
        Connection connection = null;
        CallableStatement statement = null;
        ResultSet rs = null;

        try {
            connection = ConexionMySQL.getConnection();
            statement = connection.prepareCall("{ call sp_listar_Reservations()}");
            rs = statement.executeQuery();

            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setId(rs.getInt("id_reservation"));
                reservation.setUserId(rs.getInt("user_id"));
                reservation.setParkingId(rs.getInt("parking_id"));
                reservation.setStatus(ReservationStatus.valueOf(rs.getString("estado")));
                reservation.setCreationDate(rs.getDate("fecha_creacion").toLocalDate());
                reservation.setStartTime(rs.getTime("hora_inicio").toLocalTime());
                reservation.setEndTime(rs.getTime("hora_fin").toLocalTime());

                reservations.add(reservation);
            }

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            ConexionMySQL.close(rs);
            ConexionMySQL.close(statement);
            ConexionMySQL.close(connection);
        }

        return reservations;
    }

    @Override
    public List<Reservation> getAllReservations(LocalDate date) {
        List<Reservation> reservations = new ArrayList<>();
        Connection connection = null;
        CallableStatement statement = null;
        ResultSet rs = null;

        try {
            connection = ConexionMySQL.getConnection();
            statement = connection.prepareCall("{ call sp_listar_Reservations_por_fecha(?)}");
            statement.setDate(1, java.sql.Date.valueOf(date));
            rs = statement.executeQuery();

            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setId(rs.getInt("id_reservation"));
                reservation.setUserId(rs.getInt("user_id"));
                reservation.setParkingId(rs.getInt("parking_id"));
                reservation.setStatus(ReservationStatus.valueOf(rs.getString("estado")));
                reservation.setCreationDate(rs.getDate("fecha_creacion").toLocalDate());
                reservation.setStartTime(rs.getTime("hora_inicio").toLocalTime());
                reservation.setEndTime(rs.getTime("hora_fin").toLocalTime());

                reservations.add(reservation);
            }

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            ConexionMySQL.close(rs);
            ConexionMySQL.close(statement);
            ConexionMySQL.close(connection);
        }

        return reservations;
    }

    @Override
    public List<Reservation> getAllReservationsByUser(int userID) {
        List<Reservation> reservations = new ArrayList<>();
        Connection connection = null;
        CallableStatement statement = null;
        ResultSet rs = null;

        try {
            connection = ConexionMySQL.getConnection();
            statement = connection.prepareCall("{ call sp_listar_Reservations_por_usuario(?)}");
            statement.setInt(1, userID);
            rs = statement.executeQuery();

            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setId(rs.getInt("id_reservation"));
                reservation.setUserId(rs.getInt("user_id"));
                reservation.setParkingId(rs.getInt("parking_id"));
                reservation.setStatus(ReservationStatus.valueOf(rs.getString("estado")));
                reservation.setCreationDate(rs.getDate("fecha_creacion").toLocalDate());
                reservation.setStartTime(rs.getTime("hora_inicio").toLocalTime());
                reservation.setEndTime(rs.getTime("hora_fin").toLocalTime());

                reservations.add(reservation);
            }

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            ConexionMySQL.close(rs);
            ConexionMySQL.close(statement);
            ConexionMySQL.close(connection);
        }

        return reservations;
    }

    @Override
    public List<Reservation> getAllReservationsByUser(int userID, LocalDate date) {
        List<Reservation> reservations = new ArrayList<>();
        Connection connection = null;
        CallableStatement statement = null;
        ResultSet rs = null;

        try {
            connection = ConexionMySQL.getConnection();
            statement = connection.prepareCall("{ call sp_listar_Reservations_por_usuario_fecha(?,?)}");
            statement.setInt(1, userID);
            statement.setDate(2, java.sql.Date.valueOf(date));
            rs = statement.executeQuery();

            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setId(rs.getInt("id_reservation"));
                reservation.setUserId(rs.getInt("user_id"));
                reservation.setParkingId(rs.getInt("parking_id"));
                reservation.setStatus(ReservationStatus.valueOf(rs.getString("estado")));
                reservation.setCreationDate(rs.getDate("fecha_creacion").toLocalDate());
                reservation.setStartTime(rs.getTime("hora_inicio").toLocalTime());
                reservation.setEndTime(rs.getTime("hora_fin").toLocalTime());

                reservations.add(reservation);
            }

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            ConexionMySQL.close(rs);
            ConexionMySQL.close(statement);
            ConexionMySQL.close(connection);
        }

        return reservations;
    }

    @Override
    public Reservation getReservationsById(int id) {
        Reservation reservation = null;
        Connection connection = null;
        CallableStatement statement = null;
        ResultSet rs = null;

        try {
            connection = ConexionMySQL.getConnection();
            statement = connection.prepareCall("{ call sp_obtener_Reservation(?)}");
            statement.setInt(1, id);

            rs = statement.executeQuery();
            if (rs.next()) {
                reservation = new Reservation();
                reservation.setId(rs.getInt("id_reservation"));
                reservation.setUserId(rs.getInt("user_id"));
                reservation.setParkingId(rs.getInt("parking_id"));
                reservation.setStatus(ReservationStatus.valueOf(rs.getString("estado")));
                reservation.setCreationDate(rs.getDate("fecha_creacion").toLocalDate());
                reservation.setStartTime(rs.getTime("hora_inicio").toLocalTime());
                reservation.setEndTime(rs.getTime("hora_fin").toLocalTime());
            }

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            ConexionMySQL.close(rs);
            ConexionMySQL.close(statement);
            ConexionMySQL.close(connection);
        }

        return reservation;
    }
}