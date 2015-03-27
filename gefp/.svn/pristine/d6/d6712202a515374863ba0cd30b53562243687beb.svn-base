package gefp.model.dao.jpa;

import gefp.model.Cell;
import gefp.model.dao.CellDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class CellDaoImpl implements CellDao{

	@PersistenceContext
	private EntityManager entityManager;

	
	@Override
	public Cell getCell(long id) {
		return entityManager.find( Cell.class, id );
	}


	@Override
	public List<Cell> getCell() {
		return entityManager.createQuery( "from Cell order by id", Cell.class).getResultList();
	}

	@Override
	@Transactional
	public Cell saveCell(Cell cell) {
		return entityManager.merge(cell);
	}

	@Override
	public Cell getCellByRunwayStage(long run_id, long st_id) {
		Query query = entityManager.createQuery("select c from Cell c where c.runway = :run_id and c.stage = :st_id");
		query.setParameter("run_id", run_id);
		query.setParameter("st_id", st_id);
		return (Cell) query.getSingleResult();
	}
}