package Project.DTO;

public class CalendarDTO {

	                        
	
	private int version_no;
	private int project_no;
	private String project_name;
	private String version_start;
	private String version_end;
	private String version_title;
	private String version_content;
	public int getVersion_no() {
		return version_no;
	}
	public void setVersion_no(int version_no) {
		this.version_no = version_no;
	}
	public int getProject_no() {
		return project_no;
	}
	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getVersion_start() {
		return version_start;
	}
	public void setVersion_start(String version_start) {
		this.version_start = version_start;
	}
	public String getVersion_end() {
		return version_end;
	}
	public void setVersion_end(String version_end) {
		this.version_end = version_end;
	}
	public String getVersion_title() {
		return version_title;
	}
	public void setVersion_title(String version_title) {
		this.version_title = version_title;
	}
	public String getVersion_content() {
		return version_content;
	}
	public void setVersion_content(String version_content) {
		this.version_content = version_content;
	}
	@Override
	public String toString() {
		return "CalendarDTO [version_no=" + version_no + ", project_no=" + project_no + ", project_name=" + project_name
				+ ", version_start=" + version_start + ", version_end=" + version_end + ", version_title="
				+ version_title + ", version_content=" + version_content + "]";
	}
	
	
	
	
	
}
