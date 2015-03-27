package gefp.model.dao.jpa;


import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import gefp.model.CheckPoint;
import gefp.model.dao.CheckPointDao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class CheckPointDaoImpl implements CheckPointDao{

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public CheckPoint getCheckPoint(long id) 
	{	
		return entityManager.find( CheckPoint.class, id );
	}

	@Override
	public List<CheckPoint> getCheckPoints() 
	{	
		return entityManager.createQuery( "from CheckPoint order by id", CheckPoint.class)
        		.getResultList();
	}

	@Override
	@Transactional
	public CheckPoint saveCheckPoint(CheckPoint checkPoint) {
		return entityManager.merge(checkPoint);
	}

	@Override
	@Transactional
	public void deleteCheckPoint(CheckPoint checkPoint) {
		System.out.println("In deleteCheckPoint()="+checkPoint.getId());
		entityManager.remove(checkPoint);
		System.out.println("After deleteCheckPoint()=");
	}
}