<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>

<title>Add Contact Information</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
	<header class="bg-dark p-2 mb-3">
		<h1 class="text-light">Student<span class="text-primary">Resources</span>App</h1>
		<a href="/students" class="btn btn-primary">Home</a>
	</header>
	<main class="text-center">
		<h2 class="mb-5">Add Contact Info</h2>
		<form:form class="form w-50 m-auto" action="/contacts" method="POST" modelAttribute="contact">
			<div class="form-group row">
				<form:label class="col-3" path="student">Student</form:label>
				<form:select class="form-control col-5" path="student">
					<c:forEach items="${ students }" var="student">
					<option value=${ student.id }>${ student.firstName } ${ student.lastName }</option>
					</c:forEach>
				</form:select>
				<form:errors class="col-4 text-danger" path="student"/>
			</div>
			<div class="form-group row">
				<form:label class="col-3" path="address">Address</form:label>
				<form:input class="form-control col-5" path="address"/>
				<form:errors class="col-4 text-danger" path="address"/>
			</div>
			<div class="form-group row">
				<form:label class="col-3" path="city">City</form:label>
				<form:input class="form-control col-5" path="city"/>
				<form:errors class="col-4 text-danger" path="city"/>
			</div>
			<div class="form-group row">
				<form:label class="col-3" path="state">State</form:label>
				<form:input class="form-control col-5" path="state"/>
				<form:errors class="col-4 text-danger" path="state"/>
			</div>
			<input type="submit" class="btn btn-success mt-5" value="Add Contact">
		</form:form>
	</main>	
</body>
</html>