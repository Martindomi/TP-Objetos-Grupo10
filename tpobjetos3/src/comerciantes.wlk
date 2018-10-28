import artefactos.*
import hechizos.*
import hechiceros.*

class Independiente {
	var comision
	
	constructor(unaComision){
		comision = unaComision
	}
	
	method precioExtra(artefacto){
		return comision * artefacto.costo()
	}
	
	method recategorizar(comerciante) {
		if (comision*2 >= 0.21) {
			comerciante.cambiarSituacionImpositiva(registrado)
		}
		else
		{
			comision *= 2
		}
	}
}

object registrado {
	
	method precioExtra(artefacto){
		return 0.21 * artefacto.costo()
	}
	
	method recategorizar(comerciante){
		comerciante.cambiarSituacionImpositiva(conImpuestoGanancias)
	}
}


object conImpuestoGanancias {
	var minimoNoImponible = 5
	
	method cambiarMinimo(unMinimoNoImponible){
		minimoNoImponible = unMinimoNoImponible
	}
	
	method precioExtra(artefacto){
		if(artefacto.costo() < minimoNoImponible){
			return 0
		}
		else
		{
			return 0.35 * (artefacto.costo() - minimoNoImponible)
		}
	}
	
	method recategorizar(comerciante){
		
	}
}

class Comerciante {
	
	var tipoComerciante
	var artefactos
	var oro
	
	constructor (unTipoComerciante,unosArtefactos, cantOro){
		tipoComerciante = unTipoComerciante
		artefactos = unosArtefactos
		oro = cantOro
	}
	method tieneArtefacto(artefacto) {
		if (artefactos.contains(artefacto)){
			self.error("comerciante no posee artefacto")
		}	
	}
	
	method quitarArtefacto(artefacto) {
		artefactos.remove(artefacto)
	}
	
	method calcularPrecio(artefacto){
		return artefacto.costo() + tipoComerciante.precioExtra(artefacto)
	}
	
	method vender(artefacto){
		self.tieneArtefacto(artefacto)
		self.quitarArtefacto(artefacto)
		oro += self.calcularPrecio(artefacto)
	}
	
	method cambiarSituacionImpositiva(nuevoTipo) {
		tipoComerciante = nuevoTipo
	}
	
	method recategorizacionCompulsiva() {
		tipoComerciante.recategorizar(self)
	}
}