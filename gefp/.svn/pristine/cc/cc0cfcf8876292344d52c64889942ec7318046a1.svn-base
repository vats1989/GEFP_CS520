package gefp.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import gefp.model.CheckPoint;
import gefp.model.Department;
import gefp.model.User;
import gefp.model.dao.CheckPointDao;
import gefp.model.dao.DepartmentDao;
import gefp.model.dao.PlanDao;
import gefp.model.dao.UserDao;
import gefp.web.validator.PasswordValidator;

@Controller
@SessionAttributes({"user","department"})
public class UserController {

    @Autowired
    private UserDao userDao;
    
    @Autowired
    private CheckPointDao checkPointDao;

    @Autowired
	PasswordValidator passwordValidator;
    
    @Autowired
    DepartmentDao departmentDao;
    
    @Autowired
    PlanDao planDao;

    
    /**************************Student Page******************************/
    @RequestMapping(value=("/UserArea/GefpStudent.html"), method=RequestMethod.GET)
    public String gefpstu(/*@RequestParam long id , */ ModelMap models, HttpSession session) 
    {
    	//User user = userDao.getUser(id);
    	User user = (User) session.getAttribute("user");
    	user = userDao.getUser(user.getId());
        models.put( "user", user);
    	return "UserArea/GoldenEagleFlightPlan";
    }
    /****************************************************************/
    
    
    @RequestMapping(value="/UserArea/ChangeDetails.html",method=RequestMethod.GET)
    public String changeDetails(ModelMap models, HttpSession session)	{
    	
    	User user = (User) session.getAttribute("user");
    	user = userDao.getUser(user.getId());    	
    	//User user = userDao.getUser(user_id);
    	user.setPassword(null);
    	models.put("user", user);
    	return "UserArea/ChangeDetails";
    }
    
    @RequestMapping(value="/UserArea/ChangeDetails.html",method=RequestMethod.POST)
    public String changeDetails(@ModelAttribute User user, BindingResult result, @RequestParam String repassword, ModelMap models)	{
    	
    	User newUser = userDao.getUser(user.getId());
    	if(!user.getPassword().trim().equals(""))	{
    		passwordValidator.validate(user, result);
    		if(result.hasErrors())	{
    			user.setPassword(null);
    			models.put("user",user);
    			return "UserArea/ChangeDetails";
    		}
    	}
    	
    	if(!user.getPassword().trim().equals(repassword.trim()))	{
    		models.put("pass_error", "Password Re-Password Mismatch !!!");
    		user.setPassword(null);
    		models.put("user",user);
    		return "UserArea/ChangeDetails";
    	}
    		
    	if(!user.getPassword().trim().equals("") /*|| !(user.getPassword().length() == 0)*/)	{
    		newUser.setPassword(user.getPassword());
    		newUser = userDao.saveUser(newUser);
    	}
    	return "redirect:/UserArea/GefpStudent.html?id="+user.getId();
    }
    
    @RequestMapping(value="/UserArea/ChangeMajor.html",method=RequestMethod.GET)
    public String changeMagor(ModelMap models, HttpSession session)	{
    	models.put("department", departmentDao.getDepartments());
    	//models.put("user", userDao.getUser(user_id));
    	User user = (User) session.getAttribute("user");
    	user = userDao.getUser(user.getId()); 
    	return "UserArea/ChangeMajor";
    }
    
    @RequestMapping(value="/UserArea/ChangeMajor.html",method=RequestMethod.POST)
    public String changeMagor(@RequestParam String select_dept, ModelMap models, HttpSession session)	{
    	long dept_id = Long.parseLong(select_dept);
    	User user = (User) session.getAttribute("user");
    	user = userDao.getUser(user.getId());
    	Department dept = departmentDao.getDepartment(dept_id);
    	//User user = userDao.getUser(user_id);
    	user.setMajor(dept);
    	user.setPlan(dept.getCurrentPlan());
    	user = userDao.saveUser(user);

    	return "redirect:/UserArea/GefpStudent.html";
    }
    
    @RequestMapping(value="/UserArea/checkPointAddRemove.html", method=RequestMethod.POST)
    public @ResponseBody String checkPointAddRemove(@RequestParam String cp, @RequestParam String operation_type, HttpSession session) {
    	
    	//User user = userDao.getUser(Long.parseLong(user_id));
    	User user = (User) session.getAttribute("user");
    	user = userDao.getUser(user.getId());

    	CheckPoint checkPoint = checkPointDao.getCheckPoint(Long.parseLong(cp));
    	List<User> users = checkPoint.getUsers();
    	
    	if(operation_type.equals("checked"))
    		users.add(user);
    	else if(operation_type.equals("unchecked"))
    		users.remove(user);

    	checkPoint.setUsers(users);
    	checkPointDao.saveCheckPoint(checkPoint);
    	
    	return "Success";
    }
    
    
    @RequestMapping(value="/UserArea/PublishPlans.html",method=RequestMethod.GET)
    public String publishPlans(ModelMap models, HttpSession session)	{
    	User user = (User) session.getAttribute("user");
    	user = userDao.getUser(user.getId());
    	//System.out.println("Student ID = "+user.getId());
    	models.put("department", user.getMajor());
    	return "UserArea/PublishPlans";
    }
    
    /*
    @RequestMapping(value="/UserArea/ViewPublishPlan.html",method=RequestMethod.GET)
    public String viewPublishPlans(@RequestParam long plan_id, ModelMap models)	{
    	//User user = (User) session.getAttribute("user");
    	//user = userDao.getUser(user.getId());
    	//System.out.println("Student ID = "+user.getId());
    	Plan plan = planDao.getPlan(plan_id); 
        models.put( "plan", plan);
    	return "UserArea/ViewPublishPlan";
    }
    */
}