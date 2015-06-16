<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.*"%>
<%@page import="java.io.FileNotFoundException"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	// 입력된 정보들을 읽어와서 변수에 저장한다.
	String email = request.getParameter("email");
	String inputUsername = request.getParameter("user_name");
	String inputPassword = request.getParameter("password");
	String type = request.getParameter("type");
	
	FileWriter writer = null;
	BufferedReader reader = null;
	
	// 경로 설정
	// sftp://119.81.246.231//root/apache-tomcat-7.0.62/webapps/WP/TP2/WEB-INF
	String directory = application.getRealPath("TP2/WEB-INF");
	File dir = new File(directory);
	String filePath = directory + "/" + email + ".json";
	
	// 폴더가 없으면 생성
	if (!dir.exists()) {
		dir.mkdir();
	}
	
	// Login
	if (type.equals("login")) {
		
		JSONParser parser = new JSONParser();
		
		try {		
			// 파일을 읽어온다.
			//reader = new BufferedReader(new FileReader(filePath));
			Object obj = parser.parse(new FileReader(filePath));			
			JSONObject jsonObject = (JSONObject) obj;
			JSONObject user = (JSONObject) jsonObject.get("userinfo");
			
			// username, password를 읽어옴.
			// String username = reader.readLine();
			// String password = reader.readLine();
			String username = (String) user.get("username");
			String password = (String) user.get("password"); 
			
			// 입력된 password와 저장된 password가 일치하면
			if (inputPassword.equals(password)) {
				// 아이디와 이메일을 sesssion에 추가
				session.setAttribute("WNUserName", username);
				session.setAttribute("WNEmail", email);
				out.println("<script>alert('" + email + "님 Login');</script>");
				out.print("<script>location.href='main.jsp';</script>");
			}
			// 비밀번호가 일치하지 않는 경우
			else {
				out.println("<script>alert('Password가 일치하지 않습니다.\\nindex.jsp로 돌아갑니다.');</script>");
				out.print("<script>location.href='index.jsp';</script>");
			}
			
			// reader.close();
					
		}
		// 해당 이메일에 대한 정보가 존재하지 않는 경우.
		catch (IOException oe) {	
			out.println("<script>alert('입력된 E-mail에 관한 정보가 존재하지 않습니다.\\nindex.jsp로 돌아갑니다.');</script>");
			out.print("<script>location.href='index.jsp';</script>");
		}
	}
	
	// sign up
	else {
		try {		
			reader = new BufferedReader(new FileReader(filePath));
			// 파일이 존재하는 경우, (이미 해당 이메일로 가입 이력이 있는 경우)
			reader.close();
			out.println("<script>alert('이미 존재하는 E-mail입니다.\\n다른 E-mail을 입력해 주세요.');</script>");
			out.print("<script>location.href='index.jsp';</script>");
			
		}
		// 파일이 존재하지 않는 경우,
		catch (IOException oe) {
			// Create Json Object
			JSONObject jObj = new JSONObject();
			JSONObject jUser = new JSONObject();
			
			jUser.put("username", inputUsername);
			jUser.put("password", inputPassword);
			jObj.put("userinfo", jUser);

			try {
				// 해당 이메일로 새로운 파일 작성.
				writer = new FileWriter(filePath);
				writer.write(jObj.toJSONString());
				writer.flush();
				writer.close();
				
				
				// writer.println(inputUsername);
				// writer.println(inputPassword);	
			}
			catch (IOException ie) {
				out.println("<script>alert('파일 작성중 에러가 발생했습니다.\\n다시 시도해 주세요.');</script>");
				out.print("<script>location.href='index.jsp';</script>");
			}
			finally {
				// 가입이 정상적으로 이루어진 경우
				try {
					writer.close();	// file을 닫고,
					session.setAttribute("WNUserName", inputUsername);	// session에 정보 추가
					session.setAttribute("WNEmail", email);
					out.println("<script>alert('" + inputUsername + "님, 가입 되었습니다.');</script>");
					out.print("<script>location.href='main.jsp?username=" + inputUsername +"';</script>");
				} catch (Exception e) {
					out.println("<script>alert('파일 작성중 에러가 발생했습니다.\\n다시 시도해 주세요.');</script>");
					out.print("<script>location.href='index.jsp';</script>");
				}
			}
		}
	}
	
	
%>