package com.youlove.common;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileNameUUId {

	
	
	public static String convert(MultipartFile file,String path) throws Exception{
		
		
		String saveName = "NotImage";
		
		//업로드된 파일이 없으면 NotImage 리턴
		if(!file.getOriginalFilename().equals("")) {
		
		UUID uuid = UUID.randomUUID();
		
		//파일 확장자 추출
		String ext = FilenameUtils.getExtension(file.getOriginalFilename());
		
		saveName = uuid+"."+ext;
		File f;
		if(path.equals("profileImage")) {
			f = new File("C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\YouLovePlan\\resources\\images\\captcha\\"+saveName);
			
		}else {
			//필요시 path로 적절한 값 넘겨주어 경로 수정하기
			f = new File("C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\YouLovePlan\\resources\\images\\captcha\\"+saveName);
		}
		    f.createNewFile(); 
		    FileOutputStream fos = new FileOutputStream(f); 
		    fos.write(file.getBytes());
		    fos.close(); 
		}
	    return saveName;
	}

	
}
