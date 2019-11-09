class Ave {
	//var property fuerza
	//method recibeDisgusto()
}

class Aguilucho {
	var property velocidad = 20
	method fuerza() { 
		if(velocidad <= 60) {
			return 180
		} else {
			return velocidad * 3
		}
	}
	method recibirDisgusto() {
		velocidad = velocidad * 2
	}
	method relajar() {
		velocidad -= 10
	}
	method estaConforme(isla) {
		return isla.alpiste() >= 8
	}
	method tomarAlimento(isla) {
		isla.sacarAlpiste(3)
		velocidad += 15
	}
}
class Albatros {
	var property peso = 4000
	var property masaMuscular = 600
	
	method fuerza() {
		return if(peso < 6000) {
			masaMuscular
		} else {
			masaMuscular / 2
		}
	}
	method recibirDisgusto() {
		peso += 800
	}
	method irAlGimnasio() {
		peso += 500
		masaMuscular += 500
	}
	method relajar() {
		peso -= 300
	}
	method estaConforme(isla) { //VERIFICAR
		var aves = isla.aves({ a => a.fuerza() })
		return aves.size({ a => a.fuerza() > self.fuerza() }) >=2
	}
	method tomarAlimento(isla) {
		isla.sacarMaiz(4)
		peso += 700
		masaMuscular += 700
	}
}
class Paloma {
	var property ira = 200
	
	method fuerza() {
		return ira * 2
	}
	method recibirDisgusto() {
		ira += 300
	}
	method relajar() {
		ira -= 50
	}
	method estaConforme(isla) {
		return isla.avesDebiles().size() >= 1 
	}
	method tomarAlimento(isla) { }
	method equilibrarse() {
		if(self.fuerza() <= 700) {
			self.recibirDisgusto()
		} else {
			self.relajar()
		}
	}
}
class AguiluchoColorado inherits Aguilucho {
	override method fuerza() {
		return super() + 400
	}
}
class PalomaTorcaza inherits Paloma {
	var property huevos = 3
	override method fuerza() {
		return huevos * 100
	}
	override method recibirDisgusto() {
		super() 
		huevos += 1
	}
}
class PalomaMontera inherits Paloma {//VERIFICAR
	var property topeDeFuerza = 2000
	
	override method fuerza() {
		return super().max(topeDeFuerza)
	}
}
class PalomaManchada inherits Paloma {
	var property nidos = #{}
	
	method agregarNido(nido) {
		nidos.add(nido)
	}
	override method recibirDisgusto() {
		super()
		self.agregarNido(new Nido()) 
	}
	override method relajar() {
		if(nidos.size() > 2) {
			nidos.forEach({ n => n.aumentarGrosor(1) })
		} else {
			super()
		}
	}
	method sumarPotencias() {//VERIFICAR
		ira += nidos.map({ n => n.potencia() })
	}
}
class Nido {
	var property grosor = 5
	var property resistencia = 3
	
	method aumentarGrosor(cantidad) {
		grosor += cantidad
	}
	method potencia() {
		return grosor * resistencia + 20
	}
}