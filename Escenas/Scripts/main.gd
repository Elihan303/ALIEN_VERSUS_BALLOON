extends Node2D
export (PackedScene) var GloboAzul
export (PackedScene) var GloboNaranja
export (PackedScene) var Nube
var Puntos =10
var Tiempo
var GloboA
var GloboN


func _ready():
	randomize()
	$Laser.hide()
	$Player.hide() 
	$Interfaz.Update_Puntos(Puntos)
	
	


#func _process(delta):



func nuevo_juego():
	$Player/Nave_sprite.show()
	$Player/Colision_nave.disabled= false
	Puntos=10
	Tiempo=0
	$Inicio_timer.start()
	$Interfaz.monstrar_mensaje("Preparate")
	$Tiempo_timer.start()
	$Nube_timer.start()
	$Player.show() 
	$Interfaz.Update_Puntos(Puntos)
	$Musica.play()
	

func game_over():
	$Globo_timer.stop()
	$Tiempo_timer.stop()
	$Nube_timer.stop()
	$Musica.stop()
	$Interfaz.game_over()



func _on_Inicio_timer_timeout():
	$Globo_timer.start()
	


func _on_Globo_timer_timeout():
	#Seleccionar un lugar aletorio en el camino para los globos
	$Camino/Globo_Posicion.set_offset(randi())
	$Camino2/Globo_Posicion2.set_offset(randi())
	GloboA= GloboAzul.instance()
	GloboN= GloboNaranja.instance()
	add_child(GloboA)
	add_child(GloboN)
	#var direccion= $Camino/Globo_Posicion 
	GloboA.position= $Camino/Globo_Posicion.position
	GloboN.position= $Camino2/Globo_Posicion2.position
	
	#GloboA.set_linear_velocity(Vector2(rand_range(GloboA.velocidad_min, GloboA.velocidad_max)))

func _on_Tiempo_timer_timeout():
	Tiempo+=1
	$Interfaz.Update_Tiempo(Tiempo)



func _on_ExplotarAbajo_area_entered(area):
	$Player/Nave_sprite.hide()
	$Player/Colision_nave.disabled= true
	game_over()











func _on_Nube_timer_timeout():
	var posicion1 = rand_range(100,170)	
	var nube= Nube.instance()
	add_child(nube)
	nube.position= Vector2(1060,posicion1)




func _on_Globo_azul_body_entered(body):
	print("funciona")
