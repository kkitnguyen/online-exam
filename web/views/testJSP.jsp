<%-- 
    Document   : testJSP
    Created on : Oct 22, 2020, 12:39:49 AM
    Author     : KK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method="post" action="${pageContext.request.contextPath}/test"
        enctype="multipart/form-data">
        
        Select file to upload:
        <br />
        <input type="file" name="file"  />

        <input type="submit" value="Upload" />
    </form>
    </body>
</html>
