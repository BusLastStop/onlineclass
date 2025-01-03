package com.onlineclass.member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.student.service.StudentService;
import com.onlineclass.teacher.service.TeacherService;

/**
 * Servlet implementation class FindPwEndServlet
 */
@WebServlet("/member/findpwend.do")
public class FindPwEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 임시로 alert 창으로 비밀번호를 알려주는 기능으로 설정함.
		String type = request.getParameter("userType");
		String id = request.getParameter("userId");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
				
		String pw = null;
		
		String msg="", loc="";
		if(type.equals("학생")) {
			int count = 0;
			String tempPw = "";
			if(email!="") {
				Map<String, String> info = Map.of("id",id,"name",name,"email",email);
				count = new StudentService().findStudentEmail(info);
				if(count>0) {
					for(int i=0;i<8;i++) {
						switch((int)(Math.random()*3)) {
							case 0: tempPw+=(char)((int)(Math.random()*10)+48); break;
							case 1: tempPw+=(char)((int)(Math.random()*26)+97); break;
							case 2:
							default: tempPw+=(char)((int)(Math.random()*26)+65); break;
						}
						System.out.println(tempPw);
					}
					// 여기서 이메일로 비밀번호를 전송하기
					// 임시로 alert를 사용해서 비밀번호를 알려줌
					msg = "임시 비밀번호는 "+tempPw+"입니다.";
					loc = "/student/temppw.do?userId="+id+"&userPw="+tempPw+"&email="+email;
				}else {
					msg = "아이디가 존재하지 않습니다!";
					loc = "/member/findpw.do";
				}
				
			}else if(phone!="") {
				Map<String, String> info = Map.of("id",id,"name",name,"phone",phone);
				count = new StudentService().findStudentPhone(info);
				if(count>0) {
					for(int i=0;i<8;i++) {
						switch((int)(Math.random()*3)) {
							case 0: tempPw+=(char)((int)(Math.random()*10)+48); break;
							case 1: tempPw+=(char)((int)(Math.random()*26)+97); break;
							case 2:
							default: tempPw+=(char)((int)(Math.random()*26)+65); break;
						}
					}
					// 여기서 전화번호로 비밀번호를 전송하기
					// 임시로 alert를 사용해서 비밀번호를 알려줌
					msg = "임시 비밀번호는 "+tempPw+"입니다.";
					loc = "/student/temppw.do?userId="+id+"&userPw="+tempPw+"&phone="+phone;
				}else {
					msg = "아이디가 존재하지 않습니다!";
					loc = "/member/findpw.do";
				}
			}else {
				msg = "잘못된 접근입니다!";
				loc = "/";
			}
			
		}else if(type.equals("강사")) {
			int count = 0;
			String tempPw = "";
			if(email!="") {
				Map<String, String> info = Map.of("id",id,"name",name,"email",email);
				count = new TeacherService().findTeacherEmail(info);
				if(count>0) {
					for(int i=0;i<8;i++) {
						switch((int)(Math.random()*3)) {
							case 0: tempPw+=(char)((int)(Math.random()*10)+48); break;
							case 1: tempPw+=(char)((int)(Math.random()*26)+97); break;
							case 2:
							default: tempPw+=(char)((int)(Math.random()*26)+65); break;
						}
					}
					
					// 여기서 이메일로 비밀번호를 전송하기
					Properties props = new Properties();
					props.put("mail.smtp.host", "smtp.gmail.com");
					props.put("mail.smtp.auth", "true");
					props.put("mail.smtp.port",587);
					props.put("mail.smtp.starttls.enable","true");
					
					Session session = Session.getDefaultInstance(props, 
						new Authenticator() {
							protected PasswordAuthentication getPasswordAuthentication() {
								return new PasswordAuthentication("kkjjj16@gmail.com","nyee jokk uude mgbo");
							}
					});

					session.setDebug(true);
							
					try {
						Message message = new MimeMessage(session);
						message.setFrom(new InternetAddress("kkjjj16@gmail.com", "Test"));
						message.addRecipient(Message.RecipientType.TO,
									new InternetAddress(email, name));
						message.setSubject("Send OnlineClass Password");
						message.setText("Your temporary password is "+ tempPw);
						Transport.send(message);
					} catch (AddressException e) {
						e.printStackTrace();
					} catch (MessagingException e) {
						e.printStackTrace();
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					
					// 임시로 alert를 사용해서 비밀번호를 알려줌
					msg = "임시 비밀번호는 "+tempPw+"입니다.";
					loc = "/teacher/temppw.do?userId="+id+"&userPw="+tempPw+"&email="+email;
				}else {
					msg = "아이디가 존재하지 않습니다!";
					loc = "/member/findpw.do";
				}
			}else if(phone!="") {
				Map<String, String> info = Map.of("id",id,"name",name,"phone",phone);
				count = new TeacherService().findTeacherPhone(info);
				if(count>0) {
					for(int i=0;i<8;i++) {
						switch((int)(Math.random()*3)) {
							case 0: tempPw+=(char)((int)(Math.random()*10)+48); break;
							case 1: tempPw+=(char)((int)(Math.random()*26)+97); break;
							case 2:
							default: tempPw+=(char)((int)(Math.random()*26)+65); break;
						}
					}
					// 여기서 전화번호로 비밀번호를 전송하기
					// 임시로 alert를 사용해서 비밀번호를 알려줌
					msg = "임시 비밀번호는 "+tempPw+"입니다.";
					loc = "/teacher/temppw.do?userId="+id+"&userPw="+tempPw+"&phone="+phone;
				}else {
					msg = "아이디가 존재하지 않습니다!";
					loc = "/member/findpw.do";
				}
			}else {
				msg = "잘못된 접근입니다!";
				loc = "/";
			}
		}else {
			msg = "잘못된 접근입니다!";
			loc = "/";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
