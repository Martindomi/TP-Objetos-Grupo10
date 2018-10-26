import hechiceros.*
import hechizos.*



class Peso{
	
	const fechaCompra
	const peso
	
	constructor(unPeso){
		peso= unPeso
		fechaCompra = new Date ()
	}
	constructor (unPeso, haceXDias) {
		peso = unPeso
		fechaCompra = (new Date()).minusDays(haceXDias)
	}
	constructor(unPeso,dia,mes,anio){
		fechaCompra = new Date (dia,mes,anio)
		peso = unPeso
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




class ArmaBlanca inherits Peso{
	
	constructor(unPeso) = 
		super(unPeso)
		
	constructor(unPeso,diasDesdeCompra) = 
		super(unPeso,diasDesdeCompra)
		
	constructor(unPeso,diaCompra,mesCompra,anioCompra) = 
		super(unPeso,diaCompra,mesCompra,anioCompra)
	
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


	


class CollarDivino inherits Peso {
	var perlas
	
	constructor(unPeso,unasPerlas) = 
		super(unPeso){perlas=unasPerlas}
		
	constructor(unPeso,diasDesdeCompra,unasPerlas) = 
		super(unPeso,diasDesdeCompra){perlas=unasPerlas}
		
	constructor(unPeso,diaCompra,mesCompra,anioCompra,unasPerlas) = 
		super(unPeso,diaCompra,mesCompra,anioCompra){perlas=unasPerlas}
	
	method pesoExtra(){
		return 0.5*perlas
	}
	
	override method pesoReal(){
		return self.pesoExtra() + super()
	}

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



class MascaraOscura inherits Peso{
	
	var indiceOscuridad
	var minimo = 4
	constructor(unPeso,unValor) = 
		super(unPeso){self.ponerValor(unValor)}
		
	constructor(unPeso,diasDesdeCompra,unValor) = 
		super(unPeso,diasDesdeCompra){self.ponerValor(unValor)}
		
	constructor(unPeso,diaCompra,mesCompra,anioCompra,unValor) = 
		super(unPeso,diaCompra,mesCompra,anioCompra) {self.ponerValor(unValor)}
	
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
class Armadura inherits Peso {
	
	var valorBase
	var refuerzo 
	
	constructor(unPeso,unValor,unRefuerzo) = 
		super(unPeso) {
		valorBase = unValor
		refuerzo = unRefuerzo
	}
		
	constructor(unPeso,diasDesdeCompra,unValor,unRefuerzo) = 
		super(unPeso,diasDesdeCompra) {
		valorBase = unValor
		refuerzo = unRefuerzo
	}
		
	constructor(unPeso,diaCompra,mesCompra,anioCompra,unValor,unRefuerzo) = 
		super(unPeso,diaCompra,mesCompra,anioCompra) {
		valorBase = unValor
		refuerzo = unRefuerzo
	}
	
	method pesoExtra(){
		return refuerzo.pesoExtra()
	}
	
	override method pesoReal(){
		return self.pesoExtra() + super()
	}
	method esEspejo(){
		return false
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

class Hechizo {
	
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



class EspejoFantastico inherits Peso{
	
	constructor(unPeso) = 
		super(unPeso)
		
	constructor(unPeso,diasDesdeCompra) = 
		super(unPeso,diasDesdeCompra)
		
	constructor(unPeso,diaCompra,mesCompra,anioCompra) = 
		super(unPeso,diaCompra,mesCompra,anioCompra) 
		
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
