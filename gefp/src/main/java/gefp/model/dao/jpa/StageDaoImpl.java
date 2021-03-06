package gefp.model.dao.jpa;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gefp.model.Stage;
import gefp.model.dao.StageDao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Repository
public class StageDaoImpl implements StageDao{

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Stage getStage(long id) {
		return entityManager.find( Stage.class, id );
	}

	@Override
	public List<Stage> getStages() {
		return entityManager.createQuery( "from Stage order by id", Stage.class)
        		.getResultList();
	}

	@Override
	@Transactional
	public Stage saveStage(Stage stage) {
		return entityManager.merge(stage);
	}
}