package gefp.model.dao;

import java.util.List;

import gefp.model.Department;

public interface DepartmentDao {
	
	   Department getDepartment( long id );

	   List<Department> getDepartments();
	   
	   Department saveDepartment(Department dept);
}
