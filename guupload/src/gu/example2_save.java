package gu;

import com.opensymphony.xwork2.ActionSupport;


public class example2_save extends ActionSupport{
	private String brd_title, brd_contents;
	private String filename, realname;
	private String[] filelist, reallist;

	
    public String execute() throws Exception {
    	filelist = filename.split(",");
    	reallist = realname.split(",");
    	
    	for (int i=0; i<filelist.length; i++) {
    		System.out.println(filelist[i] + ":" + reallist[i]);
    	}
        return SUCCESS;
    }


	public String getBrd_title() {
		return brd_title;
	}


	public void setBrd_title(String brd_title) {
		this.brd_title = brd_title;
	}


	public String getBrd_contents() {
		return brd_contents;
	}


	public void setBrd_contents(String brd_contents) {
		this.brd_contents = brd_contents;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public String getRealname() {
		return realname;
	}


	public void setRealname(String realname) {
		this.realname = realname;
	}


	public String[] getFilelist() {
		return filelist;
	}


	public void setFilelist(String[] filelist) {
		this.filelist = filelist;
	}


	public String[] getReallist() {
		return reallist;
	}


	public void setReallist(String[] reallist) {
		this.reallist = reallist;
	}

	
}


