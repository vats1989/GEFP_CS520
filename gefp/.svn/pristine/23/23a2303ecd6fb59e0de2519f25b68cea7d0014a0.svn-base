package gefp.web.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import gefp.model.User;
import gefp.model.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


@Component
public class PasswordValidator implements Validator{

	@Autowired
	UserDao userDao;
	
	private Pattern pattern;
	/*
	private Pattern pattern1;
	private Pattern pattern2;
	private Pattern pattern3;
	private Matcher matcher;
	
	private static final String PASSWORD_PATTERN1 = "(.{4,})";
	private static final String PASSWORD_PATTERN2 = "((?=.*\\d))";
	private static final String PASSWORD_PATTERN3 = "((?=.*[a-zA-Z]))";
	*/
	
	private static final String PASSWORD_PATTERN = "((?=.*\\d)(?=.*[a-zA-Z]).{4,})";
	
	public  PasswordValidator() 
	{
		pattern = Pattern.compile(PASSWORD_PATTERN);
		//pattern1 = Pattern.compile(PASSWORD_PATTERN1);
		//pattern2 = Pattern.compile(PASSWORD_PATTERN2);
		//pattern3 = Pattern.compile(PASSWORD_PATTERN3);
	}
	
	
	@Override
	public boolean supports(Class<?> clazz) 
	{
		return User.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) 
	{
		User user = (User) target;
		
		boolean password = validate(user.getPassword());
		//System.out.println("Password Flag ="+password);
		
		if(!password )
			errors.rejectValue( "enabled", "error.password.format");
		/*
		boolean password_digit 		= isContainDigit(user.getPassword());
		boolean password_character 	= isContainCharacter(user.getPassword());
		boolean password_length 	= isMinimumLength(user.getPassword());
	
		password_length 	= validate1(user.getPassword());
		password_digit 		= validate2(user.getPassword());
		password_character 	= validate3(user.getPassword());
			
		System.out.println("Length = "+password_length);
		System.out.println("Digit  = "+password_digit);
		System.out.println("Character = "+password_character);
	
		if(!password_length )
			errors.rejectValue( "enabled", "error.password.length");
		else if(!password_digit && password_length)
			errors.rejectValue("username", "error.password.digit");
		else if(!password_character && password_digit && password_length)
			errors.rejectValue( "password", "error.password.character" );
		*/
	}
	
	/*
	public boolean isContainDigit(String password) {
		for(int i=0; i< password.length(); i++)
			if(Character.isDigit(password.charAt(i)))
				return true;
		return false;
	}
	
	public boolean isContainCharacter(String password) {
		for(int i=0; i< password.length(); i++)
			if(Character.isLetter(password.charAt(i)))
				return true;
		return false;
	}
	
	public boolean isMinimumLength(String password) {
		return password.length() >= 4;
	}
	*/
	
	public boolean validate(String password)	{
		Matcher matcher = pattern.matcher(password);
		return matcher.matches();	
	}
	
	/*
	public boolean validate1(String password)	{
		Matcher matcher = pattern1.matcher(password);
		return matcher.matches();	
	}
	public boolean validate2(String password)	{
		Matcher matcher = pattern2.matcher(password);
		return matcher.matches();
	}
	public boolean validate3(String password)	{
		Matcher matcher = pattern3.matcher(password);
		return matcher.matches();
	}
	*/
}