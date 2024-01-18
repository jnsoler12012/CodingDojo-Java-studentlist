<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<body>
    <header class="bg-dark p-2 mb-3">
        <h1 class="text-light">Student<span class="text-primary">Resources</span>App</h1>
        <a href="/students" class="btn btn-primary">Home</a>
    </header>
    <main class="text-center">
        <h2 class="mb-5">Add New Student</h2>
        <form:form class="form w-50 m-auto" action="/students" method="POST" modelAttribute="student">
            <div class="form-group row">
                <form:label class="col-3" path="firstName">First Name</form:label>
                <form:input class="form-control col-5" path="firstName" />
                <form:errors class="col-4 text-danger" path="firstName" />
            </div>
            <div class="form-group row">
                <form:label class="col-3" path="lastName">Last Name</form:label>
                <form:input class="form-control col-5" path="lastName" />
                <form:errors class="col-4 text-danger" path="lastName" />
            </div>
            <div class="form-group row">
                <form:label class="col-3" path="age">Age</form:label>
                <form:input class="form-control col-5" type="number" min="1" max="120" path="age" />
                <form:errors class="col-4 text-danger" path="age" />
            </div>
            <input type="submit" class="btn btn-success mt-5" value="Add Student">
        </form:form>
    </main>
</body>

</html>