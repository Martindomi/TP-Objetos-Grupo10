import TPobjetos.*


class Logos {
	
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
	
}
/*PRIMER HECHIZO*/
object espectroMalefico { /* ESTE OBJETO DEBE PERTENECER A LA CLASE LOGOS */

	var nombre = "espectro Malefico"

	method cambiarNombre(nuevoNombre) { 
		nombre = nuevoNombre
	}

	method nombre() {
		return nombre
	}

	method poder() {
		return nombre.length()
	}

	method esPoderoso() {
		return self.poder() > 15
	}

}

/*SEGUNDO HECHIZO*/
object hechizoBasico {

	var nombre ="hechizo basico"
	
	method nombre() {
		return nombre
		
	}
	
	method poder() {
		return 10
	}

	method esPoderoso() {
		return false
	}
}
object libroDeHechizos {
	var hechizosDelLibro = []

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
}


