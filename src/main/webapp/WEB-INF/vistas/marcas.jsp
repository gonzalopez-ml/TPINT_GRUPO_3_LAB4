<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <title>Formulario de Marca</title>
    <!-- Aquí puedes incluir Bootstrap y cualquier otro CSS que estés utilizando -->
</head>
<body>
    <div class="container">
        <h2>Formulario de Marca</h2>
        <form:form action="guardar" modelAttribute="marca" method="POST">
            <div class="form-group">
                <label for="id">ID</label>
                <form:input path="id" id="id" class="form-control" readonly="true" />
            </div>
            <div class="form-group">
                <label for="marca">Marca</label>
                <form:input path="marca" id="marca" class="form-control" required="required"/>
            </div>
            <div class="form-group">
                <label for="status">Status</label>
                <form:select path="status" id="status" class="form-control">
                    <form:option value="1" label="Activo" />
                    <form:option value="0" label="Inactivo" />
                </form:select>
            </div>
            <input type="submit" value="Guardar" class="btn btn-primary" />
        </form:form>
    </div>
</body>
</html>
