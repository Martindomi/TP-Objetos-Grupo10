import hechiceros.*


class Logo {
	
	var nombre
	var multiplo
	
	constructor (unNombre, unMultiplo){
		nombre = unNombre
		multiplo = unMultiplo
	}
	
	method cambiarNombre(nuevoNombre) { 
		nombre = nuevoNombre
	}

	method nombre() {
		return nombre
	}

	method cantidadLetras() {
		return nombre.length()
	}
	
	method poder() {
		return multiplo*self.cantidadLetras()
	}

	method esPoderoso() {
		return self.poder() > 15
	}
	
	method costo(){
		return self.poder()
	}
	
}
/*PRIMER HECHIZO*/
object espectroMalefico inherits Logo ("espectro Malefico",1) {
	
}



/*SEGUNDO HECHIZO*/
object hechizoBasico {
	
	var nombre = "hechizo basico"
	
	method poder() {
		return 10
	}
	method cambiarNombre(nombreNuevo){
		nombre = "hechizo basico"
	}
	
	method nombre() {
		return nombre
	}
	
	method esPoderoso() {
		return false
	}
	
	method costo(){
		return self.poder()
	}


}

/*Nuevo hechizo parte 3 */

object hechizoComercial inherits Logo("el hechizo comercial", 2){
	var porcentaje = 0.2
	
	method cambiarPorcentaje(nuevoPorcentaje) { 
		porcentaje = nuevoPorcentaje
	}
	override method poder() {
		return porcentaje * super() 
	
	}
	
	method cambiarMultiplo(nuevoMultiplo){
		multiplo = nuevoMultiplo
	}
}

class LibroDeHechizos {
	var hechizosDelLibro
	
	constructor (unosHechizos){hechizosDelLibro = unosHechizos}

	method agregarHechizo(hechizo) {
		hechizosDelLibro.add(hechizo) 
	}
	
	method quitarHechizo(hechizo) {
		hechizosDelLibro.remove(hechizo) 
	}

	method poder() {
		return (hechizosDelLibro.filter({unHechizo => unHechizo.esPoderoso()})).sum({unHechizo => unHechizo.poder()})
	}
	
	method esPoderoso() {
		return self.poder() > 15
	}
	
	method precioPorCantidadDeLibros(){
		return 10*hechizosDelLibro.size()
	}
	
	method pesoReal(){ return 0}
	
	method costo() {
		return (self.precioPorCantidadDeLibros()+self.poder())
	}
}

/*Al haber distintos libros de hechizos un libro de hechizos puede contener a otro diferente */


