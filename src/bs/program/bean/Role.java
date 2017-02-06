package bs.program.bean;

import java.sql.Date;

public class Role {
	
	private String id;
	private Integer codeValue;
	private String name;
	private String createby;
	private Date createDate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getCodeValue() {
		return codeValue;
	}
	public void setCodeValue(Integer codeValue) {
		this.codeValue = codeValue;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCreateby() {
		return createby;
	}
	public void setCreateby(String createby) {
		this.createby = createby;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
	
}
