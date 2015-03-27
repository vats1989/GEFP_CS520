package gefp.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

@Entity
public class Department implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name="dept_id")
	private long id;
	
	@Basic
	@Column(name="dept_name", nullable=false)
	private String dept_name;

	@OneToOne
	private Plan currentPlan;
	
	@OneToMany(mappedBy="department",cascade={CascadeType.PERSIST,CascadeType.MERGE},targetEntity= Plan.class)
	private List<Plan> plans;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public Plan getCurrentPlan() {
		return currentPlan;
	}

	public void setCurrentPlan(Plan currentPlan) {
		this.currentPlan = currentPlan;
	}

	public List<Plan> getPlans() {
		return plans;
	}

	public void setPlans(List<Plan> plans) {
		this.plans = plans;
	}
}