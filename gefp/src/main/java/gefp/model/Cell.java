package gefp.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "Cell")
public class Cell implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name = "cell_id")
	private long id;
	
	@ManyToOne
	@JoinColumn(name="plan_id")
	private Plan plan;
	
	@ManyToOne
	@JoinColumn(name="runway_id")
	private Runway runway;
	
	@ManyToOne
	@JoinColumn(name="stage_id")
	private Stage stage;
	
	@OneToMany(mappedBy="cell",cascade={CascadeType.PERSIST,CascadeType.MERGE},targetEntity= CheckPoint.class)
	@OrderBy("cp_index")
	private List<CheckPoint> checkpoints;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	public Runway getRunway() {
		return runway;
	}

	public void setRunway(Runway runway) {
		this.runway = runway;
	}

	public Stage getStage() {
		return stage;
	}

	public void setStage(Stage stage) {
		this.stage = stage;
	}

	public List<CheckPoint> getCheckpoints() {
		return checkpoints;
	}

	public void setCheckpoints(List<CheckPoint> checkpoints) {
		this.checkpoints = checkpoints;
	}	
}