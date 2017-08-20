<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Rubrica MCR</title>

<style type="text/css">
.jumbotron {
	margin-top: 50px;
}

#navbar {
	display: inline-block;
}

#search_field {
	margin-left: 15px;
}

.dropdown-menu {
	padding: 15 px;
}

#form-area
{
    background-color: #FAFAFA;
	padding: 10px 40px 60px;
	margin: 10px 0px 60px;
	border: 1px solid GREY;
	}
</style>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


</head>
<body>

	<div class="container">
		<div class="jumbotron">
			<!-- <div>
		<img src="/images/logo.png" alt="Mountain View" style="width:304px;height:228px;">
		</div> -->


			<c:choose>
				<c:when test="${user == null}">
					<div class="dropdown" id="navbar">
						<button class="btn btn-primary dropdown-toggle" type="button"
							data-toggle="dropdown">
							ADD USER <span class="caret"></span>
						</button>
						<div class="dropdown-menu" id="form-area">


							<form action="add" method="get" class="form-horizontal">
								
							<br style="clear:both">
                    <h3 style="margin-bottom: 25px; text-align: center;">Contact Form</h3>
    				<div class="form-group">
						<input type="text" class="form-control" name="nome" placeholder="Nome" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control"name="cognome" placeholder="Cognome" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="cf" placeholder="Codice Fiscale" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="email" placeholder="Email" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="telefono" placeholder="Telefono" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="cellulare" placeholder="Cellulare" required>
					</div>
                    
            
                   <button type="submit" id="submit" name="submit" class="btn btn-primary pull-right">Submit Form</button>
							</form>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="dropdown" id="navbar">
						<button class="btn btn-primary dropdown-toggle" type="button"
							data-toggle="dropdown">
							UPDATE USER <span class="caret"></span>
						</button>
						<div class="dropdown-menu" id="form-area">
							<form action="add" method="get" class="form-horizontal">
								<label for="exampleInputName2">Nome:</label> <input type="text"
									name="nome" class="form-control" value="${user.nome}"></input>
								<label for="exampleInputName2">Cognome :</label> <input
									type="text" name="cognome" class="form-control"
									value="${user.cognome}"></input> <label for="exampleInputName2">Codice
									fiscale :</label> <input type="text" name="cf" class="form-control"
									value="${user.cf}"></input> <label for="exampleInputName2">Email
									:</label> <input type="text" name="email" class="form-control"
									value="${user.email}"></input> <label for="exampleInputName2">Telefono
									:</label> <input type="text" name="telefono" class="form-control"
									value="${user.telefono}"></input> <label
									for="exampleInputName2">Cellulare</label> <input type="text"
									name="cellulare" class="form-control" value="${user.cellulare}"></input>
								<input type="hidden" name="id" value="${user.iduser}" />
                            <div id="navbar">
							<button type="submit" value="SEND" class="btn btn-warning">UPDATE</button>
							</div>
							<div id="navbar">							
							<form action="goTohome">
								<button type="submit" class="btn btn-link">Delete
									update</button>
							</form>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

			<div id="navbar">
				<input type="text" class="form-control" placeholder="Find user .."
					id="search_field">
			</div>

			<h1>
				<table class="table table-striped" id="myTable">
					<thead>
						<tr class="myHead">
							<th>NOME</th>
							<th>COGNOME</th>
							<th>CODICE FISCALE</th>
							<th>EMAIL</th>
							<th>TELEFONO</th>
							<th>CELLULARE</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${list}">
							<tr>
								<td>${user.nome}</td>
								<td>${user.cognome}</td>
								<td>${user.cf}</td>
								<td>${user.email}</td>
								<td>${user.telefono}</td>
								<td>${user.cellulare}</td>
								<td>
									<form action="delete">
										<input type="hidden" name="id" value="${user.iduser}">
										<button type="submit" value="DELETE" class="btn btn-danger">DELETE</button>
									</form>

								</td>
								<td>
									<form action="update">
										<input type="hidden" name="id" value="${user.iduser}">
										<button type="submit" value="DELETE" class="btn btn-link">update</button>
									</form>

								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
		</div>
	</div>

	<script>
		$('#search_field').on('keyup', function() {
			var value = $(this).val();
			var patt = new RegExp(value, "i");
			$('#myTable').find('tr').each(function() {

				if (!($(this).find('td').text().search(patt) >= 0)) {
					$(this).not('.myHead').hide();
				}

				if (($(this).find('td').text().search(patt) >= 0)) {
					$(this).show();
				}

			});
		});
	</script>


	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
</body>
</html>
