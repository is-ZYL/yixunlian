package com.gm.common.bean;

import java.util.Date;

public class HtmlPojo {

	private String filePath;
	private String htmlFile;
	private String title;
	private String context;
	private String type;
	private String upPage;
	private String nextPage;

	private String upPageTitle;
	private String nextPageTitle;
	private Integer clickNum;
	private Date date;
	private String author;

	public Integer getClickNum() {
		return clickNum;
	}

	public void setClickNum(Integer clickNum) {
		this.clickNum = clickNum;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getUpPageTitle() {
		return upPageTitle;
	}

	public void setUpPageTitle(String upPageTitle) {
		this.upPageTitle = upPageTitle;
	}

	public String getNextPageTitle() {
		return nextPageTitle;
	}

	public void setNextPageTitle(String nextPageTitle) {
		this.nextPageTitle = nextPageTitle;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getHtmlFile() {
		return htmlFile;
	}

	public void setHtmlFile(String htmlFile) {
		this.htmlFile = htmlFile;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUpPage() {
		return upPage;
	}

	public void setUpPage(String upPage) {
		this.upPage = upPage;
	}

	public String getNextPage() {
		return nextPage;
	}

	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}

}
