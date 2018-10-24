import hechiceros.*
import hechizos.*


class Peso{
	var peso
	var fechaCompra
	
	constructor(unPeso,unaFechaCompra){
		peso = unPeso
		fechaCompra = unaFechaCompra
	}
	
	method calcularDias(){
		
	}
	method factorDeCorreccion(){
		return 1.max(diasFechaCompra /1000)
	}
	
	method calcularPeso(){
		return peso - self.factorDeCorreccion()
	}
	
}

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
			return valorBase + refuerzo.valorRefuerzo(hechicero)
	}
/* no se nos ocurre otra forma */
	  method costo(){
	  	return refuerzo.precio(self)

	}
	
	method refuerzo(nuevoRefuerzo){
		refuerzo = nuevoRefuerzo
	}
	
	method valorBase(){
		return valorBase
	}
}

class CotaDeMalla {
	
	var valor
	
	constructor(unValor){valor = unValor}
	
	method cota(){return true}
				 
	method valorRefuerzo(hechicero){
		return valor
	} 
	
	method precio(armadura){
		return valor/2
	}
}

object bendicion {
		
		method cota()
			{return false}
				
		method valorRefuerzo(hechicero){
			return hechicero.nivelDeHechiceria()
		}
		
		
		method precio(armadura){
			return armadura.valorBase()
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
		method precio(armadura){
		return armadura.valorBase()+elHechizo.costo()
	}
}

object ninguno {
	
	method cota(){return false}
		
		method valorRefuerzo(hechicero){return 0}
		
		method precio(armadura){
			return 2
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
