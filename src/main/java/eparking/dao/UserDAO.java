package eparking.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import eparking.enums.Permission;
import eparking.model.User;
import eparking.util.ConexionMySQL;

public class UserDAO implements IUserDAO {

    @Override
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        Connection connection = null;
        CallableStatement statement = null;
        ResultSet rs = null;

        try {
            connection = ConexionMySQL.getConnection();
            statement = connection.prepareCall("{ call sp_listar_Users()}");
            rs = statement.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id_user"));
                user.setName(rs.getString("name"));
                user.setUserName(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setPermission(Permission.fromName(rs.getString("permission")));
                user.setLoginAttempt(rs.getInt("login_attempt"));
                user.setUserLock(rs.getBoolean("user_lock"));

                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            ConexionMySQL.close(rs);
            ConexionMySQL.close(statement);
            ConexionMySQL.close(connection);
        }

        return users;
    }

    @Override
    public User findUserByUserName(String userName) {
      
        Connection connection = null;
        CallableStatement statement = null;
        ResultSet rs = null;

        try {
            connection = ConexionMySQL.getConnection();
            statement = connection.prepareCall("{ call sp_obtener_User_por_username(?)}");
            statement.setString(1, userName);

            rs = statement.executeQuery();
            if (rs.next()) {
            	
            	User user;
            	String password = rs.getString("password");
                String permissionName = rs.getString("permission");
                Permission permission = Permission.fromName(permissionName);
                
                if(permission.equals(Permission.ADMIN)) {
                	user = User.createAdmin(userName, password);
                } else {
                	user = User.createUser(userName, password);
                }
                
                user.setId(rs.getInt("id_user"));
                user.setName(rs.getString("name"));
                user.setLoginAttempt(rs.getInt("login_attempt"));
                user.setUserLock(rs.getBoolean("user_lock"));
               
                return user;
            }

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            ConexionMySQL.close(rs);
            ConexionMySQL.close(statement);
            ConexionMySQL.close(connection);
        }

        return null;
    }

    @Override
    public User findUserById(int id) {
        User user = null;
        Connection connection = null;
        CallableStatement statement = null;
        ResultSet rs = null;

        try {
            connection = ConexionMySQL.getConnection();
            statement = connection.prepareCall("{ call sp_obtener_User(?)}");
            statement.setInt(1, id);

            rs = statement.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id_user"));
                user.setName(rs.getString("name"));
                user.setUserName(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setPermission(Permission.valueOf(rs.getString("permission")));
                user.setLoginAttempt(rs.getInt("login_attempt"));
                user.setUserLock(rs.getBoolean("user_lock"));
            }

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            ConexionMySQL.close(rs);
            ConexionMySQL.close(statement);
            ConexionMySQL.close(connection);
        }

        return user;
    }

    @Override
    public void insertUser(User user) {
        Connection connection = null;
        CallableStatement statement = null;

        try {
            connection = ConexionMySQL.getConnection();
            connection.setAutoCommit(false);

            statement = connection.prepareCall("{ call sp_insertar_User(?,?,?,?,?,?)}");
            statement.setString(1, user.getName());
            statement.setString(2, user.getUserName());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getPermission().toString());
            statement.setInt(5, user.getLoginAttempt());
            statement.setBoolean(6, user.isUserLock());

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
    public void updateUser(User user) {
        Connection connection = null;
        CallableStatement statement = null;

        try {
            connection = ConexionMySQL.getConnection();

            statement = connection.prepareCall("{ call sp_actualizar_User(?,?,?,?,?,?,?)}");
            statement.setInt(1, user.getId());
            statement.setString(2, user.getName());
            statement.setString(3, user.getUserName());
            statement.setString(4, user.getPassword());
            statement.setString(5, user.getPermission().toString());
            statement.setInt(6, user.getLoginAttempt());
            statement.setBoolean(7, user.isUserLock());

            statement.execute();

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            ConexionMySQL.close(statement);
            ConexionMySQL.close(connection);
        }
    }
}