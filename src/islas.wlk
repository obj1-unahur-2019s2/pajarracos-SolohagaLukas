class Isla {
	var aves = []
	var property alpiste = 10
	var property maiz = 10	
	
	method agregarAve(bird) {
		aves.add(bird)
	}
	method avesDebiles() {
		return aves.filter({ a => a.fuerza() < 1000 })
	}
	method fuerzaTotal() {
		return aves.sum({ a => a.fuerza() })
	}
	method esRobusta() {
		return aves.all({ a => a.fuerza() > 300 })
	}
	method terremoto() {
		aves.forEach({ a => a.recibirDisgusto() })
	}
	method tormenta() {
		self.avesDebiles().forEach({ a => a.recibirDisgusto() })
	}
	method aveCapitana() {
		var capitana = aves.filter({ a => a.fuerza().between(1000, 3000) })
		return capitana.max({ c => c.fuerza() })
	}
	method estaEnPaz() {
		return aves.all({ a => a.estaConforme(self)})
	}
	method sesionDeRelax() {
		aves.forEach({ a => a.relajar() })
	}
	method alimentacion() {
		aves.forEach({ a => a.tomarAlimento()})
	}
	method sacarAlpiste(cantidad) {
		alpiste -= cantidad
	}
	method sacarMaiz(cantidad) {
		maiz -= cantidad
	}
}
