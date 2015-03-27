package gefp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gefp.model.User;
import gefp.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public User getUser( long id )
    {
        return entityManager.find( User.class, id );
    }

    @Override
    public List<User> getUsers()
    {
        return entityManager.createQuery( "from User order by id", User.class)
        		.getResultList();
    }
    
    @Override
	public User getUser(String username) 
	{	
		User user = null;
    	List<User> users = getUsers();
    	for(int i = 0; i < users.size(); i++)  {
    		if(users.get(i).getUsername().equalsIgnoreCase(username))  {
    			user = users.get(i);
    			break;
    		}
    	}
		return user;
	}

	@Override
	@Transactional
	public User saveUser(User user) {
		return entityManager.merge(user);
	}

	
	@Override
	public List<User> searchUsersByPrefix(String term, int maxResults) {
        term = term.toLowerCase();
        String query = "from User where cin like :term || '%' "
            + "or lower(username) like :term || '%' "
            + "or lower(firstname) like :term || '%' "
            + "or lower(lastname) like :term || '%' "
            + "or lower(firstname || ' ' || lastname) like :term || '%' "
            + "or lower(email_id) like :term || '%' "
            + "order by firstname asc";

        return entityManager.createQuery( query, User.class )
            .setParameter( "term", term )
            .setMaxResults( maxResults )
            .getResultList();
	}

	@Override
    public User getUserByUsername( String username )
    {
        // This method is mainly used by the security code which usually needs
        // both the user credentials (i.e. username and password) and the
        // granted authorities (i.e. roles), so here we load the roles
        // collection "eagerly" using a join fetch to avoid a second query.
        String query = "from User user left join fetch user.roles "
            + "where lower(username) = :username";

        List<User> users = entityManager.createQuery( query, User.class )
            .setParameter( "username", username.toLowerCase() )
            .getResultList();
        return users.size() == 0 ? null : users.get( 0 );
    }
}