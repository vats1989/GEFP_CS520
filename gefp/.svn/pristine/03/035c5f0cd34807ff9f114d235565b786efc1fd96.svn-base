package gefp.model.dao.jpa;

import gefp.model.Department;
import gefp.model.dao.DepartmentDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;




import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class DepartmentDaoImpl implements DepartmentDao{

    @PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public Department getDepartment(long id) 
	{
		return entityManager.find( Department.class, id );
	}

	@Override
	public List<Department> getDepartments() 
	{
		   return entityManager.createQuery( "from Department order by id", Department.class)
	        		.getResultList();
	}

	@Override
	@Transactional
	public Department saveDepartment(Department dept) {
		return entityManager.merge(dept);
	}
}