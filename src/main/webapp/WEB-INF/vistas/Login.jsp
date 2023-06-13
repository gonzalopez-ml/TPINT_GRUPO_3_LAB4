<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel= "stylesheet" type="text/css" href= "css/styles.css">
    <meta charset="UTF-8">
    <title>Iniciar sesión</title>
</head>
<body>
<div class="container">
    <h2>Iniciar sesión</h2>
    <form action="/login" method="post">
        <label for="nombreUsuario">Nombre de usuario</label>
        <input type="text" id="nombreUsuario" name="nombreUsuario" required>
        <label for="contrasenia">Contraseña</label>
        <input type="password" id="contrasenia" name="contrasenia" required>
        <input type="submit" value="Iniciar sesión">
    </form>
</div>
</body>
</html>
