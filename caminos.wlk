object ruta9 {


    method puedeViajar(camion) {
        return camion.puedeCircularEnUnaRuta(20)
    }




}

object caminosVecinales {
    var pesoMaximo = 0

    method puedeViajar(camion) {
        return camion.pesoTotal() <= pesoMaximo
    }

    method cambiarPesoMaximo(valor) {
        pesoMaximo = valor
    }
}