package gefp.web.controller;

import gefp.model.dao.UserDao;
import gefp.web.validator.LoginValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("user")
public class LoginController {

	@Autowired
    UserDao userDao;
	
	@Autowired
	LoginValidator loginValidator;
	
    @RequestMapping(value = "/login.html", method = RequestMethod.GET)
    public String login(ModelMap models)
    {
        return "login";
    }
    
    /*
    @RequestMapping(value = "/login.html", method = RequestMethod.POST)
    public String login(@ModelAttribute User user, ModelMap models, SessionStatus status, BindingResult result)
    {
    	loginValidator.validate(user, result);
    	if(result.hasErrors()) return "login";
    	
    	/*
    	List<User> users = userDao.getUsers();
    		for(int i=0; i<users.size(); i++) {
    			if(users.get(i).getUsername().equals(user.getUsername()) &&
    					users.get(i).getPassword().equals(user.getPassword())) {
    		    	return "redirect:GoldenEagleFlightPlan.html?id="+users.get(i).getId();
    			}
    		}
    	*/
    /*
    	return "redirect:GoldenEagleFlightPlan.html?id="+userDao.getUser(user.getUsername()).getId();
    		//return "redirect:login.html";
    }
    */
    
    @RequestMapping(value = "/401.html", method = RequestMethod.GET)
    public String loginError(ModelMap models)
    {
        return "401";
    }
}