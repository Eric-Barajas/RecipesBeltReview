<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach JSP tags etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tacos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>Welcome, <c:out value="${user.userName}" /></h1>
		<a href="/questions/new">Ask a Question</a>
		<table class="table">
			<thead>
				<tr>
					<th>Question</th>
					<th>Creator</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="question" items="${allQuestions}">
					<tr>
						<td><c:out value="${question.text}" /></td>
						<td><c:out value="${question.creator.userName}" /></td>
						<td>
							<c:if test="${user_id == question.creator.id }">
								<a href="">Edit</a>
								<form action="/questions/${question.id}" method="POST">
									<input type="hidden" name="_method" value="DELETE" />
									<button>Delete</button>
								</form>
								<a href="/questions/${question.id}/delete">DELETE</a>
							</c:if>
							<a href="">Show</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
<!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>