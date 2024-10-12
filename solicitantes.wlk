class Persona {
  const property provincia 

  method puedeSerAtendidoPor(unProfecional) {
    return unProfecional.provinciaDondeTrabaja().contains(provincia)
  }  
}

class Institucion {
  const property universidadesReconocidas 

  method agregarUniversidad(unaUniversidad) {
    universidadesReconocidas.add(unaUniversidad)
  }

  method puedeSerAtendidoPor(unProfecional) {
    return universidadesReconocidas.contains(unProfecional.universidad())
  }
}

class Club {
  const property provinciaDondeEsta 

  method agregarProvincia(unaProvincia) {
    provinciaDondeEsta.add(unaProvincia)
  }

  method puedeSerAtendidoPor(unProfecional) {
    return not provinciaDondeEsta.asSet().intersection(unProfecional.provinciaDondeTrabaja().asSet()).isEmpty()
  } 
}