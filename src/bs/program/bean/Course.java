package bs.program.bean;

public class Course {
	
	private String id;
	private String name;
	private Double allScores;
	private Integer person;
	private Integer state;
	private Integer surplusPerson;

	public Integer getSurplusPerson() {
		return surplusPerson;
	}

	public void setSurplusPerson(Integer surplusPerson) {
		this.surplusPerson = surplusPerson;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getPerson() {
		return person;
	}

	public void setPerson(Integer person) {
		this.person = person;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getAllScores() {
		return allScores;
	}
	public void setAllScores(Double allScores) {
		this.allScores = allScores;
	}
	
	
	
}
