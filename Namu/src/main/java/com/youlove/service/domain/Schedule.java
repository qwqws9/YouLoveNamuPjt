package com.youlove.service.domain;

import java.sql.Date;

public class Schedule {

		///Field
		private int scheCode;
		private int plannerVer;
		private Date scheDay;
		private String timeHour;
		private String timeMin;
		
		private String scheName;
		private String schePlace;
		private String scheDetail;
	
		private String accomodation;
//		private Planner plannerCode;
//		private Route routeCode;
		private int plannerCode;
		private int routeCode;
		private String color;
		
		///Constructor
		public Schedule(){
		}

		public int getScheCode() {
			return scheCode;
		}

		public void setScheCode(int scheCode) {
			this.scheCode = scheCode;
		}

		public int getPlannerVer() {
			return plannerVer;
		}

		public void setPlannerVer(int plannerVer) {
			this.plannerVer = plannerVer;
		}

		public Date getScheDay() {
			return scheDay;
		}

		public void setScheDay(Date scheDay) {
			this.scheDay = scheDay;
		}

		public String getTimeHour() {
			return timeHour;
		}

		public void setTimeHour(String timeHour) {
			this.timeHour = timeHour;
		}

		public String getTimeMin() {
			return timeMin;
		}

		public void setTimeMin(String  timeMin) {
			this.timeMin = timeMin;
		}

		public String getScheName() {
			return scheName;
		}

		public void setScheName(String scheName) {
			this.scheName = scheName;
		}

		public String getSchePlace() {
			return schePlace;
		}

		public void setSchePlace(String schePlace) {
			this.schePlace = schePlace;
		}

		public String getScheDetail() {
			return scheDetail;
		}

		public void setScheDetail(String scheDetail) {
			this.scheDetail = scheDetail;
		}

		public String getAccomodation() {
			return accomodation;
		}

		public void setAccomodation(String accomodation) {
			this.accomodation = accomodation;
		}

		public int getPlannerCode() {
			return plannerCode;
		}

		public void setPlannerCode(int plannerCode) {
			this.plannerCode = plannerCode;
		}

		public int getRouteCode() {
			return routeCode;
		}

		public void setRouteCode(int routeCode) {
			this.routeCode = routeCode;
		}

		
		
		public String getColor() {
			return color;
		}

		public void setColor(String color) {
			this.color = color;
		}

		@Override
		public String toString() {
			return "Schedule [scheCode=" + scheCode + ", plannerVer=" + plannerVer + ", scheDay=" + scheDay
					+ ", timeHour=" + timeHour + ", timeMin=" + timeMin + ", scheName=" + scheName + ", schePlace="
					+ schePlace + ", scheDetail=" + scheDetail + ", accomodation=" + accomodation + ", plannerCode="
					+ plannerCode + ", routeCode=" + routeCode + ", color=" + color + "]";
		}

}
