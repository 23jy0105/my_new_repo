package model;

import java.sql.Date;

public class Announcement {
	private String announcementNo;
	private String title;
	private String body;
	private String announcementImage;
	private Date date;
	
	public Announcement() {
		
	}

	public Announcement(String announcementNo, String title, String body, String announcementImage, Date date) {
		this.announcementNo = announcementNo;
		this.title = title;
		this.body = body;
		this.announcementImage = announcementImage;
		this.date = date;
	}

	public String getAnnouncementNo() {
		return announcementNo;
	}

	public void setAnnouncementNo(String announcementNo) {
		this.announcementNo = announcementNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getAnnouncementImage() {
		return announcementImage;
	}

	public void setAnnouncementImage(String announcementImage) {
		this.announcementImage = announcementImage;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
}
