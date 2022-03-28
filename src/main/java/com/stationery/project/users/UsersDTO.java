package com.stationery.project.users;

import java.sql.Date;

public class UsersDTO {

	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private Integer gender;
	private Date joinDate;
	private Integer userAccount;
	private String addressName;
	private String addressPhone;
	private Integer postalCode;
	private String addressDetail;
	private UsersFileDTO usersFileDTO;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Integer getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(Integer userAccount) {
		this.userAccount = userAccount;
	}
	public String getAddressName() {
		return addressName;
	}
	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
	public String getAddressPhone() {
		return addressPhone;
	}
	public void setAddressPhone(String addressPhone) {
		this.addressPhone = addressPhone;
	}
	public Integer getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(Integer postalCode) {
		this.postalCode = postalCode;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public UsersFileDTO getUsersFileDTO() {
		return usersFileDTO;
	}
	public void setUsersFileDTO(UsersFileDTO usersFileDTO) {
		this.usersFileDTO = usersFileDTO;
	}
}
