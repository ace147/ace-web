package com.ace.common;

public class ResponseJson {
	
	private boolean status;
	
    private String message;
    
    private Object data;
    
    public ResponseJson(){
    	this.status=true;
    	this.message=StatusCode.SUCCESS_MESSAGE;
    	this.data=null;
    }


	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}



	public Object getData() {
		return data;
	}


	public void setData(Object data) {
		this.data = data;
	}


	public boolean isStatus() {
		return status;
	}


	public void setStatus(boolean status) {
		this.status = status;
	}


    
    
    
}
