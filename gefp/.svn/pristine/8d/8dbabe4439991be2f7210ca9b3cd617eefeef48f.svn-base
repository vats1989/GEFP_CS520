package gefp.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
public class Plan implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name = "plan_id")
	private long id;
	
	@Basic
	@Column(name="plan_name", nullable=false)
	private String plan_name;
	
	@OneToMany(mappedBy="plan",cascade={CascadeType.PERSIST,CascadeType.MERGE},targetEntity= Stage.class)
	@OrderBy("stage_index")
	private List<Stage> stages;
	
	@OneToMany(mappedBy="plan",cascade={CascadeType.PERSIST,CascadeType.MERGE},targetEntity= Runway.class)
	@OrderBy("runway_index")
	private List<Runway> runways;
	
	@OneToMany(mappedBy="plan",cascade={CascadeType.PERSIST,CascadeType.MERGE},targetEntity= Cell.class)
	private List<Cell> cells;
	
	@Basic
	@Column(name="published_date", nullable=false)
	private Date publishedDate;
	
	@ManyToOne
	@JoinColumn(name="dept_id")
	private Department department;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getPlan_name() {
		return plan_name;
	}

	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}

	public List<Stage> getStages() {
		return stages;
	}

	public void setStages(List<Stage> stages) {
		this.stages = stages;
	}

	public List<Runway> getRunways() {
		return runways;
	}

	public void setRunways(List<Runway> runways) {
		this.runways = runways;
	}

	public List<Cell> getCells() {
		return cells;
	}

	public void setCells(List<Cell> cells) {
		this.cells = cells;
	}

	public Date getPublishedDate() {
		return publishedDate;
	}

	public void setPublishedDate(Date publishedDate) {
		this.publishedDate = publishedDate;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
}