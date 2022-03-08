package io.muzoo.ssc.webapp.service;

import io.muzoo.ssc.webapp.model.User;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService {

    private static final String INSERT_USER_SQL = "INSERT INTO tbl_user (username, password, display_name) VALUES (?, ?, ?);";
    private static final String SELECT_USER_SQL = "SELECT * FROM tbl_user WHERE username = ?;";
    private static final String SELECT_ALL_USER_SQL = "SELECT * FROM tbl_user;";
    private static final String DELETE_USER_SQL = "DELETE FROM tbl_user WHERE username = ?;";
    private static final String UPDATE_USER_SQL = "UPDATE tbl_user SET display_name = ? WHERE username = ?;";
    private static final String UPDATE_USER_PASSWORD_SQL = "UPDATE tbl_user SET password = ? WHERE username = ?;";

    private static UserService service;
    private DBConnectionService databaseConnectionService;

    public UserService() {
    }

    public static UserService getInstance() {
        if (service == null){
            service = new UserService();
            service.setDatabaseConnectionService(DBConnectionService.getInstance());
        }
        return service;
    }

    public void setDatabaseConnectionService(DBConnectionService databaseConnectionService) {
        this.databaseConnectionService = databaseConnectionService;
    }

    /**
     * create user with parameter
     * @param username
     * @param password
     * @param displayName
     * @throws UserServiceException
     */
    public void createUser(String username, String password, String displayName) throws UserServiceException {
        try(
                Connection connection = databaseConnectionService.getConnection();
                PreparedStatement ps = connection.prepareStatement(INSERT_USER_SQL);
        ){
            ps.setString(1, username);
            ps.setString(2, BCrypt.hashpw(password, BCrypt.gensalt()));
            ps.setString(3, displayName);
            ps.executeUpdate();
            connection.commit();
        }
        catch (SQLIntegrityConstraintViolationException e){
            throw new UsernameNotUniqueException(String.format("Username %s has already been taken.", username));
        }
        catch (SQLException e){
            throw new UserServiceException(e.getMessage());
        }

    }

    /**
     * list all user data by username
     * @param username
     * @return
     */
    public User findByUsername(String username) {
        try(
                Connection connection = databaseConnectionService.getConnection();
                PreparedStatement ps = connection.prepareStatement(SELECT_USER_SQL);
        ){
            ps.setString(1, username);
            ResultSet resultSet = ps.executeQuery();
            resultSet.next();
            return new User(
                    resultSet.getLong("id"),
                    resultSet.getString("username"),
                    resultSet.getString("password"), // this is hashed password
                    resultSet.getString("display_name")
            );
        } catch (SQLException e){
            return null;
        }
    }

    /**
     * List all user data
     * @return
     */
    public List<User> findAll(){
        List<User> users = new ArrayList<>();
        try(
                Connection connection = databaseConnectionService.getConnection();
                PreparedStatement ps = connection.prepareStatement(SELECT_ALL_USER_SQL);
        ){
            ResultSet resultSet = ps.executeQuery();
            while(resultSet.next()) {
                users.add(
                        new User(
                                resultSet.getLong("id"),
                                resultSet.getString("username"),
                                resultSet.getString("password"),
                                resultSet.getString("display_name")));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return users;
    }

    /**
     * delete user by username
     * @param username
     * @return
     */
    public boolean deleteUserByUsername(String username) {
        try(
                Connection connection = databaseConnectionService.getConnection();
                PreparedStatement ps = connection.prepareStatement(DELETE_USER_SQL);
        ){
            ps.setString(1, username);
            int deleteCount = ps.executeUpdate();
            connection.commit();
            return deleteCount > 0;

        } catch (SQLException e){
            return false;
        }
    }

    /**
     * update displayname by username. user can only change display name
     * @param username
     * @param displayName
     * @throws UserServiceException
     */
    public void updateUserByUsername(String username, String displayName) throws UserServiceException {
        try(
                Connection connection = databaseConnectionService.getConnection();
                PreparedStatement ps = connection.prepareStatement(UPDATE_USER_SQL);
        ){
            ps.setString(1, displayName);
            ps.setString(2, username);

            ps.executeUpdate();
            connection.commit();
        }
        catch (SQLException e){
            throw new UserServiceException(e.getMessage());
        }
    }

    /**
     * updata password by username
     * @param username
     * @param newPassword
     * @throws UserServiceException
     */
    public void changePassword(String username, String newPassword) throws UserServiceException{
        try(
                Connection connection = databaseConnectionService.getConnection();
                PreparedStatement ps = connection.prepareStatement(UPDATE_USER_PASSWORD_SQL);
        ){
            ps.setString(1, BCrypt.hashpw(newPassword, BCrypt.gensalt()));
            ps.setString(2, username);

            ps.executeUpdate();
            connection.commit();
        }
        catch (SQLException e){
            throw new UserServiceException(e.getMessage());
        }
    }

    public static void main(String[] args) throws UserServiceException {
        UserService userService = UserService.getInstance();
        try {
            userService.createUser("u1", "123456", "test1");
            userService.createUser("u2", "123456", "test2");
            userService.createUser("u3", "123456", "test3");
            userService.createUser("u4", "123456", "test4");
            userService.createUser("u5", "123456", "test5");
            userService.createUser("admin", "654321", "admin");
        }
        catch(UserServiceException e){
            e.printStackTrace();
        }
    }
}
