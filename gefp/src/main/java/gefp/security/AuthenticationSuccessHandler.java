package gefp.security;

import gefp.model.User;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;


@Component
public class AuthenticationSuccessHandler extends
    SavedRequestAwareAuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess( HttpServletRequest request,
        HttpServletResponse response, Authentication authentication )
        throws ServletException, IOException
    {
        User user = (User) authentication.getPrincipal();
        //logger.info( user.getUsername() + " signed in." );

        RequestCache requestCache = new HttpSessionRequestCache();
        SavedRequest savedRequest = requestCache.getRequest( request, response );
        if( savedRequest != null )
        {
            super.onAuthenticationSuccess( request, response, authentication );
            return;
        }

        String returnUrl = null;
        
        Set<String> roles = user.getRoles();
        request.getSession().setAttribute("user", user);
        
        if(roles.contains("ROLE_ADMIN"))
        	returnUrl = "/AdminArea/DepartmentSelect.html";

    	else if(roles.contains("ROLE_ADVISOR"))
    		returnUrl = "/AdvisorArea/GefpAdvisor.html";

    	else if(roles.contains("ROLE_STUDENT"))
    		returnUrl = "/UserArea/GefpStudent.html";
       
        System.out.println(user.getUsername()+"~~~"+user.getPassword());
        getRedirectStrategy().sendRedirect( request, response,	returnUrl);
    }
}