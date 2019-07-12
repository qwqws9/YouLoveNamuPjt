package com.youlove.web.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.youlove.service.message.MessageService;



//==> ȸ������ Controller
@RestController
@RequestMapping("/message/*")
public class MessageRestController {
	
	///Field
	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService messageService;
	//setter Method ���� ����
		
	public MessageRestController(){
		System.out.println(this.getClass());
	}
	
	//int pageSize;
	//@Value("#{commonProperties['uploadPath']}")
	//String uploadPath;

}