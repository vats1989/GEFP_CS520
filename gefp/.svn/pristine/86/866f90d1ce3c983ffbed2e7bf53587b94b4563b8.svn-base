package gefp.model.dao.jpa;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gefp.model.Runway;
import gefp.model.dao.RunwayDao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Repository
public class RunwayDaoImpl implements RunwayDao{

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Runway getRunway(long id) {
		return entityManager.find( Runway.class, id );
	}

	@Override
	public List<Runway> getRunways() {
		return entityManager.createQuery( "from Runway order by id", Runway.class)
        		.getResultList();
	}

	@Override
	@Transactional
	public Runway saveRunway(Runway runway) {	
		return entityManager.merge(runway);
	}
}