import hechiceros.*
import hechizos.*

class ArmaBlanca {
	
	method esEspejo(){
		return false
	}
	method unidadesDeLucha() {
		return 3
	}
	method poderDeLucha(hechicero) {
		return self.unidadesDeLucha()
	}
	
	method costo() {
		return 5*self.unidadesDeLucha()
	}
}
/*PUNTO 2 */


	


class CollarDivino {

	var perlas
	
	constructor(cuantasPerlas){perlas=cuantasPerlas}
	
	method esEspejo(){
		return false
	}
	
	method perlas(){
		return perlas
	}
	
	method cambiarCantidadDePerlas(cantidadDePerlas){
		perlas = cantidadDePerlas
	}

	method poderDeLucha(hechicero) {
		return self.perlas()
	}
	
	method costo() {
		return 2*perlas
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
	method esEspejo(){
		return false
	}
	
	method unidadesDeLucha() {
		return ((fuerzaOscura.valor()/2) * indiceOscuridad)
	}
	method poderDeLucha(hechicero) {
		return minimo.max(self.unidadesDeLucha())
	}
	method cambiarMinimo(nuevoMinimo){
		minimo = nuevoMinimo
	}
	
	method costo(hechicero) {
		return 5*self.unidadesDeLucha()
	}
}
	
	


/*PUNTO 3 */
class Armadura {
	
	var valorBase
	var refuerzo 
	
	
	constructor(unValor,unRefuerzo){
		valorBase = unValor
		refuerzo = unRefuerzo
	}
	
	method esEspejo(){
		return false
	}
	method poderDeLucha(hechicero) {
		if(refuerzo == null){
			return 2
		}
		else
		{
			return valorBase + refuerzo.valorRefuerzo(hechicero)
	    }
	}
/* no se nos ocurre otra forma */
	  method costo(){
	  	if(refuerzo == null){
			return 2
		}
		else
		{
			if(refuerzo.cota()){
				return refuerzo.precio()
	    	}
	    	else
	    	{
	    		return valorBase + refuerzo.precio()
	    	}
	  	}

	}
	
	method refuerzo(nuevoRefuerzo){
		refuerzo = nuevoRefuerzo
	}
}

class CotaDeMalla {
	
	var valor
	
	constructor(unValor){valor = unValor}
	
	method cota(){return true}
				 
	method valorRefuerzo(hechicero){
		return valor
	} 
	
	method precio(){
		return valor/2
	}
}

class Bendicion {
		
		method cota(){return false}
				
		method valorRefuerzo(hechicero){
			return hechicero.nivelDeHechiceria()
		}
		
		
		method precio(){
		return 0
	}
		
}

class Hechizo {
	
		var elHechizo 
		
		constructor(unHechizo){
			elHechizo = unHechizo
		}
		
		method cota(){return false}
		
		method hechizoNuevo(nuevoHechizo){
			elHechizo = nuevoHechizo
		}
		method valorRefuerzo(hechicero){
			return elHechizo.poder()
		}
		method precio(){
		return elHechizo.costo()
	}
}




class EspejoFantastico {
	
	method esEspejo(){
		return true
	}
		
	method puntosEspejo(hechicero) {
		if(hechicero.poseeArtefacto(self) and hechicero.cantidadArtefactos() >1)
		{
			return hechicero.poderMasPoderoso()
		}
		else{
		    return 0
		}
		
	}
		

	method poderDeLucha(hechicero) {
	
		return self.puntosEspejo(hechicero)
	}
	
	method costo() {
		return 90
	}
}

/*artefactos para Loki */
object espejoFantastico inherits EspejoFantastico {}

/*artefactos para rolando */

/*artefactos para thor */
object bendicion inherits Bendicion {}
object armaduraConBendicion inherits Armadura(2, bendicion) {}
object armaduraConAlacachula inherits Armadura(2, unHechizo) {}



/*artefactos para xenia */
object espadaDelDestino inherits ArmaBlanca {}
object armadura inherits Armadura (2,null) {}
object armaduraExtra inherits Armadura (5,cotaNueva) {}
object cotaNueva inherits CotaDeMalla (5) {}
object collarDivino inherits CollarDivino(5) {}


object unHechizo inherits Hechizo(alacachula)

object mascaraOscura inherits MascaraOscura(1) {}
object mascaraPocoOscura inherits MascaraOscura(0) {}
object cotaDeMalla inherits CotaDeMalla (1) {}
object hechizo inherits Hechizo (hechizoBasico) {}
object espada inherits ArmaBlanca {}
object otraArmadura inherits Armadura(2,cota3) {}
object cota3 inherits CotaDeMalla(5){}


