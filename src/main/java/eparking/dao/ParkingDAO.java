package eparking.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import eparking.enums.ParkingStatus;
import eparking.model.Parking;
import eparking.util.ConexionMySQL;

public class ParkingDAO implements IParkingDAO {

    @Override
    public void insertParking(Parking parking) {
        Connection connection = null;
        CallableStatement statement = null;

        try {
            connection = ConexionMySQL.getConnection();
            connection.setAutoCommit(false);

            statement = connection.prepareCall("{ call sp_insertar_Parking(?,?,?)}");
            statement.setInt(1, parking.getId());
            statement.setString(2, parking.getLabel());
            statement.setString(3, parking.getStatus().name()); 

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
    public void updateParking(Parking parking) {
        Connection connection = null;
        CallableStatement statement = null;

        try {
            connection = ConexionMySQL.getConnection();
            statement = connection.prepareCall("{ call sp_actualizar_Parking(?,?,?)}");
            statement.setInt(1, parking.getId());
            statement.setString(2, parking.getLabel());
            statement.setString(3, parking.getStatus().name()); 

            statement.execute();

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            ConexionMySQL.close(statement);
            ConexionMySQL.close(connection);
        }
    }

    @Override
    public List<Parking> getAllParkings() {
        List<Parking> parkings = new ArrayList<>();
        Connection connection = null;
        CallableStatement statement = null;
        ResultSet rs = null;

        try {
            connection = ConexionMySQL.getConnection();
            statement = connection.prepareCall("{ call sp_listar_Parkings()}");
            rs = statement.executeQuery();

            while (rs.next()) {
                Parking parking = new Parking(
                    rs.getInt("id_Parking"),
                    rs.getString("Parking"),
                    ParkingStatus.valueOf(rs.getString("estado"))
                );

                parkings.add(parking);
            }

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            ConexionMySQL.close(rs);
            ConexionMySQL.close(statement);
            ConexionMySQL.close(connection);
        }

        return parkings;
    }

    @Override
    public Parking findParkingById(int id) {
        Parking parking = null;
        Connection connection = null;
        CallableStatement statement = null;
        ResultSet rs = null;

        try {
            connection = ConexionMySQL.getConnection();
            statement = connection.prepareCall("{ call sp_obtener_Parking(?)}");
            statement.setInt(1, id);

            rs = statement.executeQuery();
            if (rs.next()) {
                parking = new Parking(
                    rs.getInt("id_Parking"),
                    rs.getString("Parking"),
                    ParkingStatus.valueOf(rs.getString("estado"))
                );
            }

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            ConexionMySQL.close(rs);
            ConexionMySQL.close(statement);
            ConexionMySQL.close(connection);
        }

        return parking;
    }
}