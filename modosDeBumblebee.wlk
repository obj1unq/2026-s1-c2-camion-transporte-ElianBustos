object robot {

    method nivelPeligrosidad() {
        return  30
    }

    method modoTrasElAccidente() {
        return auto
    }


}

object auto{
    

    method nivelPeligrosidad() {
        return  15
    }

    method modoTrasElAccidente() {
        return robot
    }

}