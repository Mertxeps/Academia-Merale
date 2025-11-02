
<!DOCTYPE html>

<html lang="es">

	<head>
	
		<meta charset = "utf-8">
		
		<title>Academia Merale</title>
		
		<link rel = "iCon" href = "../Icons/favicon.ico" type = "Image/jpg" sizes = "64x64">
		
		<meta name = "viewport" content = "user-scalable = no, width = device-width, initial-scale = 1, viewport-fit = cover">
		
		<link rel = "stylesheet" type = "text/css" href = "CSS/Styles-Scripts.css">
		
	</head>
	
	<body>
		
		<h1>Academia Merale</h1>
		<h2>Listado Alumnos inscritos</h2>
		
		<script>

			let date = new Date();
			let output = String(date.getDate()).padStart(2, '0') + '/' + String(date.getMonth() + 1).padStart(2, '0') + '/' + date.getFullYear();

			document.write("Fecha de la inscripcion: " + (output) + "<br><br>");

		</script>	

		<p id = "Sentimos"><span>LO SENTIMOS:</span> Debido a la gran demanda de inscripciones, no hay plazas disponibles en este curso. Ponte en contacto con nosotros para ver el comienzo de nuevos cursos.</p>
			
		<p>El listado de admitidos para las últimas plazas es el siguiente:</p>

		<?php
		// Datos de la conexion
		include "private/conexion.php";
		
		if ( isset($_POST["Unete"]) ) {
			
			/* Leo los campos del formulario */
			$nombre  = $_POST["Nombre"];
			$nombre  = $_POST["Nombre"];
				$apellidos   = $_POST["Apellidos"];
				$telefono = $_POST["Telefono"];
				$email = $_POST["Email"];
				$curso = $_POST["Curso"];
				$fecha_inscripcion = $_POST["Fecha_inscripcion"];

				$conexion = conectar();
				
				cerrar($conexion);
			}

			/* Pintamos una seudo-tabla con los alumnos insritos */
			try {
				$conexion = mysqli_connect($host, $usuario, $pass, $baseDatos);
			} catch (Exception $e) {
				?>
				<p>ERROR: No se puede conectar a la base de datos. Inténtelo más tarde.</p>
				<?php
				die();
			}
			
			
			mysqli_set_charset($conexion, "utf8");
			
			$sql = "SELECT `id_inscripcion`, `nombre`, `apellidos`, `telefono`, `email`, `curso`, `fecha_inscripcion` FROM `inscripciones`";
				
				try {
					$resultado = mysqli_query($conexion, $sql);
				} catch (Exception $e) {
					?>
					<p>ERROR: No se puede ejecutar la consulta. Inténtelo más tarde.</p>
					<?php
					die();
				}

		?>
		<div class = "table">
			<div class = "tr">
				<span class = "th">Nombre</span>
				<span class = "th">Apellidos</span>
				<span class = "th">Teléfono</span>
				<span class = "th">Email</span>
				<span class = "th">Curso</span>
				<span class = "th">Fecha inscripción</span>
			</div>
			
			<?php
			while ( $index = mysqli_fetch_assoc($resultado) ) {
				$idinscripcion = $index["id_inscripcion"];
				$nombre = $index["nombre"];
				$apellidos = $index["apellidos"];
				$telefono = $index["telefono"];
				$email = $index["email"];
				$curso = $index["curso"];
				$fecha_inscripcion = $index["fecha_inscripcion"];
				
				?>
				<form class = "tr" action = "scriplistado.php" method = "post">					
					<input type = "hidden" name = "idinscripcion"
						value = "<?php echo $idusuario; ?>">
					<span class="td">
						<input type = "text" name = "nombre"
							value = "<?php echo $nombre; ?>">
					</span>
					<span class = "td">
						<input type = "text" name = "apellidos"
							value = "<?php echo $apellidos; ?>">
					</span>
					<span class = "td">
						<input type = "text" name = "telefono"
							value = "<?php echo $telefono; ?>">
					</span>
					<span class = "td">
						<input type = "email" name = "email"
							value = "<?php echo $email; ?>">
					</span>
					<span class = "td">
						<input type = "curso" name = "curso"
							value = "<?php echo $curso; ?>">
					</span>
					<span class = "td">
						<input type = "fecha_inscripcion" name = "fecha_inscripcion"
							value = "<?php echo $fecha_inscripcion; ?>">
					</span>
				</form>
				<?php
			}
			?>
		</div>
		<?php

		try {
			mysqli_close($conexion);
		} catch (Exception $e) {
			?>
			<p>ERROR: No se puede cerrar la conexión. Inténtelo más tarde.</p>
			<?php
			die();
		}

		// }

		?>		
		
			<p>Contactanos lo antesposible para inscribirte en un nuevo curso y no perder tu plaza</p>
			
		<button onclick = "window.print()">Imprimir</button><br><br>
		
		<p>Volver al <a href="../Pages/Unete a nosotros.html">Panel de control</a></p>
	
	</body>

</html>
