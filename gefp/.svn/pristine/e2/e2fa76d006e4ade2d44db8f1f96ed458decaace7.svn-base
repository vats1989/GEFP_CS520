package gefp.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups = "UserDaoTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserDaoTest extends AbstractTransactionalTestNGSpringContextTests {
    
    @Autowired
    UserDao userDao;
    
    @Test
    public void getUser1()
    {
       assert userDao.getUser("jdoe1") != null;
    }
    
    @Test
    public void getUser2()
    {
    	assert userDao.getUser("jdoe2") != null;
    }
}