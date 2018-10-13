import TPobjetos.*
import hechizos.*

class ArmaBlanca {
	
	method poderDeLucha(hechicero) {
		return 3
	}
}
/*PUNTO 2 */
var espadaDelDestino = new ArmaBlanca () /* ESTE OBJETO DEBE PERTENECER A LA CLASE ARMABLANCA */
	


object collarDivino {

	var perlas = 5
	
	method perlas(){
		return perlas
	}
	
	method cambiarCantidadDePerlas(cantidadDePerlas){
		perlas = cantidadDePerlas
	}

	method poderDeLucha(hechicero) {
		return self.perlas()
	}
}

class MascaraOscura {
	
	var indiceOscuridad
	var minimo = 4
	
	constructor (unValor) {
		if(unValor < 0 or unValor > 1){
			self.error("El indice de oscuridad debe ser un valor entre 0 y 1")
		}
		indiceOscuridad = unValor
	}
	method poderDeLucha(hechiero) {
		return minimo.max((fuerzaOscura.valor()/2) * indiceOscuridad)
	}
	method cambiarMinimo(nuevoMinimo){
		minimo = nuevoMinimo
	}
}
	
	
var mascaraOscuraRolando = new MascaraOscura(1)  /* hay que hacer que este objeto pertenzca a la clase MascaraOscura */


/*PUNTO 3 */
object armadura {
	
	var refuerzo = ninguno
	
	method poderDeLucha(hechicero) {
		return 2 + refuerzo.valorRefuerzo(hechicero)
	}
	
	
	method refuerzo(nuevoRefuerzo){
		refuerzo = nuevoRefuerzo
	}
}

object cotaDeMalla {
				 
	method valorRefuerzo(hechicero){
		return 1
	} 
}

object bendicion {
				
		method valorRefuerzo(hechicero){
			return hechicero.nivelDeHechiceria()
		}
}

object hechizo {
		var elHechizo = hechizoBasico
		
		method elHechizo(unHechizo){
			elHechizo = unHechizo
		}
		method valorRefuerzo(hechicero){
			return elHechizo.poder()
		}
}

object ninguno{
				
		method valorRefuerzo(hechicero){
			return 0
	}
} 



object espejoFantastico {
	var puntos = 0
		
	method puntosEspejo(hechicero) {
		if(hechicero.poseeArtefacto(self) and hechicero.cantidadArtefactos() >1)
		{
			puntos = hechicero.poderMasPoderoso()
		}
		else{
		puntos = 0
		}
		
	}
		

	method puntos(hechicero){
		self.puntosEspejo(hechicero)
		return puntos
	}

	method poderDeLucha(hechicero) {
	
		return self.puntos(hechicero)
	}
}