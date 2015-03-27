package gefp.web.controller;

import gefp.model.CheckPoint;
import gefp.model.User;
import gefp.model.dao.CheckPointDao;
import gefp.model.dao.DepartmentDao;
import gefp.model.dao.PlanDao;
import gefp.model.dao.UserDao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("searchUsers")
public class AdvisorController {

	
	@Autowired
	UserDao userDao;
	
	@Autowired
	CheckPointDao checkPointDao;
	
	@Autowired
	DepartmentDao departmentDao;
	
	@Autowired
	PlanDao planDao;
	
    /*************************Advisor Page*******************************/
    @RequestMapping(value=("/AdvisorArea/GefpAdvisor.html"), method=RequestMethod.GET)
    public String gefp2(ModelMap models, HttpSession session) 
    {
    	models.put("departments", departmentDao.getDepartments());
    	return "AdvisorArea/GefpAdvisor";
    }    
    /****************************************************************/
	
    
    /*************************AutoComplete*******************************/
	@RequestMapping("/AdvisorArea/autocomplete/usersearch.html")
    public String users( @RequestParam String term, HttpServletResponse response )
        throws JSONException, IOException
    {
        JSONArray jsonArray = new JSONArray();
        List<User> users = userDao.searchUsersByPrefix( term, 10 );
        for( User user : users )
        {
        	if(user.getRoles().contains("ROLE_STUDENT"))  {
        		Map<String, String> json = new HashMap<String, String>();
        		json.put( "id", ""+user.getId() );
        		json.put( "value", user.getUsername());
        		json.put( "label", user.getCin() + " " + user.getUsername());
        		jsonArray.put( json );
        	}
        }
        response.setContentType( "application/json" );
        jsonArray.write( response.getWriter() );
        return null;
    }
	/****************************************************************/
	
	
	/***********************AdvisorSearchUsers**********************/
	@RequestMapping("/AdvisorArea/AdvisorSearchUsers.html")
	public String advisorSearchUsers(@RequestParam (required = false) String term, ModelMap models) {
		
		List<User> userSearchList = new ArrayList<User>();
		if(term.equals(""))
			models.put("searchUsers",userSearchList);
		else if(!term.equals(""))	{
			List<User> userSearchList1 = userDao.searchUsersByPrefix(term, 20);
			
			for(User user : userSearchList1) {
				if(user.getRoles().contains("ROLE_STUDENT"))
					userSearchList.add(user);
			}
			models.put("searchUsers",userSearchList);
		}	
		return "redirect:/AdvisorArea/GefpAdvisor.html"; 
	}
	/****************************************************************/
	
	
	@RequestMapping("/AdvisorArea/DeptPublishedPlan.html")
	public String selectDepartment(@RequestParam String select_dept, ModelMap models) {
		
		models.put("department", departmentDao.getDepartment(Long.parseLong(select_dept)));
		return "AdvisorArea/DeptPublishedPlan"; 
	}
	
	
	/*************************AdvisorStudent Page*******************************/
    @RequestMapping(value=("/AdvisorArea/AdvisorStudent.html"), method=RequestMethod.GET)
    public String gefpstu(@RequestParam long id , ModelMap models, HttpSession session) 
    {
    	User user = userDao.getUser(id);
    	if(!user.getRoles().contains("ROLE_STUDENT"))
    		return "redirect:/AdvisorArea/GefpAdvisor.html"; 
    	
        models.put( "student", user);
    	return "AdvisorArea/AdvisorStudent";
    }
    /****************************************************************/
    
    
    /*************************Student CheckPoint*******************************/
    @RequestMapping(value="/AdvisorArea/studentCheckPointAddRemove.html", method=RequestMethod.POST)
    public @ResponseBody String checkPointAddRemove(@RequestParam String user_id, @RequestParam String cp, @RequestParam String operation_type) {
    	
    	User user = userDao.getUser(Long.parseLong(user_id));
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
    /******************************************************************/
    
    /*
    @RequestMapping(value=("/AdvisorArea/DeptPublishedPlan.html"), method=RequestMethod.GET)
    public String deptPublishedPlan(ModelMap models) 
    {
    	List<Department> dept_list = departmentDao.getDepartments(); 
        models.put( "department", dept_list);
    	return "AdvisorArea/DeptPublishedPlan";
    }
    @RequestMapping(value=("/AdvisorArea/AdvisorPublishPlan.html"), method=RequestMethod.GET)
    public String advisorPublishPlan(@RequestParam long plan_id, ModelMap models) 
    {
    	Plan plan = planDao.getPlan(plan_id); 
        models.put( "plan", plan);
    	return "AdvisorArea/AdvisorPublishPlan";
    }
    */
}