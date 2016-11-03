package com.util.ACGT.main;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;


import com.util.ACGT.constant.PrefixAndSuffix;
import com.util.ACGT.tools.StringUtil;
import com.util.ACGT.vo.ColumnVo;
import com.util.ACGT.vo.EntityVo;





/** 
* @author Ace
* @date 2016/11/30 
*/
public class Demo {
    //文件路径+名称
    private static String filenameTemp;
    /**
     * 创建文件
     * @param fileName  文件名称
     * @param filecontent   文件内容
     * @return  是否创建成功，成功则返回true
     */
    public static boolean createFile(String fileName,String filecontent,String fileType){
        Boolean bool = false;
        //写出文件后缀
        String suffixPath="";
        if ("java".equals(fileType))
        	suffixPath=PrefixAndSuffix.PATH_JAVA_WRITE_SUFFIX_CODE;
        if("js".equals(fileType))
        	suffixPath=PrefixAndSuffix.PATH_JS_WRITE_SUFFIX_CODE;
        if("jsp".equals(fileType))
        	suffixPath=PrefixAndSuffix.PATH_JSP_WRITE_SUFFIX_CODE;
        
        filenameTemp = PrefixAndSuffix.PATH_WRITE_PREFIX_CODE+fileName+suffixPath;//文件路径+名称+文件类型
        File file = new File(filenameTemp);
//        boolean b=file.mkdirs();
        try {
            //如果文件不存在，则创建新的文件
            if(!file.exists()){
                file.createNewFile();
                bool = true;
                System.out.println("success create file,the file is "+filenameTemp);
               
                //创建文件成功后，写入内容到文件里
                writeFileContent(filenameTemp, filecontent);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return bool;
    }
    
    /**
     * @author Ace
     * 替换模板
     * @param content
     * @return
     */
    public static String replaceTemplete(String content,EntityVo entityVo,String type){
    	if("Entity".equals(type))
    		content=ReplaceTemplete.replaceEntity(content, entityVo);
    	if("Controller".equals(type))
    		content=ReplaceTemplete.replaceContrallor(content, entityVo);
    	if("Service".equals(type))
    		content=ReplaceTemplete.replaceService(content, entityVo);
    	if("ServiceImpl".equals(type))
    		content=ReplaceTemplete.replaceServiceImpl(content, entityVo);
    	if("Dao".equals(type))
    		content=ReplaceTemplete.replaceDao(content, entityVo);
    	if("DaoImpl".equals(type))
    		content=ReplaceTemplete.replaceDaoImpl(content, entityVo);
    	if("Condition".equals(type))
    		content=ReplaceTemplete.replaceCondition(content, entityVo);
    	if("DetailVo".equals(type))
    		content=ReplaceTemplete.replaceDetailVo(content, entityVo);
    	if("ListVo".equals(type))
    		content=ReplaceTemplete.replaceListVo(content, entityVo);
    	return content;
    }
    
   
    
    
    
    /**
     * 向文件中写入内容
     * @param filepath 文件路径与名称
     * @param newstr  写入的内容
     * @return
     * @throws IOException
     */
    public static boolean writeFileContent(String filepath,String newstr) throws IOException{
        Boolean bool = false;
        String filein = newstr+"\r\n";//新写入的行，换行
        String temp  = "";
        
        FileInputStream fis = null;
        InputStreamReader isr = null;
        BufferedReader br = null;
        FileOutputStream fos  = null;
        PrintWriter pw = null;
        try {
            File file = new File(filepath);//文件路径(包括文件名称)
            //将文件读入输入流
            fis = new FileInputStream(file);
            isr = new InputStreamReader(fis);
            br = new BufferedReader(isr);
            StringBuffer buffer = new StringBuffer();
            
            //文件原有内容
            for(int i=0;(temp =br.readLine())!=null;i++){
                buffer.append(temp);
                // 行与行之间的分隔符 相当于“\n”
                buffer = buffer.append(System.getProperty("line.separator"));
            }
            buffer.append(filein);
            
            fos = new FileOutputStream(file);
            pw = new PrintWriter(fos);
            pw.write(buffer.toString().toCharArray());
            pw.flush();
            bool = true;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally {
            //不要忘记关闭
            if (pw != null) {
                pw.close();
            }
            if (fos != null) {
                fos.close();
            }
            if (br != null) {
                br.close();
            }
            if (isr != null) {
                isr.close();
            }
            if (fis != null) {
                fis.close();
            }
        }
        return bool;
    }
    
    /**
     *
     * @param args
     * @throws Exception
     */
    public static void main(String[] args) throws Exception {
//    	String myFile="testcopfy";
////    	String content=readtxt();
//    	String content=readFile(PrefixAndSuffix.PATH_READ_PREFIX_TEMPLETE+Templete.+PrefixAndSuffix.PATH_READ_SUFFIX_TEMPLETE);
//        createFile(myFile, content);
//        writeFileContent(myFile, content);
    	  try {
    		  EntityVo entityVo=new EntityVo();
    		  entityVo.setAuthor("ace");
    		  entityVo.setEntityName("Human");
    		  entityVo.setTableName("HUMAN");
    		  entityVo.setDescription("人类");
    		  List<ColumnVo> columnVos=new ArrayList<ColumnVo>();
    		  ColumnVo columnVo=new ColumnVo();
    		  columnVo.setColumnName("hair");
    		  columnVo.setLength("20");
    		  columnVo.setType("String");
    		  columnVo.setRemark("头发");
    		  columnVo.setIsDetailVo("Y");
    		  columnVo.setIsListVo("Y");
    		  columnVo.setIsSreach("Y");
    		  ColumnVo columnVo2=new ColumnVo();
    		  columnVo2.setColumnName("eyes");
    		  columnVo2.setLength("2");
    		  columnVo2.setType("Integer");
    		  columnVo2.setIsDetailVo("Y");
    		  columnVo2.setIsListVo("Y");
    		  columnVo2.setIsSreach("Y");
    		  columnVos.add(columnVo);
    		  columnVos.add(columnVo2);
    		  entityVo.setListColumn(columnVos);
    		  AGCT(entityVo);
    		  
    		   
    		
    		  } catch(Exception e) {
    		   e.printStackTrace();
    		  }
    		  
    }
    
    
     /**
      * 读取文件
      * @author Ace
      * @param filePathAndName
      * @return
      */
       public static String readFile(String filePathAndName) {
        	  StringBuffer fileContent = new StringBuffer();
        	  try {  
        	   File f = new File(filePathAndName);
        	   if(f.isFile()&&f.exists()){
        	    InputStreamReader read = new InputStreamReader(new FileInputStream(f),"UTF-8");
        	    BufferedReader reader=new BufferedReader(read);
        	    String line;
        	    while ((line = reader.readLine()) != null) {
        	     fileContent.append(line);
        	     fileContent.append("\r\n");
        	    }   
        	    read.close();
        	   }
        	  } catch (Exception e) {
        	   System.out.println("读取文件内容操作出错");
        	   e.printStackTrace();
        	  }
        	  return fileContent.toString();
        }
       
       public static void AGCT(EntityVo entityVo){
    	   String fileType="";
    	   Class clazz;
    	   String myFile="";
    	   String fileName="";
		try {
			clazz = Class.forName("com.util.ACGT.constant.Templete");
			String entityName= StringUtil.uppercaseFirstLetter(entityVo.getEntityName());
			Field[] fields = clazz.getDeclaredFields();//根据Class对象获得属性 私有的也可以获得
			   for(Field f : fields) {
				if(f.getName().contains("JAVA"))
					fileType="java";
				if(f.getName().contains("JS"))
					fileType="js";
				if(f.getName().contains("JSP"))
					fileType="jsp";
			 	myFile=(String) f.get(clazz.newInstance());
			 	//读取文件
		    	String content=readFile(PrefixAndSuffix.PATH_READ_PREFIX_TEMPLETE+myFile+PrefixAndSuffix.PATH_READ_SUFFIX_TEMPLETE);
		    	//替换文件
		    	content=replaceTemplete(content,entityVo,myFile);
		    	//创建文件
		    	fileName=entityName+myFile;
		        createFile(fileName, content,fileType);
			   }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
       }
}