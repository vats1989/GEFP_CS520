package gefp.model.dao.jpa;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import gefp.model.Plan;
import gefp.model.dao.PlanDao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class PlanDaoImpl implements PlanDao{

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Plan getPlan(long id) {
		return entityManager.find( Plan.class, id );
	}

	@Override
	public List<Plan> getPlans() {
		return entityManager.createQuery( "from Plan order by id", Plan.class)
        		.getResultList();	
	}

	@Override
	@Transactional
	public Plan savePlan(Plan plan) {
		return entityManager.merge(plan);
	}
}