import cosas.*
import almacen.*


object camion {
	const property cosas = #{}
	const tara = 1000

		
//---cargar y descargar---------------------
	method cargarUnaCosa(cosa) {
		if(self.noEstaEnElCamion(cosa)) cosas.add(cosa)
	}

	method descargarUnaCosa(cosa) {
		if(self.noEstaVacio())cosas.remove(cosa)
	}


//---------------------------------------------
	method noEstaEnElCamion(cosa) {
		return !(cosas.contains(cosa))
	}

	method noEstaVacio() {
		return !(cosas.isEmpty())
	}


//------- Todo peso par-----------

	method laCargaEsPesoPar() {
		return cosas.all({cosa => self.esPar(cosa)})
	}

	method esPar(cosa) {
		return (cosa.peso() % 2) == 0
	}
//------------Hay alguno que pesa ------------------
	method laCargaPesaCiertaCantidad(cantidad) {
		return cosas.any({cosa => self.pesaIgualLaCosa(cantidad,cosa)})
	}

	method pesaIgualLaCosa(cantidad,cosa) {
		return cosa.peso() == cantidad
	}

//-----------------### Peso y exceso de peso----------------------------------

	method pesoTotal() {
		return tara + self.pesoCarga()
	}

	method pesoCarga() {
		return cosas.sum({cosa => cosa.peso()})
	}

	method ecedioElPesoMaximo() {
		return self.pesoTotal() > self.pesoMaximo()
	}

	method pesoMaximo() {
		return 2500
	}

//---------------- El de nivel------------------------------------

	method encontrarCosaConNivel(nivel) {
		return cosas.find({cosa => self.tieneNivel(cosa,nivel)})
	}

	method tieneNivel(cosa,nivel) {
		return cosa.nivelPeligrosidad() == nivel
	}
//--------------------### Cosas peligrosas-----------------------


	method cosasQueSuperanElNivelDePeligrosidad(nivel) {
		return cosas.filter({cosa=> cosa.nivelPeligrosidad()>nivel})
	}

	method cosasMasPeligrosasQue(_cosa) {
		return self.cosasQueSuperanElNivelDePeligrosidad(_cosa.nivelPeligrosidad())
	}



//------------------------### Puede circular en ruta------------------

	method puedeCircularEnUnaRuta(nivel){
		return	!(self.ecedioElPesoMaximo()) && !(self.hayCosasQueSuperanElNivelDePeligrosidad(nivel))
	}

	method hayCosasQueSuperanElNivelDePeligrosidad(nivel) {
		return cosas.any({cosa=> cosa.nivelPeligrosidad()>nivel})
	}

//-------------------### Tiene algo que pesa entre dos valores-------------------------------------

	method hayAlgunaCosaQuePeseEntre(min,max) {
		
		return cosas.any({cosa => self.cosaPesaEnUnMinimo(cosa,min) && self.cosaPesaEnUnMaximo(cosa,max)})

	}

	method cosaPesaEnUnMinimo(cosa,min) {
		return cosa.peso() >= min
	}

	method cosaPesaEnUnMaximo(cosa,max) {
		return cosa.peso() <= max
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
