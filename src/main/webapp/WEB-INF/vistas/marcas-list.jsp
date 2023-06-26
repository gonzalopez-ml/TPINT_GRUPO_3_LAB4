<%-- Suponiendo que "marcas" es una lista de objetos Marca que pasaste a la vista --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table class="table table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>Marca</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="marca" items="${marcas}">
            <tr>
                <td>${marca.id}</td>
                <td>${marca.marca}</td>
                <td>
                    <a href="editar?marcaId=${marca.id}" class="btn btn-primary">Editar</a>
                    <a href="eliminar?marcaId=${marca.id}" class="btn btn-danger">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
