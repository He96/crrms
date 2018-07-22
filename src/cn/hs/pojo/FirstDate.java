package cn.hs.pojo;

import java.io.Serializable;
import java.util.Date;
//第一周时间
public class FirstDate implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Date firstDate;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getFirstDate() {
		return firstDate;
	}
	public void setFastDate(Date firstDate) {
		this.firstDate = firstDate;
	} 
	
}
