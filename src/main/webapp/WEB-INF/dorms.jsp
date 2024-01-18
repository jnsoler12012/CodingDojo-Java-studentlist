<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>All Dorms</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">


</head>
<body>
	<main class="text-center">
		<h2>All Dormitories</h2>
		<table class="table table-striped w-50 m-auto">
			<thead>
				<tr>
					<th>Name</th>
					<th># of Residents</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ dorms }" var="dorm">
				<tr data-href="/dorms/${ dorm.id }">
					<td>${ dorm.name }</td>
					<td>${ dorm.students.size() }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
</body>
</html>