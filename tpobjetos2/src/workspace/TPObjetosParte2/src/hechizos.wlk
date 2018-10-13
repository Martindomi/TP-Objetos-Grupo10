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
object hechizoBasico inherits Logo("hechizo basico",null){
	
	override method poder() {
		return 10
	}
	override method cambiarNombre(nombreNuevo){
		nombre = "hechizo basico"
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
		
	
	method costo() {
		return (self.precioPorCantidadDeLibros()+self.poder())
	}
}

/*Al haber distintos libros de hechizos un libro de hechizos puede contener a otro diferente */

object libroDeHechizos inherits LibroDeHechizos ([]) {}
object libroDeHechizosConAlacachula inherits LibroDeHechizos ([alacachula, hechizoBasico]) {}

object alacachula inherits Logo ("alacachula cachicomula",1) {}
