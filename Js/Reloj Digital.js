
	function actual() {
        fecha = new Date(); // Actualizar fecha.
        hora = fecha.getHours(); // Hora actual
        minuto = fecha.getMinutes(); // Minuto actual
        segundo = fecha.getSeconds(); // Segundo actual
        if (hora < 10) { // Dos cifras para la hora
            hora = "0" + hora;
        }
        
		if (minuto < 10) { // Dos cifras para el minuto
            minuto = "0" + minuto;
        }
        
		if (segundo < 10) { // Dos cifras para el segundo
            segundo = "0" + segundo;
        }
        
		// Ver en el recuadro del reloj:
        mireloj = hora + " : " + minuto + " : " + segundo;	
		return mireloj; 
    }
	
	function actualizar() { // Función del temporizador
	   mihora = actual(); // Recoger hora actual
	   mireloj = document.getElementById("reloj"); // Buscar elemento reloj
	   mireloj.innerHTML = mihora; // Incluir hora en elemento
	}
	
	setInterval(actualizar, 1000); // Iniciar temporizador
	