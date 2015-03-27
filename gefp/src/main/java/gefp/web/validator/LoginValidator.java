package gefp.web.validator;

import java.util.List;

import gefp.model.User;
import gefp.model.dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


@Component
public class LoginValidator implements Validator{

	@Autowired
	UserDao userDao;
	
	@Override
	public boolean supports(Class<?> clazz) {
	
		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		boolean username_reject = false;
		boolean password_reject = false;
		
		if (!StringUtils.hasText(user.getUsername())) {
			errors.rejectValue( "username", "error.username.empty" );
			username_reject = true;
		}
		
		if(StringUtils.isEmpty(user.getPassword()))  {
			errors.rejectValue("password", "error.password.empty");
			password_reject = true;
		}
		
		if(!username_reject && !password_reject)  {
			boolean login_user = false;
	    	List<User> users = userDao.getUsers();
			for(int i=0; i<users.size(); i++) {
				if(users.get(i).getUsername().equals(user.getUsername()) &&
						users.get(i).getPassword().equals(user.getPassword())) {
			    	login_user = true;
				}
			}
			if(!login_user)
				errors.rejectValue("enabled","error.invalid.credentials");
		}
	}
}