package com.map.jsonBean;

public class ResultBean {
	private String resultMsg;
	private int resultCode;
	private Object result;
	
	public ResultBean() {
		super();
	}
	public ResultBean(String resultMsg, int resultCode, Object result) {
		super();
		this.resultMsg = resultMsg;
		this.resultCode = resultCode;
		this.result = result;
	}
	public String getResultMsg() {
		return resultMsg;
	}
	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}
	public int getResultCode() {
		return resultCode;
	}
	public void setResultCode(int resultCode) {
		this.resultCode = resultCode;
	}
	public Object getResult() {
		return result;
	}
	public void setResult(Object result) {
		this.result = result;
	}
	
}
