<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<title>Add New Dormitory</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

</head>
<body>
	<main class="text-center">
		<h2 class="mb-5">Add New Dormitory</h2>
		<form:form class="form w-50 m-auto" action="/dorms" method="POST" modelAttribute="dorm">
			<div class="form-group row">
				<form:label class="col-3" path="name">Dorm Name</form:label>
				<form:input class="form-control col-5" path="name"/>
				<form:errors class="col-4 text-danger" path="name"/>
			</div>
			<input type="submit" class="btn btn-success mt-5" value="Add Dorm">
		</form:form>
	</main>	
</body>
</html>