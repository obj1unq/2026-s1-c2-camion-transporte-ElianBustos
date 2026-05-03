import modosDeBumblebee.*
import misiles.*

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

	method esPar() {
		return (self.peso() % 2) == 0
	}

	method pesaIgualLaCosa(cantidad) {
		return self.peso() == cantidad
	}

	method tieneNivel(nivel) {
		return self.nivelPeligrosidad() == nivel
	}

	method superaElNivelDePeligrosidadIndicado(nivel) {
		return self.nivelPeligrosidad()>=nivel
	}

	method esMasPeligrosaQue(otraCosa) {
    	return self.superaElNivelDePeligrosidadIndicado(otraCosa.nivelPeligrosidad())
	}

		method tieneAlgoQuePeseEntre(cosa,min,max) {
		return self.cosaPesaEnUnMinimo(cosa,min) && self.cosaPesaEnUnMaximo(cosa,max)
	}

	method cosaPesaEnUnMinimo(cosa,min) {
		return cosa.peso() >= min
	}

	method cosaPesaEnUnMaximo(cosa,max) {
		return cosa.peso() <= max
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


	method peso(_peso) {
		peso = _peso
	}

	method bulto() {
		return 1
	}

	method sufreAccidente() {
		peso += 20
	}

	method esPar() {
		return (peso % 2) == 0
	}

	method pesaIgualLaCosa(cantidad) {
		return peso == cantidad
	}

	method tieneNivel(nivel) {
		return self.nivelPeligrosidad() == nivel
	}

	method superaElNivelDePeligrosidadIndicado(nivel) {
		return self.nivelPeligrosidad()>=nivel
	}

	method esMasPeligrosaQue(otraCosa) {
    	return self.superaElNivelDePeligrosidadIndicado(otraCosa.nivelPeligrosidad())
	}

	method tieneAlgoQuePeseEntre(cosa,min,max) {
		return self.cosaPesaEnUnMinimo(cosa,min) && self.cosaPesaEnUnMaximo(cosa,max)
	}

	method cosaPesaEnUnMinimo(cosa,min) {
		return cosa.peso() >= min
	}

	method cosaPesaEnUnMaximo(cosa,max) {
		return cosa.peso() <= max
	}

}

object bumblebee {

	var modo = auto

	method peso() { 
		return 800 
	}

	method nivelPeligrosidad() { 
		return modo.nivelPeligrosidad()
	}

	method modo(_modo) {
		modo = _modo

	}

	method modo() {
		return modo
	}


	method bulto() {
		return 2
	}

	method sufreAccidente() {
		modo = modo.modoTrasElAccidente()
	}

	method esPar() {
		return (self.peso() % 2) == 0
	}

	method pesaIgualLaCosa(cantidad) {
		return self.peso() == cantidad
	}

	method tieneNivel(nivel) {
		return self.nivelPeligrosidad() == nivel
	}

	method superaElNivelDePeligrosidadIndicado(nivel) {
		return self.nivelPeligrosidad()>=nivel
	}

	method esMasPeligrosaQue(otraCosa) {
    	return self.superaElNivelDePeligrosidadIndicado(otraCosa.nivelPeligrosidad())
	}

	method tieneAlgoQuePeseEntre(cosa,min,max) {
		return self.cosaPesaEnUnMinimo(cosa,min) && self.cosaPesaEnUnMaximo(cosa,max)
	}

	method cosaPesaEnUnMinimo(cosa,min) {
		return cosa.peso() >= min
	}

	method cosaPesaEnUnMaximo(cosa,max) {
		return cosa.peso() <= max
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
        return if (cantidadDeLadrillos <= 100) {
    		1
		} else if (cantidadDeLadrillos <= 300) {
			2
		} else {
			3
		}
	}

	// method bultosHasta100() {
	// 	return if (self.hasta100Ladrillos()) {
	// 			1
	// 	}else{
	// 			0
	// 		} 
	// }
	
	// method bultosHasta300() {
	// 	return if (self.masDe100Hasta300Ladrillos()){ 
	// 		2
	// 		}else{
	// 		0
	// 		} 
	// }


	// method bultosMasDe300() {
	// 	return if (self.masDe300Ladrillos()){ 3
	// 	} else {
	// 		0
	// 	}

	// }

	// method hasta100Ladrillos() {
	// 	return cantidadDeLadrillos <= 100
	// }

	// method masDe100Hasta300Ladrillos() {
	// 	return cantidadDeLadrillos > 100 && cantidadDeLadrillos <= 300
	// }

	// method masDe300Ladrillos() {
	// 	return cantidadDeLadrillos > 300
	// }

	method sufreAccidente() {
		self.perderLadrillos()
	}

	method perder12Ladrillos() {
	    cantidadDeLadrillos -= 12
	}

	method perderLadrillos() {
		if(cantidadDeLadrillos >= 12) {
				self.perder12Ladrillos()}
			else {
				self.sinLadrillos()
			}
	}

	method sinLadrillos() {
		cantidadDeLadrillos = 0
	}

	method esPar() {
		return (self.peso() % 2) == 0
	}

	method pesaIgualLaCosa(cantidad) {
		return self.peso() == cantidad
	}


	method tieneNivel(nivel) {
		return self.nivelPeligrosidad() == nivel
	}

	method superaElNivelDePeligrosidadIndicado(nivel) {
		return self.nivelPeligrosidad()>=nivel
	}

	method esMasPeligrosaQue(otraCosa) {
    	return self.superaElNivelDePeligrosidadIndicado(otraCosa.nivelPeligrosidad())
	}

	method tieneAlgoQuePeseEntre(cosa,min,max) {
		return self.cosaPesaEnUnMinimo(cosa,min) && self.cosaPesaEnUnMaximo(cosa,max)
	}

	method cosaPesaEnUnMinimo(cosa,min) {
		return cosa.peso() >= min
	}

	method cosaPesaEnUnMaximo(cosa,max) {
		return cosa.peso() <= max
	}

}

object bateriaAntierea {
	var misil = cargado


	method peso() {
		return misil.peso()
	}

	method nivelPeligrosidad() { 
		return misil.nivelPeligrosidad()
	}

	method misil(_misil) {
		misil = _misil
	}

	
	method misil() {
		return misil
	}

	method bulto() {
		return misil.bulto()
	}

	method sufreAccidente() {
		misil = descargado
	}

	method esPar() {
		return (self.peso() % 2) == 0
	}

	method pesaIgualLaCosa(cantidad) {
		return self.peso() == cantidad
	}

	method tieneNivel(nivel) {
		return self.nivelPeligrosidad() == nivel
	}

	method superaElNivelDePeligrosidadIndicado(nivel) {
		return self.nivelPeligrosidad()>=nivel
	}

	method esMasPeligrosaQue(otraCosa) {
    	return self.superaElNivelDePeligrosidadIndicado(otraCosa.nivelPeligrosidad())
	}

	method tieneAlgoQuePeseEntre(cosa,min,max) {
		return self.cosaPesaEnUnMinimo(cosa,min) && self.cosaPesaEnUnMaximo(cosa,max)
	}

	method cosaPesaEnUnMinimo(cosa,min) {
		return cosa.peso() >= min
	}

	method cosaPesaEnUnMaximo(cosa,max) {
		return cosa.peso() <= max
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

	method esPar() {
		return (peso % 2) == 0
	}

	method pesaIgualLaCosa(cantidad) {
		return self.peso() == cantidad
	}

	method tieneNivel(nivel) {
		return self.nivelPeligrosidad() == nivel
	}

	method superaElNivelDePeligrosidadIndicado(nivel) {
		return self.nivelPeligrosidad()>=nivel
	}

	method esMasPeligrosaQue(otraCosa) {
    	return self.superaElNivelDePeligrosidadIndicado(otraCosa.nivelPeligrosidad())
	}

	method tieneAlgoQuePeseEntre(cosa,min,max) {
		return self.cosaPesaEnUnMinimo(cosa,min) && self.cosaPesaEnUnMaximo(cosa,max)
	}

	method cosaPesaEnUnMinimo(cosa,min) {
		return cosa.peso() >= min
	}

	method cosaPesaEnUnMaximo(cosa,max) {
		return cosa.peso() <= max
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

	method contener(cosa) {
		contenedor.add(cosa)
	}

	method nivelPeligrosidad(){
		return if(!contenedor.isEmpty()) {
			self.elMasPeligroso().nivelPeligrosidad()
		} else{
			0
		} 
	}
	// method nivelPeligrosidad() {
	// 	return if(!contenedor.isEmpty()) self.elMasPeligroso().nivelPeligrosidad() else 0
	// }

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

	method esPar() {
		return (self.peso() % 2) == 0
	}

	method pesaIgualLaCosa(cantidad) {
		return self.peso() == cantidad
	}

	method tieneNivel(nivel) {
		return self.nivelPeligrosidad() == nivel
	}

	method superaElNivelDePeligrosidadIndicado(nivel) {
		return self.nivelPeligrosidad()>=nivel
	}

	method esMasPeligrosaQue(otraCosa) {
    	return self.superaElNivelDePeligrosidadIndicado(otraCosa.nivelPeligrosidad())
	}

	method tieneAlgoQuePeseEntre(cosa,min,max) {
		return self.cosaPesaEnUnMinimo(cosa,min) && self.cosaPesaEnUnMaximo(cosa,max)
	}

	method cosaPesaEnUnMinimo(cosa,min) {
		return cosa.peso() >= min
	}

	method cosaPesaEnUnMaximo(cosa,max) {
		return cosa.peso() <= max
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

	method embalar(cosa) {
		coberturaDeObjeto = cosa
	}

	method bulto() {
		return 2
	}

	method sufreAccidente() {
		
	}

	method esPar() {
		return (self.peso() % 2) == 0
	}

	method pesaIgualLaCosa(cantidad) {
		return self.peso() == cantidad
	}

	method tieneNivel(nivel) {
		return self.nivelPeligrosidad() == nivel
	}

	method superaElNivelDePeligrosidadIndicado(nivel) {
		return self.nivelPeligrosidad()>=nivel
	}

	method esMasPeligrosaQue(otraCosa) {
    	return self.superaElNivelDePeligrosidadIndicado(otraCosa.nivelPeligrosidad())
	}

	method tieneAlgoQuePeseEntre(cosa,min,max) {
		return self.cosaPesaEnUnMinimo(cosa,min) && self.cosaPesaEnUnMaximo(cosa,max)
	}

	method cosaPesaEnUnMinimo(cosa,min) {
		return cosa.peso() >= min
	}

	method cosaPesaEnUnMaximo(cosa,max) {
		return cosa.peso() <= max
	}

}
