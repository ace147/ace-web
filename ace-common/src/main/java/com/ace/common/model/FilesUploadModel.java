package com.ace.common.model;

import java.io.InputStream;

import com.ace.common.constant.SystemConstant;
import com.ace.common.util.ContainerUtil;
import com.ace.common.util.FileHandler;


/**
 * 
 * @author Ace
 * @version 1.0
 */
public class FilesUploadModel {

	private String originFileName;
	private String newFileName;
	private InputStream fileInputStream;
	private String base64FileContent;
	private String fileRealPath;
	private String fileUri;
	private String projectName;
	private String folderName;
	private boolean isFileExists = false;

	public FilesUploadModel(String projectName, String fileUri) {
		this.fileRealPath = ContainerUtil.getContainerRealPath(projectName,
			fileUri.replace("/", System.getProperty(SystemConstant.FILE_SEPARATOR)));
	}
	
	public FilesUploadModel(String originFileName, String base64FileContent, String projectName, String folderName) {
		this.originFileName = originFileName;
		this.base64FileContent = base64FileContent;
		this.projectName = projectName;
		this.folderName = folderName;
		this.newFileName = FileHandler.createFileNameByTimeRole(originFileName);
	}

	public FilesUploadModel(String originFileName, InputStream fileInputStream, String projectName, String folderName) {
		this.originFileName = originFileName;
		this.fileInputStream = fileInputStream;
		this.projectName = projectName;
		this.folderName = folderName;
		this.newFileName = FileHandler.createFileNameByTimeRole(originFileName);
	}

	public FilesUploadModel(InputStream fileInputStream, String projectName, String folderName, String newFileName) {
		this.newFileName = newFileName;
		this.fileInputStream = fileInputStream;
		this.projectName = projectName;
		this.folderName = folderName;
	}

	public void writeFileByBinary() throws Exception {
		//根据tomcat的-Dwtp.deploy="D:\tomcat8.0\webapps" -配置获取项目的真是路径
		//folderName填写相对路径
		//this.fileRealPath = ContainerUtil.getContainerRealPath(projectName, folderName, newFileName);
		//根据folderName填写绝对路径
		//this.fileRealPath = folderName + System.getProperty(SystemConstant.FILE_SEPARATOR) + newFileName;
		//linux版
		this.fileRealPath = folderName + "/" + newFileName;
		
		this.isFileExists = FileHandler.createFileByBinary(this.fileInputStream, fileRealPath);
		//根据相对路径获取图片url
//		this.fileUri = FileHandler.getFileUri(folderName, newFileName);
		//根据绝对路径获取图片url
		//this.fileUri = fileRealPath.substring(2, fileRealPath.length())
		//		.replace(System.getProperty(SystemConstant.FILE_SEPARATOR), "/");
		//linux版
		this.fileUri = fileRealPath;
	}
	
	public void writeFileByBase64() throws Exception {
		//根据tomcat的-Dwtp.deploy="D:\tomcat8.0\webapps" -配置获取项目的真是路径
		//folderName填写相对路径
		//this.fileRealPath = ContainerUtil.getContainerRealPath(projectName, folderName, newFileName);
		
		//根据folderName填写绝对路径
//		this.fileRealPath = folderName + System.getProperty(SystemConstant.FILE_SEPARATOR) + newFileName;
		//linux版
		this.fileRealPath = folderName + "/" + newFileName;
				
		this.isFileExists = FileHandler.createFileByBase64(base64FileContent, fileRealPath);
		//根据相对路径获取图片url
		//this.fileUri = FileHandler.getFileUri(folderName, newFileName);
		//根据绝对路径获取图片url
//		this.fileUri = fileRealPath.substring(2, fileRealPath.length())
//				.replace(System.getProperty(SystemConstant.FILE_SEPARATOR), "/");
		//linux版
		this.fileUri = fileRealPath;
	}

	public void deleteFile() {
		new java.io.File(this.fileRealPath).deleteOnExit();
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public String getNewFileName() {
		return newFileName;
	}

	public String getFileRealPath() {
		return fileRealPath;
	}

	public String getFileUri() {
		return fileUri;
	}

	public boolean isFileExists() {
		return isFileExists;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

}
