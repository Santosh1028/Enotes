package com.enotes.pojo;

import java.util.Date;

public class Note {
	
	private int id;
	private String title;
	private String content;
	private Date date;
	private User user;
	public Note() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Note(int id, String title, String content, Date date, User user) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.user = user;
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the date
	 */
	public Date getDate() {
		return date;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(Date date) {
		this.date = date;
	}
	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}
	/**
	 * @param user the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Note [id=" + id + ", title=" + title + ", content=" + content + ", date=" + date + ", user=" + user
				+ "]";
	}
	
	

}
