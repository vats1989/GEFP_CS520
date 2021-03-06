package gefp.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

//import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "USERS")
public class User implements Serializable, UserDetails {

	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name="user_id")
    private long id;
	
	@Basic
	@Column(name="username", nullable=false, unique = true)
    private String username;

	@Basic
	@Column(name="password", nullable=false)
    private String password;

	@Basic
	@Column(name="cin")
	private String cin;
	
	@Basic
	@Column(name="email_id")
	private String email_id;
	
	@Basic
	@Column(name="firstname")
	private String firstname;
	
	@Basic
	@Column(name="lastname")
	private String lastname;
	
	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	
	//@JsonIgnore
    @ElementCollection
    @CollectionTable(name = "authorities",
        joinColumns = @JoinColumn(name = "user_id"))
    @Column(name = "role")
    private Set<String> roles;
	
	/*
	@ManyToMany
	@JoinTable(name="USER_ROLES",
				joinColumns=@JoinColumn(name="user_id",referencedColumnName="user_id"),
				inverseJoinColumns=@JoinColumn(name="role_id", referencedColumnName="role_id")
			)
	private List<Role> roles;
	*/
	
	@Basic
	@Column(name="enabled")
	private boolean enabled;
	
	@ManyToMany(mappedBy="users")
	private List<CheckPoint> checkpoints;
	
	@ManyToOne
	@JoinColumn(name="dept_id")
	private Department major;
	
	@ManyToOne
	@JoinColumn(name="plan_id")
	private Plan plan;
	
	
	
	/*
	@Basic
	@Column(name="first_name", nullable=false)
	private String first_name;
	
	@Basic
	@Column(name="last_name", nullable=false)
	private String last_name;
	
	@Basic
	@Column(name="user_type", nullable=false)
    private String user_type;
    
	@Basic
	@Column(name="emailid", nullable=false)
	private String email_id;
	
    @ManyToOne
    @JoinColumn(name="dept_id")
    private Department department;
	
	
	*/
	
	public String getCin() {
		return cin;
	}

	public void setCin(String cin) {
		this.cin = cin;
	}

	public String getEmail_id() {
		return email_id;
	}

	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}


	public List<CheckPoint> getCheckpoints() {
		return checkpoints;
	}

	public void setCheckpoints(List<CheckPoint> checkpoints) {
		this.checkpoints = checkpoints;
	}

	public Department getMajor() {
		return major;
	}

	public void setMajor(Department major) {
		this.major = major;
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<String> getRoles()
    {
        return roles;
    }

    public void setRoles( Set<String> roles )
    {
        this.roles = roles;
    }

	@Override
	public Collection<GrantedAuthority> getAuthorities() {
	     Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
	     for( String role : roles )
	    	 authorities.add( new SimpleGrantedAuthority( role ) );
	     return authorities;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	
	/*
	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public List<CheckPoint> getCheckpoints() {
		return checkpoints;
	}

	public void setCheckpoints(List<CheckPoint> checkpoints) {
		this.checkpoints = checkpoints;
	}

	public String getEmail_id() {
		return email_id;
	}

	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	*/
}