object centroKinesiologia {
	const aparatosQueTiene=[]
	const pacientes=[]
	
	
	method agregarAparato(aparato) { aparatosQueTiene.add(aparato) }
	method coloresDeAparatos() = aparatosQueTiene.map({a=>a.color()}).asSet()
	method pacientesMenoresDe8() = pacientes.filter{p=>p.edad()<8}
	method noPuedenHacerSesion() = pacientes.filter{p=>!p.puedeHacerRutina()}
	method estaOptimo() = aparatosQueTiene.all{a=>!a.necesitaMantenimiento()}
	method estaComplicado() = self.cuantosNecesitanMantenimiento() >= aparatosQueTiene.size()*0.5
	method cuantosNecesitanMantenimiento() = aparatosQueTiene.count{a=>a.necesitaMantenimiento()}
	method llamarAlTecnico() { self.necesitanMantenimiento().forEach{a=>a.hacerMantenimiento()}}
	method necesitanMantenimiento() = aparatosQueTiene.filter{a=>a.necesitaMantenimiento()}
}