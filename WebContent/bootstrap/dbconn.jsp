<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sql:setDataSource
		var = "dataSource"
		url = "jdbc:oracle:thin:@localhost:1521:orcl"
		driver = "oracle.jdbc.driver.OracleDriver"
		user = "fadmin"
		password = "fadmin1234"
	/>
</body>
</html>



