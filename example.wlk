class Armas{
  method valorDeAtaque()
}

class Filo inherits Armas{
  const longitud
  var filo = true
  method filo() = if(filo) 1 else 0
  override method valorDeAtaque() = longitud * filo
}

class Contundente inherits Armas{
  var peso
  override method valorDeAtaque() = peso
}

class Armadura{
  method puntosArmadura(gladiador)
}
class Casco inherits Armadura{
  override puntosArmadura(gladiador) = 10
}
class Escudo inherits Armadura{
  override puntosArmadura(gladiador) = 5 +(gladiador.destreza() * 0.1)
}
class Gladiadores{
  var vida = 100
  method destreza()
  method fuerza()
  method valorDeAtaque()
  method valorDeDefensa()
  method atacar(UnGladiador){
    UnGladiador.vida = UnGladiador.vida - (self.valorDeAtaque() - UnGladiador.valorDeDefensa())
  }
  method pelear(unGladiador){
    self.atacar(unGladiador)
    unGladiador.atacar(self)
  }
}
class Mirmillones inherits Gladiadores{
  method cambiarAEspada{
    arma = espada
  }
  method cambiarAGladius{
    arma = gladius
  }
  override method valorDeAtaque(){
    return (arma.valorDeAtaque() + self.fuerza())
  }
  override method valorDeDefensa(){
    return (armadura.puntosArmadura() + self.destreza())
  }
  override method destreza() = 15 
  method cambiarArmadura(nuevaArmadura){
    armadura = nuevaArmadura
  }
  override method crearGrupo(otroGladiador) {  
    new Grupo  ( nombre = "mirmillolandia", 
    gladiadores = [self, otroGladiador]) 
  }
  
} 
class dimacheurus inherits Gladiadores{
  override method fuerza() = 10
  var armadura = none
  method agregarArma(unArma){
    armas.add(unArma)
  }
  const armas = []
  override valorDeAtaque() = armas.sum({unArma => unArma.valorDeAtaque} + self.fuerza())
  override valorDeDefensa() = self.destreza() * 0.5
  override atacar(UnGladiador){
    super(UnGladiador)
    self.destreza() = self.destreza() + 1
  }
}
class Grupos{
  const nombre
  const miembros = []
  var cantidadPeleas
  method sumarPelea(){
    cantidadPeleas = cantidadPeleas + 1
  }
  method sumarMiembro(unMiembro){
    miembros.add(unMiembro)
  }
  method sacarMiembro(unMiembro){
    miembros.remove(unMiembro)
  }
  method pelea(otroGrupo){
      
  }
  method campeon{
    return(miembros.filters({miembro => miembro.vida()>0}).max(miembro => miembro.fuerza))
  }

}

