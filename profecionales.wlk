class ProfecionalVinculado {
    const property universidad

    method honorarios() = universidad.honorariosRecomendados()

    method provinciaDondeTrabaja() = [universidad.provincia()]

    method cobrar(unImporte) {
      universidad.recibirDonaciones(unImporte * 0.5)
    }
}

class ProfecionalAsociado {
    var property universidad

    method provinciaDondeTrabaja() = ["Entre Rios","Santa Fe","Corrientes"]

    method honorarios() = 3000

    method cobrar(unImporte) {
      asociacion.recibirDonaciones(unImporte)
    }
}

class ProfecionalLibre {
    var property universidad
    const property provinciaDondeTrabaja = []
    var property honorarios  
    var totalRecadudado = 0

    method totalRecadudado() = totalRecadudado 

    method agregarUnaProvincia(unaProvincia) {
      provinciaDondeTrabaja.add(unaProvincia)
    }

    method cobrar(unImporte) {
      totalRecadudado += unImporte
    }

    method pasarDinero(unImporte,unProfecional) {
      totalRecadudado = (totalRecadudado - unImporte).max(0)
      unProfecional.cobrar(unImporte)
    }
}

object asociacion {
  var totalRecaudado = 0

  method recibirDonaciones(unImporte) {
    totalRecaudado += unImporte
  }

  method totalRecaudado() = totalRecaudado
}