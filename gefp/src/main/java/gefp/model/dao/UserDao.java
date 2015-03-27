package gefp.model.dao;

import java.util.List;

import gefp.model.User;

public interface UserDao {

    User getUser( long id );

    User getUser(String username);
    
    List<User> getUsers();
    
    User saveUser(User user);

	List<User> searchUsersByPrefix(String term, int i);

	User getUserByUsername(String username);
}