
<!DOCTYPE html>

<html lang = "es">

	<head>
	
		<meta charset = "utf-8">
	
		<title>Academia Merale</title>
		
		<link rel = "iCon" href = "../Icons/favicon.ico" type = "Image/jpg" sizes = "64x64">
		
		<meta name = "viewport" content = "user-scalable = no, width = device-width, initial-scale = 1">
		
		<link rel = "stylesheet" type = "text/css" href = "CSS/Styles-Scripts.css">
		
	</head>
	
	<body>
		
		<?php
		
		// Datos de la conexion
		include "private/conexion.php";
		
		if ( isset($_POST["Unete"]) ) {
			
			/* Leo los campos del formulario */
			$nombre  = $_POST["Nombre"];
			$apellidos   = $_POST["Apellidos"];
			$telefono = $_POST["Telefono"];
			$email = $_POST["Email"];
			$curso = $_POST["Curso"];
			$fecha_inscripcion = $_POST["Fecha_inscripcion"];
		}	
			
		?>
		
		<h1>Bienvenid@ <?php echo "$nombre"?><span> encantados de saludarte</span></h1>

		<h2>Comprobación de datos a envíar</h2>

		<h3>Según los datos aportados, tus datos son: <br>Nombre: <?php echo $nombre;?><br>Apellidos: <?php echo $apellidos;?><br>Teléfono: <?php echo $telefono;?><br>Email: <?php echo $email;?><br>Curso: <?php echo $curso;?><br>Fecha inscripción: <?php echo $fecha_inscripcion;?></h3>
		
		
		<?php
			
			$sql = "INSERT INTO inscripciones (nombre, apellidos, telefono, email, curso, fecha_inscripcion) VALUES ('$nombre', '$apellidos', '$telefono', '$email', '$curso', '$fecha_inscripcion');";

		?>
		
		<p>Comprueba tus datos antes de enviarlos, si no están bien, vuelve a escribirlos</p>
		<p>Los datos no son correctos: <a href = "../Pages/Unete a nosotros.html">Volver a escribirlos</a><br>
		<p>Los datos son correctos: <a href = "Scriplistado.php">Enviar</a></p>
		
			
		
	</body>
	
</html>