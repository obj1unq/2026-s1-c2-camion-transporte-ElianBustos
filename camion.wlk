import cosas.*
import almacen.*


object camion {
	const property cosas = #{}
	const tara = 1000

		
//---cargar y descargar---------------------
	method cargarUnaCosa(cosa) {
		if(!self.estaEnElCamion(cosa)){
			cosas.add(cosa)
		} 
	}

	method descargarUnaCosa(cosa) {
		if(self.noEstaVacioYestaEnElCamion(cosa)){
			cosas.remove(cosa)
		}
	}



//---------------------------------------------



	method noEstaVacioYestaEnElCamion(cosa) {
		return self.noEstaVacio() && self.estaEnElCamion(cosa)
	}

	method estaEnElCamion(cosa) {
		return cosas.contains(cosa)
	}

	method noEstaVacio() {
		return !(cosas.isEmpty())
	}


//------- Todo peso par-----------

	method laCargaEsPesoPar() {
		return cosas.all({cosa => cosa.esPar()})
	}


//------------Hay alguno que pesa ------------------
	method laCargaPesaCiertaCantidad(cantidad) {
		return cosas.any({cosa => cosa.pesaIgualLaCosa(cantidad)})
	}



//-----------------### Peso y exceso de peso----------------------------------

	method pesoTotal() {
		return tara + self.pesoCarga()
	}

	method pesoCarga() {
		return cosas.sum({cosa => cosa.peso()})
	}

	method exedioElPesoMaximo() {
		return self.pesoTotal() > self.pesoMaximoAceptable()
	}

	method pesoMaximoAceptable() {
		return 2500
	}

//---------------- El de nivel------------------------------------

	method encontrarCosaConNivel(nivel) {
		return cosas.find({cosa => cosa.tieneNivel(nivel)})
	}


//--------------------### Cosas peligrosas-----------------------


	method cosasQueSuperanElNivelDePeligrosidad(nivel) {
		return cosas.filter({cosa=> cosa.superaElNivelDePeligrosidadIndicado(nivel)})
	}

	method cosasMasPeligrosasQue(_cosa) {
		return cosas.filter({cosa => cosa.esMasPeligrosaQue(_cosa)})
	}



//------------------------### Puede circular en ruta------------------

	method puedeCircularEnUnaRuta(nivel){
		return	!(self.exedioElPesoMaximo()) && !(self.hayCosasQueSuperanElNivelDePeligrosidad(nivel))
	}

	method hayCosasQueSuperanElNivelDePeligrosidad(nivel) {
		return cosas.any({cosa=> cosa.nivelPeligrosidad()>nivel})
	}

//-------------------### Tiene algo que pesa entre dos valores-------------------------------------

	method hayAlgunaCosaQuePeseEntre(min,max) {
		
		return cosas.any({cosa => cosa.tieneAlgoQuePeseEntre(cosa,min,max) })

	}



//----------------------### Cosa más pesada------------------

	method laCosaMasPesadaDelCamion() {
		return cosas.max({cosa => cosa.peso()})
	}

//------------------------### Pesos------------------------------------


method pesoDeLasCosas() {
	return cosas.map({cosa => cosa.peso()})
}

//------------------### TotalBultos------------------------


	method totalDeBultosDelCamion() {
		return cosas.sum({cosa => cosa.bulto()})
	}

//----------------------### Accidente-----------------

	method sufreUnAccidente() {
		cosas.forEach({cosa => cosa.sufreAccidente() })
	}


//---------------------## Transporte----------------------

	method transportar(destino,camino) {
		if(camino.puedeViajar(self)){
			destino.recibir(cosas)
			cosas.clear()
		}
	}

	method peligrosidadTotal() {
		return cosas.sum({cosa => cosa.nivelPeligrosidad()})
	}













}
