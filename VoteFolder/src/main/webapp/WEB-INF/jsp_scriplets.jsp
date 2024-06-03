<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Disponibilite" %>
<%@ page import="model.Votes" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enquête de disponibilité de réunion</title>
    <style>
        body {
            font-family: 'Raleway', sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f9f6f2;
            color: #333;
        }

        h1, h2 {
            color: #4CAF50;
            text-align: center;
        }

        form {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border: 2px solid #000000;
        }

        th {
            background-color: #f2f2f2;
        }

        input[type="text"], input[type="submit"] {
            padding: 12px;
            margin: 10px 0;
            border: 2px solid #4CAF50;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #f9f6f2;
            color: #333;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            cursor: pointer;
        }

        input[type="checkbox"] {
            margin-right: 5px;
        }

        hr {
            border: 1px solid #4CAF50;
        }
    </style>
</head>
<body>
<c:choose>
<c:when test="$loggedin">
<h1>Rebonjour</h1>

</c:when>
<c:otherwise><h1>bonjour</h1></c:otherwise>
</c:choose>
<c:set var="loggedin" scope="session" value="${true}" />

    <div style="text-align: center;">
        <h1>Enquête de disponibilité de réunion</h1>
    </div>

    <c:set var="votes" value="${requestScope.votes}" />
    <c:if test="${not empty votes}">
        <form method="get" action="Servlet">
            <table>
                <tr>
                    <td><label for="membre">Nom du membre:</label></td>
                    <td><input type="text" name="Membre" id="membre"></td>
                </tr>
                <tr>
                    <td><label>Disponibilité:</label></td>
                    <td>
                        <input type="checkbox" name="Disponibilite" value="Lundi">Lundi
                        <input type="checkbox" name="Disponibilite" value="Mardi">Mardi
                        <input type="checkbox" name="Disponibilite" value="Mercredi">Mercredi
                        <input type="checkbox" name="Disponibilite" value="Jeudi">Jeudi
                        <input type="checkbox" name="Disponibilite" value="Vendredi">Vendredi
                        <input type="checkbox" name="Disponibilite" value="Samedi">Samedi
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="Enregistrer">
                    </td>
                </tr>
            </table>
        </form>

        <hr>

        <h2>Résultats des votes :</h2>
        <table border="1">
            <tr>
                <th>Nom</th>
                <th>Lundi</th>
                <th>Mardi</th>
                <th>Mercredi</th>
                <th>Jeudi</th>
                <th>Vendredi</th>
                <th>Samedi</th>
            </tr>
            <c:forEach var="disponibilite" items="${votes.disponibilites}">
                <tr>
                    <td>${disponibilite.membre}</td>
                    <c:forEach var="dispo" items="${disponibilite.disponibilites}">
                        <td>${dispo ? "✔" : ""}</td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    
</body>
</html>
