package gefp.model;

import java.io.Serializable;
//import java.net.URL;
//import java.util.List;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "CheckPoint")
public class CheckPoint implements Serializable	{
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name = "checkpoint_id")
	private long id;
	
	@Column (name = "checkpoint_name", nullable= false)
	private String checkPoint_name;

	@Column(name="cp_index")
	private int cp_index;
	
	/*
	@Basic(fetch=FetchType.LAZY)
    @Column(name="URL", nullable=true)
    private URL url;
	
	@Basic(fetch=FetchType.LAZY)
	@Lob @Column(name="PIC", nullable=true)
	private byte[] picture;
	
	@Basic(fetch=FetchType.LAZY)
	@Lob @Column(nullable=true)
	private String extra_text;
	
	@ManyToOne
	@JoinColumn(name="stage_id")
	private Stage stage;					   //Bidirectional Association
	
	@ManyToOne
	@JoinColumn(name="runway_id")
	private Runway runway;                     //Bidirectional Association
	
	@ManyToOne
	@JoinColumn(name="dept_id")
	private Department department;             //Bidirectional Association
	
	@Basic
	@Column(name = "del_flag", nullable = false)
	private char del_flag;
	*/
	
	@ManyToMany//(fetch=FetchType.EAGER)
	@JoinTable(name="USER_CHECKPOINTS",
				joinColumns=@JoinColumn(name="checkpoint_id",referencedColumnName="checkpoint_id"),
				inverseJoinColumns=@JoinColumn(name="user_id", referencedColumnName="user_id")
			)
	private List<User> users;					//Bidirectional Association

	
	@ManyToOne
	@JoinColumn(name="cell_id")
	private Cell cell;             //Bidirectional Association
	
	
	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCheckPoint_name() {
		return checkPoint_name;
	}

	public void setCheckPoint_name(String checkPoint_name) {
		this.checkPoint_name = checkPoint_name;
	}

	public Cell getCell() {
		return cell;
	}

	public void setCell(Cell cell) {
		this.cell = cell;
	}

	public int getCp_index() {
		return cp_index;
	}

	public void setCp_index(int cp_index) {
		this.cp_index = cp_index;
	}
	
	
	/*
	public URL getUrl() {
		return url;
	}

	public void setUrl(URL url) {
		this.url = url;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public String getExtra_text() {
		return extra_text;
	}

	public void setExtra_text(String extra_text) {
		this.extra_text = extra_text;
	}

	public Stage getStage() {
		return stage;
	}

	public void setStage(Stage stage) {
		this.stage = stage;
	}

	public Runway getRunway() {
		return runway;
	}

	public void setRunway(Runway runway) {
		this.runway = runway;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public char getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(char del_flag) {
		this.del_flag = del_flag;
	}
	*/
}