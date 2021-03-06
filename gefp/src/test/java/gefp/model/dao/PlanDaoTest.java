package gefp.model.dao;

//import gefp.model.Department;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups = "PlanDaoTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class PlanDaoTest extends AbstractTransactionalTestNGSpringContextTests {

    @Autowired
    UserDao userDao;
    
    @Autowired
    DepartmentDao deptDao;
    /*
     * Below test case pass if jdoe1 user has
     * checked only one checkpoint.
     */
    @Test
    public void getPlan1Test()
    {
    	//assert userDao.getUser("jdoe1").getCheckpoints().size() == 1;
    	//assert deptDao.getDepartment(2).getPlans().size() == 0;
    }
 
    
    /*
     * Below Test case pass if jdoe2 user has checked
     * all the checkpoints which are in his department.
     */
    /*
    @Test
    public void getPlan2Test()
    {
    	//assert userDao.getUser("jdoe2").getDepartment().getCheckpoints().size() == 
    			//userDao.getUser("jdoe2").getCheckpoints().size();
    }
    */
}