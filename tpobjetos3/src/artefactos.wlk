import hechiceros.*
import hechizos.*

/*para fecha => var fecha1 = new Date (dia,mes,anio) */

class Artefacto{
	
	const peso
	const fechaCompra
	
	
	constructor(unPeso,unaFecha){
		peso= unPeso
		fechaCompra = unaFecha
	}
	
		method esEspejo(){
		return false
	}
	
	method diasDeCompra(){
		return (new Date() - fechaCompra)
		
	}
	method factorDeCorreccion(){
		return 1.min(self.diasDeCompra() /1000)
	}
	
	method pesoReal(){
		return peso - self.factorDeCorreccion()
	}


}




class ArmaBlanca inherits Artefacto{
	
	constructor(unPeso,fechaDeCompra) = 
		super(unPeso,fechaDeCompra)
	

	method unidadesDeLucha() {
		return 3
	}
	method poderDeLucha(hechicero) {
		return self.unidadesDeLucha()
	}
	
	method costo() {
		return 5*self.pesoReal()
	}
}
/*PUNTO 2 */


	


class CollarDivino inherits Artefacto {
	var perlas
	
		
	constructor(unPeso,fechaDeCompra,unasPerlas) = 
		super(unPeso,fechaDeCompra){perlas=unasPerlas}
		
	
	method pesoExtra(){
		return 0.5*perlas
	}
	
	override method pesoReal(){
		return self.pesoExtra() + super()
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



class MascaraOscura inherits Artefacto{
	
	var indiceOscuridad
	var minimo = 4

		
	constructor(unPeso,fechaDeCompra,unValor) = 
		super(unPeso,fechaDeCompra){self.ponerValor(unValor)}
		
	
	method ponerValor(unValor){
		if(unValor < 0 or unValor > 1){
			self.error("El indice de oscuridad debe ser un valor entre 0 y 1")
		}
		indiceOscuridad = unValor
		}
	
	method pesoExtra(){
		return 0.max((self.unidadesDeLucha() - 3).roundUp())
	}
	
	override method pesoReal(){
		return self.pesoExtra() + super()
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
	
	method costo() {
		return 10*indiceOscuridad
	}
}
	
	


/*PUNTO 3 */
class Armadura inherits Artefacto {
	
	var valorBase
	var refuerzo 
	
	constructor(unPeso,fechaDeCompra,unValor,unRefuerzo) = 
		super(unPeso,fechaDeCompra) {
		valorBase = unValor
		refuerzo = unRefuerzo
	}
		
	
	method pesoExtra(){
		return refuerzo.pesoExtra()
	}
	
	override method pesoReal(){
		return self.pesoExtra() + super()
	}
	method poderDeLucha(hechicero) {
			return valorBase + refuerzo.valorRefuerzo(hechicero)
	}

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

    method pesoExtra(){return 1}
    
   
	method valorRefuerzo(hechicero){
		return valor
	} 
	
	method precio(armadura){
		return valor/2
	}
}

object bendicion {
	
				
		method valorRefuerzo(hechicero){
			return hechicero.nivelDeHechiceria()
		}
		
		method pesoExtra(){return 0}
		
		
		method precio(armadura){
			return armadura.valorBase()
	}
		
}

class HechizoArmadura {
	
		var elHechizo 
		
		constructor(unHechizo){
			elHechizo = unHechizo
		}
		
		method pesoExtra(){
			if((elHechizo.poder()).odd()){
				return 1
			}else{
				return 2
			}	
		
		}
		
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
		
		method valorRefuerzo(hechicero){return 0}
		
		method pesoExtra(){return 0}
	
	
		method precio(armadura){
			return 2
	}
	
	
}



class EspejoFantastico inherits Artefacto{
	

	constructor(unPeso,fechaDeCompra) = 
		super(unPeso,fechaDeCompra)
		
		
	override method esEspejo(){
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
