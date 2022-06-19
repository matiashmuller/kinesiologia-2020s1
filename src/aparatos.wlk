import pacientes.*

class Aparato {
	const property color = blanco
	method serUsadoPor(paciente)
	method puedeSerUsadoPor(paciente) = true
	method necesitaMantenimiento() = false
	method hacerMantenimiento() {}
}

class Magneto inherits Aparato{
	var puntosImantacion = 200
	
	override method serUsadoPor(paciente) {
		paciente.nivelDolor(paciente.nivelDolor()*0.9)
		puntosImantacion --
	}
	override method necesitaMantenimiento() = puntosImantacion <100
	override method hacerMantenimiento() { puntosImantacion += 500 }
}

class Bicileta inherits Aparato{
	var cantDesajusteTornillo = 0
	var cantPerdioAceite = 0
	
	override method serUsadoPor(paciente) {
		if(paciente.nivelDolor()>30) cantDesajusteTornillo++
		if(paciente.edad().between(30,50)) cantPerdioAceite++
		if(paciente.puedeUsar(self)){
		paciente.nivelDolor(0.max(paciente.nivelDolor()-4))
		paciente.nivelFortaleza(paciente.nivelFortaleza() +3)
		}
	}
	override method puedeSerUsadoPor(paciente) = paciente.edad() > 8
	override method necesitaMantenimiento() = cantDesajusteTornillo <=10 || cantPerdioAceite<=5
	override method hacerMantenimiento() { 
		cantDesajusteTornillo = 0
	 	cantPerdioAceite = 0 
	}
}

class Minitramp inherits Aparato{
	override method serUsadoPor(paciente) {
		if(paciente.puedeUsar(self)){
		paciente.nivelFortaleza(paciente.nivelFortaleza() + paciente.edad()*0.1)
		}
	}
	override method puedeSerUsadoPor(paciente) = paciente.nivelDolor() < 20
}


object blanco {}
object rojo {}
object verde {}
object azul {}