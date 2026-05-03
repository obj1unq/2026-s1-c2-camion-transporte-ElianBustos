object almacen {
    const cosasGuardadas = #{}

    method recibir(cosasDelCamion) {
        cosasGuardadas.addAll(cosasDelCamion)
    }

    method cosasGuardadas() {
        return cosasGuardadas
    }


}