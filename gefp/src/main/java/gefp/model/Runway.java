package gefp.model;

import java.io.Serializable;
//import java.util.List;



import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "Runway")
public class Runway implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name="runway_id")
	private long id;
	
	@Basic
	@Column(name = "runway_name", nullable=false)
	private String runway_name;
		
	
	/*@JoinTable(name="RUNWAY_PLAN",
				joinColumns=@JoinColumn(name="runway_id",referencedColumnName="runway_id"),
				inverseJoinColumns=@JoinColumn(name="plan_id", referencedColumnName="plan_id")
			)*/
	@ManyToOne
	@JoinColumn(name="plan_id")
	private Plan plan;
	
	@OneToMany(mappedBy="runway",cascade={CascadeType.PERSIST,CascadeType.MERGE},targetEntity= Cell.class)
	private List<Cell> cells;
	
	@Column(name="runway_index")
	private int runway_index;
	
	
	
	
	/*
	@Basic
	@Column(name = "del_flag", nullable = false)
	private char del_flag ;
	
	@ManyToMany(mappedBy="runways", fetch=FetchType.LAZY)
	private List<Stage> stage;
	
	@ManyToMany
	@JoinTable(name="RUNWAY_DEPT",
				joinColumns=@JoinColumn(name="runway_id",referencedColumnName="runway_id"),
				inverseJoinColumns=@JoinColumn(name="dept_id", referencedColumnName="dept_id")
			)
	private List<Department> departments;   //Bidirectional association
	
	@OneToMany(mappedBy="runway", cascade=CascadeType.PERSIST, targetEntity= CheckPoint.class)
	private List<CheckPoint> checkpoints;
	*/
	
	
	
	public List<Cell> getCells() {
		return cells;
	}
	
	public int getRunway_index() {
		return runway_index;
	}

	public void setRunway_index(int runway_index) {
		this.runway_index = runway_index;
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	public void setCells(List<Cell> cells) {
		this.cells = cells;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getRunway_name() {
		return runway_name;
	}

	public void setRunway_name(String runway_name) {
		this.runway_name = runway_name;
	}

	/*
	public List<Stage> getStage() {
		return stage;
	}

	public void setStage(List<Stage> stage) {
		this.stage = stage;
	}

	public List<Department> getDepartments() {
		return departments;
	}

	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}

	public List<CheckPoint> getCheckpoints() {
		return checkpoints;
	}

	public void setCheckpoints(List<CheckPoint> checkpoints) {
		this.checkpoints = checkpoints;
	}

	public char getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(char del_flag) {
		this.del_flag = del_flag;
	}
	*/
}