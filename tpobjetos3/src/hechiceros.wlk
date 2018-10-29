import artefactos.*
import hechizos.*
import comerciantes.*

object fuerzaOscura {
	
	var fuerzaOscura = 5
	
	method valor(){
		
		return fuerzaOscura
	}
	
	method eclipse(){
		
		fuerzaOscura = fuerzaOscura*2
	}
}


class Hechicero {

	var hechizoPreferido 
	var artefactos 
	var valorBaseHabilidad = 1
	var valorBase = 3
	var oro
	const cargaMaxima
	
	constructor (unHechizo, unosArtefactos,cuantoOro,carga){
		hechizoPreferido = unHechizo
		artefactos = unosArtefactos
		oro = cuantoOro
		cargaMaxima = carga
	}
	
	method cuantoCarga(){
		return artefactos.sum({artefacto => artefacto.pesoReal()})
	}
	
	method puedeCargar(unArtefacto) {
		if(unArtefacto.pesoReal()+ self.cuantoCarga() > cargaMaxima){
			self.error("no puedes adquirir el artefacto porque supera la carga maxima del personaje")
		}
	}
	
	method alivianarCargar(unArtefacto){
		self.quitarArtefacto(unArtefacto)
	}
	
	method cumplirObjetivo(){
		oro += 10
	}
	
	method oro(){
		return oro
	}
	method diferenciaCanje(hechizoNuevo){
		return 0.max(hechizoNuevo.costo()-hechizoPreferido.costo()/2)
		
	}
	
	method restarDinero(valor) {
		if (oro < valor){
			self.error("no tienes suficiente oro para comprar este hechizo")
		}
		oro -= valor
		
	}
	
	method canjeHechizo(hechizoNuevo){
		self.restarDinero(self.diferenciaCanje(hechizoNuevo))
		hechizoPreferido = hechizoNuevo
	}
	
	method comprarArtefacto(unArtefacto,unComerciante){
		self.puedeCargar(unArtefacto)
		unComerciante.vender(unArtefacto)
		self.restarDinero(unComerciante.calcularPrecio(unArtefacto))
		self.agregarArtefacto(unArtefacto)
	}
	method seCreePoderoso() {
		return hechizoPreferido.esPoderoso()
	}

	method nivelDeHechiceria() {
		return (valorBase * self.poderHechizoPreferido()) + fuerzaOscura.valor()
	}

	method hechizoPreferido(hechizo) {
		hechizoPreferido = hechizo
	}

	method poderHechizoPreferido() {
		return hechizoPreferido.poder()
	}

	method habilidadDeLucha() {
		return valorBaseHabilidad + artefactos.sum({unArtefacto => unArtefacto.poderDeLucha(self)})
	}

	method valorBase(unValor){
		valorBase = unValor
	}
	
	method valorBaseHabilidad(unValor){
		valorBaseHabilidad = unValor
	}

	method agregarArtefacto(nuevoArtefacto) {
		artefactos.add(nuevoArtefacto)
	}

	method quitarArtefacto(artefacto) {
		artefactos.remove(artefacto)
	}

	method esHabilidadDeLuchaMayorAlNivelDeHechiceria() {
		return (self.habilidadDeLucha() > self.nivelDeHechiceria())
	}
	
	method artefactos(){
		return artefactos
	}

	method estaCargado() {
		return artefactos.size() > 4
	}
	
	method poseeArtefacto(unArtefacto){
		return artefactos.contains(unArtefacto)
	}
	
	method noTieneArtefacto(unArtefacto){
		return self.poseeArtefacto(unArtefacto).negate()
		
	}
		
	method cantidadArtefactos(){
		return artefactos.size()	
	}
	
	method eliminarArtefactos(){
		artefactos.clear()
	}
	
	method artefactosSinEspejo() {
		return artefactos.filter({artefacto => ! artefacto.esEspejo()})
	}
	
	method artefactoMasPoderoso(){
		return self.artefactosSinEspejo().max({artefacto => artefacto.poderDeLucha(self)})
	}
	
	method poderMasPoderoso(){
		return (self.artefactoMasPoderoso()).poderDeLucha(self)
	}

		
}


class TipoNivel {
	
		var valor

		constructor(unValor) {
			valor = unValor
		}
			
		method dificultad() {
			return valor
		}
	
}

object facil inherits TipoNivel(1){}
object moderado inherits TipoNivel(2){}
object dificil inherits TipoNivel(4){}

class Npc inherits Hechicero{
	
	
	var nivel
	
	constructor (unHechizo, unosArtefactos,cuantoOro,carga,unNivel) = 
		super(unHechizo, unosArtefactos,cuantoOro,carga){	
		nivel = unNivel
		}
	
	
	override method habilidadDeLucha() {
		return nivel.dificultad() *super()
	}
	
	method cambiarNivel(otroNivel){
		nivel = otroNivel
	}
}
