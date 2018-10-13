import artefactos.*
import hechizos.*


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
	var valorBase = 1
	var oro
	
	constructor (unHechizo, unosArtefactos,cuantoOro){
		hechizoPreferido = unHechizo
		artefactos = unosArtefactos
		oro = cuantoOro
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
	method canjeHechizo(hechizoNuevo){
		if(oro < self.diferenciaCanje(hechizoNuevo)){
			self.error("no tienes suficiente oro para comprar este hechizo")
		}
		oro -= self.diferenciaCanje(hechizoNuevo)
		hechizoPreferido = hechizoNuevo
	}
	
	method comprarArtefacto(unArtefacto){
		if (oro < unArtefacto.costo()){
			self.error("no tienes suficiente oro para comprar este artefacto")
		}
		oro -= unArtefacto.costo()
		artefactos.add(unArtefacto)
	}
	method seCreePoderoso() {
		return hechizoPreferido.esPoderoso()
	}

	method nivelDeHechiceria() {
		return (3 * self.poderHechizoPreferido()) + fuerzaOscura.valor()
	}

	method hechizoPreferido(hechizo) {
		hechizoPreferido = hechizo
	}

	method poderHechizoPreferido() {
		return hechizoPreferido.poder()
	}

	method habilidadDeLucha() {
		return valorBase + artefactos.sum({unArtefacto => unArtefacto.poderDeLucha(self)})
	}

	method valorBase(unValor){
		valorBase = unValor
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

object rolando inherits Hechicero(espectroMalefico,[espadaDelDestino , collarDivino , mascaraOscura], 100) {}

object xenia inherits Hechicero(alacachula,[],100) {}
object thor inherits Hechicero(hechizoBasico,[],100){}
object loki inherits Hechicero(hechizoBasico,[],5) {}
