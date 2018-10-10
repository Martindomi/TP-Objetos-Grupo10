import TPobjetos.*
import hechizos.*


/*PUNTO 2 */
object espadaDelDestino{
	
	method poderDeLucha(hechicero) {
		return 3
	}
}	

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

object mascaraOscura {

	method poderDeLucha(hechiero) {
		return 4.max(fuerzaOscura.valor()/2)
	}
}

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