/*  
 * @(#) HelloController.java Create on 2014-7-24 下午4:01:04   
 *   
 * Copyright 2014 by yhx.   
 */

package cn.test.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @HelloController.java
 * @created at 2014-7-24 下午4:01:04 by zhanghl
 * 
 * @desc
 * 
 * @author zhanghl({@link 253587517@qq.com})
 * @version $Revision$
 * @update: $Date$
 */
@Controller
@RequestMapping(value = "/")
public class HelloController {
	
	@RequestMapping("")
	public String index(){
		return "servlet3/test/index";
	}
	
	@RequestMapping(value = "/helloJSP")
	public String hello() {
		return "servlet3/test/helloJSP";
	}

	@RequestMapping(value = "/helloJARJSP")
	public String hello2() {
		return "servlet3/test/helloJARJSP";
	}

	@RequestMapping(value = "/helloHTML")
	public String hello3() {
		return "servlet3/test/helloHTML";
	}

	@RequestMapping(value = "/helloJARHTML")
	public String hello4() {
		return "servlet3/test/helloJARHTML";
	}
}
