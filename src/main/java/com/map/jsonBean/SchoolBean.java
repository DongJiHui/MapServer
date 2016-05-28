package com.map.jsonBean;

import com.map.pojo.School;

public class SchoolBean {
	  private String sId;

	    private String sName;

	    private String sAddress;

	    private String sCharacter;

	    private String sType;

	    private String sScore;
	    
	    private String sMiddlepoint;

	    private String sDescription;
	    
	    private String sUrl;

	    private String sPhone;

	    public SchoolBean(School school) {
			super();
			this.sId = school.getsId();
			this.sName = school.getsName();
			this.sAddress = school.getsAddress();
			this.sCharacter = school.getsCharacter();
			this.sType = school.getsType();
			this.sScore = school.getsScore();
			this.sMiddlepoint = school.getsMiddlepoint();
			this.sDescription = school.getsDescription();
			this.sUrl = school.getsUrl();
			this.sPhone = school.getsPhone();
		}

	    
		public SchoolBean(String sId, String sName, String sAddress,
				String sCharacter, String sType, String sScore,
				String sMiddlepoint, String sDescription, String sUrl,
				String sPhone) {
			super();
			this.sId = sId;
			this.sName = sName;
			this.sAddress = sAddress;
			this.sCharacter = sCharacter;
			this.sType = sType;
			this.sScore = sScore;
			this.sMiddlepoint = sMiddlepoint;
			this.sDescription = sDescription;
			this.sUrl = sUrl;
			this.sPhone = sPhone;
		}

		public String getsId() {
			return sId;
		}

		public void setsId(String sId) {
			this.sId = sId;
		}

		public String getsName() {
			return sName;
		}

		public void setsName(String sName) {
			this.sName = sName;
		}

		public String getsAddress() {
			return sAddress;
		}

		public void setsAddress(String sAddress) {
			this.sAddress = sAddress;
		}

		public String getsCharacter() {
			return sCharacter;
		}

		public void setsCharacter(String sCharacter) {
			this.sCharacter = sCharacter;
		}

		public String getsType() {
			return sType;
		}

		public void setsType(String sType) {
			this.sType = sType;
		}

		public String getsScore() {
			return sScore;
		}

		public void setsScore(String sScore) {
			this.sScore = sScore;
		}

		public String getsMiddlepoint() {
			return sMiddlepoint;
		}

		public void setsMiddlepoint(String sMiddlepoint) {
			this.sMiddlepoint = sMiddlepoint;
		}

		public String getsDescription() {
			return sDescription;
		}

		public void setsDescription(String sDescription) {
			this.sDescription = sDescription;
		}

		public String getsUrl() {
			return sUrl;
		}

		public void setsUrl(String sUrl) {
			this.sUrl = sUrl;
		}

		public String getsPhone() {
			return sPhone;
		}

		public void setsPhone(String sPhone) {
			this.sPhone = sPhone;
		}


}
