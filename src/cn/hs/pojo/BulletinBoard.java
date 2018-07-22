package cn.hs.pojo;
//公告

import java.io.Serializable;
import java.util.Date;
//公告栏
public class BulletinBoard implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String bulletinTitle;//标题
	private String bulletinContent;//内容
	private Date bulletinDate;//发布时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBulletinTitle() {
		return bulletinTitle;
	}
	public void setBulletinTitle(String bulletinTitle) {
		this.bulletinTitle = bulletinTitle;
	}
	public String getBulletinContent() {
		return bulletinContent;
	}
	public void setBulletinContent(String bulletinContent) {
		this.bulletinContent = bulletinContent;
	}
	public Date getBulletinDate() {
		return bulletinDate;
	}
	public void setBulletinDate(Date bulletinDate) {
		this.bulletinDate = bulletinDate;
	}
	
	
}
