import aparatos.*

class Paciente {
	var property edad
	var property nivelFortaleza
	var property nivelDolor
	const aparatosDeRutina = []
	
	method usar(aparato) {
		aparato.serUsadoPor(self)
	}
	method puedeUsar(aparato) = aparato.puedeSerUsadoPor(self)
	method puedeHacerRutina() = aparatosDeRutina.all{ a => self.puedeUsar(a) }
	method hacerSesion() {
		if(!self.puedeHacerRutina()) self.error("El paciente no puede hacer la rutina")
		aparatosDeRutina.forEach{ a => self.usar(a)}
	}
}

class Resistente inherits Paciente {
	override method usar(aparato) {
		super(aparato)
		nivelFortaleza ++
	}
}

class Caprichoso inherits Paciente {
	method tieneAlgunAparatoDeColor(color) = aparatosDeRutina.any{ a => a.color() == color}
	override method puedeHacerRutina() = super() and self.tieneAlgunAparatoDeColor(rojo)
	override method hacerSesion() {
		super() super()
	}
}

class RapidaRecuperacion inherits Paciente {
	var nivelAlivioDolor = 3
	
	method configurarAlivioDolor(nivel) { nivelAlivioDolor = nivel }
	override method hacerSesion() {
		super()
		nivelDolor -= nivelAlivioDolor
	}
}