package gu;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;


public class upload extends ActionSupport{
	private File Filedata;
	//private String mphotoFileName;	
	private String newfilename; 
	
    public String execute() throws Exception {
    	SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
    	newfilename = df.format(new Date());
        return SUCCESS;
    }

	public File getFiledata() {
		return Filedata;
	}

	public void setFiledata(File filedata) {
		Filedata = filedata;
	}

	public String getNewfilename() {
		return newfilename;
	}

	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}
	
}


