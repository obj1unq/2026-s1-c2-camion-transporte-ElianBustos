object knightRider {
	method peso() { 
		return 500 
	}

	method nivelPeligrosidad() { 
		return 10 
	}

	method bulto() {
		return 1
	}

	method sufreAccidente() {
	
	}

}

object arenaAGranel {
	var peso = 0

	method nivelPeligrosidad() { 
		return 1 
	}

	method peso() { 
		return peso 
	}


	method cambioDePeso(_peso) {
		peso = _peso
	}

	method bulto() {
		return 1
	}

	method sufreAccidente() {
		peso += 20
	}
}

object bumblebee {

	var modo = true

	method peso() { 
		return 800 
	}

	method nivelPeligrosidad() { 
		return if (modo) 15 else 30
	}

	method cambiarModo() {
		modo = !modo
	}

	method esModoAuto() {
		return modo
	}

	method esModoRobot() {
		return !modo
	}

	method bulto() {
		return 2
	}

	method sufreAccidente() {
		self.cambiarModo()
	}



}

object paqueteDeLadrillos {
	const pesoLadrillo = 2
	var cantidadDeLadrillos = 0

	method peso() {
		return cantidadDeLadrillos * pesoLadrillo
	}

	method agregarLadrillos(cantidad) {
		cantidadDeLadrillos=cantidad
	}

	method cantidadDeLadrillos() {
		return cantidadDeLadrillos
	}

	method nivelPeligrosidad() { 
		return 2
	}

	method bulto() {
        return self.bultosHasta100() + self.bultosHasta300() +self.bultosMasDe300()	
	}

	method bultosHasta100() {
		return if (self.hasta100Ladrillos()) 1 else 0
	}
	
	method bultosHasta300() {
		return if (self.masDe100Hasta300Ladrillos()) 2 else 0
	}


	method bultosMasDe300() {
		return if (self.masDe300Ladrillos()) 3 else 0

	}

	method hasta100Ladrillos() {
		return cantidadDeLadrillos <= 100
	}

	method masDe100Hasta300Ladrillos() {
		return cantidadDeLadrillos > 100 && cantidadDeLadrillos <= 300
	}

	method masDe300Ladrillos() {
		return cantidadDeLadrillos > 300
	}

	method sufreAccidente() {
		if(cantidadDeLadrillos >= 12) self.perderLadrillos() else self.sinLadrillos()
	}

	method perderLadrillos() {
		cantidadDeLadrillos -= 12
	}

	method sinLadrillos() {
		cantidadDeLadrillos = 0
	}

}

object bateriaAntierea {
	var hayMisiles = true

	method hayMisiles() {
		return hayMisiles
	}
	method peso() {
		return if(hayMisiles) 300 else 200
	}

	method nivelPeligrosidad() { 
		return if(hayMisiles) 100 else 0
	}

	method tieneMisiles(valor) {
		hayMisiles = valor
	}

	method bulto() {
		return if(hayMisiles) 2 else 1
	}

	method sufreAccidente() {
		hayMisiles = false
	}

}

object residuosRadiactivos {
	var peso = 0

	method nivelPeligrosidad() { 
		return 200 
	}

	method peso() { 
		return peso 
	}


	method cambioDePeso(_peso) {
		peso = _peso
	}
	method bulto() {
		return 1
	}

	method sufreAccidente() {
		peso += 15
	}

}

object contenedorPortuario {
	const contenedor = #{}

	method peso() {
		return 100 + self.pesoTotalContenido()
	}

	method pesoTotalContenido() {
		return contenedor.sum({cosa => cosa.peso()})
	}

	method contenerCosas(cosa) {
		contenedor.add(cosa)
	}

	method nivelPeligrosidad() {
		return if(!contenedor.isEmpty()) self.elMasPeligroso().nivelPeligrosidad() else 0
	}

	method elMasPeligroso() {
		return contenedor.max({cosa => cosa.nivelPeligrosidad()})
	}

	method bulto() {
		return 1 + self.bultosDelContenedor()
	}

	method bultosDelContenedor() {
		return contenedor.sum({cosa => cosa.bulto()})
	}

	method sufreAccidente() {
		contenedor.forEach({cosa => cosa.sufreAccidente()})
	}

}


object embalajeDeSeguridad {
	var coberturaDeObjeto = residuosRadiactivos

	method peso() {
		return  coberturaDeObjeto.peso()
	}

	method nivelPeligrosidad() {
		return coberturaDeObjeto.nivelPeligrosidad() / 2
	}

	method cambiarCoberturaDeCosa(cosa) {
		coberturaDeObjeto = cosa
	}

	method bulto() {
		return 2
	}

	method sufreAccidente() {
		
	}

}
