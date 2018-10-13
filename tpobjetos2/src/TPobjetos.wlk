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
	var valorHabilidad = 1
	
	constructor (unHechizo, unosArtefactos){
		hechizoPreferido = unHechizo
		artefactos = unosArtefactos
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
		return valorHabilidad + artefactos.sum({unArtefacto => unArtefacto.poderDeLucha(self)})
	}

	method valorHabilidad(unValor){
		valorHabilidad = unValor
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
		return artefactos.filter({artefacto => artefacto != espejoFantastico})
	}
	
	method artefactoMasPoderoso(){
		return self.artefactosSinEspejo().max({artefacto => artefacto.poderDeLucha(self)})
	}
	
	method poderMasPoderoso(){
		return (self.artefactoMasPoderoso()).poderDeLucha(self)
	}

	
	
	
}

var rolando = new Hechicero(espectroMalefico,[espadaDelDestino , collarDivino , mascaraOscuraRolando]) 
	