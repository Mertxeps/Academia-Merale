
// Definimos el array de mensajes
var mensajes = [
	"¡¡ATENCIÓN!!",
	"Últimas plazas",
];
			
// Creamos una variable que vaya pasando por todos los valores de índices del array, empezando desde cero
var contador = 0;
			
function mostrarMensaje() {
	// Cambia el mensaje
	var contenedor = document.getElementById("mensaje");
	contenedor.innerHTML = mensajes[contador];
}
			
function cambiar() {
	// Cambia el contador
	contador++;
	// Tenemos en cuenta que contador no puede alcanzar el tamaño total de elementos del array, ya que generaría un error
		if ( contador == mensajes.length ) {
			contador = 0;
		}
					
	// Mostramos el mensaje con el nuevo contador
		mostrarMensaje();
}