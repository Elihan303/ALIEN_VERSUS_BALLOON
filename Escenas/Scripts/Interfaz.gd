extends CanvasLayer

signal iniciar_juego

func monstrar_mensaje(texto):
	$Titulo.text= texto
	$Titulo.show()
	$Titulo_timer.start()
	
func game_over():
	monstrar_mensaje("Game Over")
	yield($Titulo_timer, "timeout")
	$BotonPlay.show();
	$Titulo.text= "ALIEN VERSUS BALLOON"
	$Titulo.show()

func Update_Puntos(Puntos):
	$Puntos.text=str(Puntos)
func Update_Tiempo(Tiempo):
	$Tiempo.text= str(Tiempo)



func _on_Titulo_timer_timeout():
	$Titulo.hide()


func _on_BotonPlay_pressed():
	$BotonPlay.hide()
	emit_signal("iniciar_juego")
