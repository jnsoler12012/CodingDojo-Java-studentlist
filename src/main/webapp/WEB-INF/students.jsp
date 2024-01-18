<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<title>All Students</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

</head>
<body>
	<header class="bg-dark p-2 mb-3">
		<h1 class="text-light">Student<span class="text-primary">Resources</span>App</h1>
		<a href="/students" class="btn btn-primary">Home</a>
		<a href="/contacts/new" class="btn btn-primary">Add Contact Info</a>
		<a href="/students/new" class="btn btn-primary">Add Student</a>
	</header>
	<main class="text-center">
		<h2>All Students</h2>
		<table class="table table-striped w-50 m-auto">
			<thead>
				<tr>
					<th>Name</th>
					<th>Age</th>
					<th>Address</th>
					<th>City</th>
					<th>State</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ students }" var="student">
				<tr>
					<td>${ student.firstName } ${ student.lastName }</td>
					<td>${ student.age }</td>
					<td>${ student.contact.address }</td>
					<td>${ student.contact.city }</td>
					<td>${ student.contact.state }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
</body>
</html>