package gefp.model;

import java.io.Serializable;
//import java.util.List;


import java.util.List;

import javax.persistence.*;

@Entity
@Table (name = "Stage")
public class Stage implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name="stage_id")
	private long id;
	
	@Basic
	@Column(name = "stage_name", nullable=false)
	private String stage_name;
	
	
	/*@JoinTable(name="STAGE_PLAN",
		joinColumns=@JoinColumn(name="stage_id",referencedColumnName="stage_id"),
		inverseJoinColumns=@JoinColumn(name="plan_id", referencedColumnName="plan_id")
	)*/
	@ManyToOne
	@JoinColumn(name="plan_id")
	private Plan plan;
	
	@Column(name="stage_index")
	private int stage_index;
	
	@OneToMany(mappedBy="stage",cascade={CascadeType.PERSIST,CascadeType.MERGE},targetEntity= Cell.class)
	private List<Cell> cells;
	
	
	
	/*
	@Basic
	@Column(name = "del_flag", nullable = false)
	private char del_flag;
		
	@ManyToMany
	@JoinTable(name="STAGE_DEPT",
				joinColumns=@JoinColumn(name="stage_id",referencedColumnName="stage_id"),
				inverseJoinColumns=@JoinColumn(name="dept_id", referencedColumnName="dept_id")
			)
	private List<Department> departments;          //Bidirectional association
	
	@OneToMany(mappedBy="stage", cascade=CascadeType.PERSIST,targetEntity= CheckPoint.class)
	private List<CheckPoint> checkpoint;
	
	@ManyToMany
	@JoinTable(name="STAGE_RUNWAY",
			   		joinColumns=@JoinColumn(name="stage_id",referencedColumnName="stage_id"),
			   		inverseJoinColumns=@JoinColumn(name="runway_id", referencedColumnName="runway_id")
			)
	private List<Runway> runways;

	*/
	


	public long getId() {
		return id;
	}

	public int getStage_index() {
		return stage_index;
	}

	public void setStage_index(int stage_index) {
		this.stage_index = stage_index;
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	public List<Cell> getCells() {
		return cells;
	}

	public void setCells(List<Cell> cells) {
		this.cells = cells;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getStage_name() {
		return stage_name;
	}

	public void setStage_name(String stage_name) {
		this.stage_name = stage_name;
	}

	/*
	public List<Department> getDepartments() {
		return departments;
	}

	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}

	public List<CheckPoint> getCheckpoint() {
		return checkpoint;
	}

	public void setCheckpoint(List<CheckPoint> checkpoint) {
		this.checkpoint = checkpoint;
	}

	public List<Runway> getRunways() {
		return runways;
	}

	public void setRunways(List<Runway> runways) {
		this.runways = runways;
	}

	public char getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(char del_flag) {
		this.del_flag = del_flag;
	}
	*/
}