class Empresa {
    var property honorarioDeReferencia
    const property profesionales = []
    const property clientes = #{} 

    method contratar(unProfesional) {
      profesionales.add(unProfesional)
    }

    method cuantosEstudiaronEn(unaUniversidad) {
      return profesionales.count({p => p.universidad() == unaUniversidad})
    }

    method profesionalesCaros() {
      return profesionales.filter({p => p.honorarios() > honorarioDeReferencia}).asSet()
    }

    method universidadesFormadoras() {
      return profesionales.map({p => p.universidad()}).asSet()
    }

    method profesionalMasBarato() {
      return profesionales.min({p => p.honorarios()})
    }

    method esDeGenteAcotada() {
      return profesionales.all({p => p.provinciaDondeTrabaja().size() <= 3})
    }

    method puedeSatisfacerA(unSolicitante) {
      return profesionales.any({p => unSolicitante.puedeSerAtendidoPor(p)})
    }

    method darServicio(unSolicitante) {
      if(self.puedeSatisfacerA(unSolicitante)){
        const unProfe = profesionales.find({p => unSolicitante.puedeSerAtendidoPor(p)})
        unProfe.cobrar(unProfe.honorarios())
        clientes.add(unSolicitante)
      }
    }

    method cantidadDeClientes() = clientes.size()

    method tieneComoClienteA(unSolicitante) = clientes.contains(unSolicitante)

    method esProfecionalPocoAtractivo(unProfecional) {
      const provinciasProf = unProfecional.provinciaDondeTrabaja().asSet()
      const profMismaProvin = profesionales.filter({p => p.provinciaDondeTrabaja().asSet() == provinciasProf})
      return profMismaProvin.any({p => p.honorarios() < unProfecional.honorarios()})
    }
}