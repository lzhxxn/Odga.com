package odga.bt.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletContextAware;


@Controller
@RequestMapping("/photo")
public class SEController implements ServletContextAware {
	
	private ServletContext context;
	
	@PostMapping(value="/multiplePhotoUpload.do")
	public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response) 
			throws IOException {
		String sFileInfo = "";
		String name = request.getHeader("file-name");
		String ext = name.substring(name.lastIndexOf(".")+1);
		String root = request.getContextPath() + "/resources";
		String defaultPath = context.getRealPath("/resources");
		String path = defaultPath + File.separator + "upload" + File.separator;
		File file = new File(path);
		if(!file.exists()) {
		  file.mkdirs();
		}
		String realname = UUID.randomUUID().toString() + "." + ext;
		InputStream is = request.getInputStream();
		String storedFileName = path + realname;
		OutputStream os=new FileOutputStream(storedFileName);
		int numRead;
		byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
		while((numRead = is.read(b,0,b.length)) != -1){
		  os.write(b,0,numRead);
		}
		if(is != null) {
		  is.close();
		}
		os.flush();
		os.close();

		sFileInfo += "&bNewLine=true&sFileName="+ name+"&sFileURL=" + root + "/upload/"+realname;
		PrintWriter out = response.getWriter();
		out.println(sFileInfo);
	}
	
/*	@PostMapping(value="/photoUpload.do")
	public void file_uploader(HttpServletRequest request, HttpServletResponse response) throws IOException, FileUploadException {
		request.setCharacterEncoding("utf-8");
		String return1="";
		String return2="";
		String return3="";
		String name = "";
		if (ServletFileUpload.isMultipartContent(request)){
		    ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		    uploadHandler.setHeaderEncoding("UTF-8");
		    List<FileItem> items = uploadHandler.parseRequest(request);
		    for (FileItem item : items) {
		        if(item.getFieldName().equals("callback")) {
		            return1 = item.getString("UTF-8");
		        } else if(item.getFieldName().equals("callback_func")) {
		            return2 = "?callback_func="+item.getString("UTF-8");
		        } else if(item.getFieldName().equals("Filedata")) {
		            if(item.getSize() > 0) {
		            	name = item.getName();
		                String ext = item.getName().substring(item.getName().lastIndexOf(".")+1);
		                String defaultPath = context.getRealPath("/");
		                String path = defaultPath + "upload" + File.separator;
		                 
		                File file = new File(path);
		                 
		                if(!file.exists()) {
		                    file.mkdirs();
		                }
		                String realname = UUID.randomUUID().toString() + "." + ext;
		                InputStream is = item.getInputStream();
		                OutputStream os=new FileOutputStream(path + realname);
		                int numRead;
		                byte b[] = new byte[(int)item.getSize()];
		                while((numRead = is.read(b,0,b.length)) != -1){
		                    os.write(b,0,numRead);
		                }
		                if(is != null)  is.close();
		                os.flush();
		                os.close();
		                String root = request.getContextPath();

		                return3 += "&bNewLine=true&sFileName="+name+"&sFileURL=" + root + "/upload/"+realname;	// by ksseo
		            }else {
		                return3 += "&errstr=error";
		            }
		        }
		    }
		}
		response.sendRedirect(return1+return2+return3);
	}*/
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.context = servletContext;
	}
}