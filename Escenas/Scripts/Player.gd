extends Area2D

#Variables
export (int) var velocidad
var movimiento = Vector2()
var limite
signal Nave_exploto
export (PackedScene) var Laser

var tiempoHastaDisparo= 1.0
var timepoPorCadaDisparo =1.0



func _ready():
	limite= get_viewport().size

func _process(delta):
	tiempoHastaDisparo+=delta
	
	#reinicar valores
	movimiento.y=0
	#Arriba
	if Input.is_action_pressed("ui_up"):
		movimiento.y-=300
	#Abajo
	if Input.is_action_pressed("ui_down"):
		movimiento.y+=300
	
	position += movimiento * delta
	position.x = clamp(position.x, 0, limite.x)
	position.y = clamp(position.y, 0, limite.y)
	
	if Input.is_key_pressed(KEY_SPACE):
		disparar()
	
	
	#if position.y>790:
	#	$Nave_sprite.hide()
	#if position.y==0:
	#	$Nave_sprite.hide()
		





	
		
func disparar():
	if tiempoHastaDisparo>=timepoPorCadaDisparo:
		tiempoHastaDisparo=0
		var disparo= Laser.instance()
		disparo.position= position - Vector2(200,0)
		get_parent().add_child(disparo)
		$Sonido_laser.play()

func _on_Player_body_entered(body):
	$Nave_sprite.hide()
	emit_signal("Nave_exploto")
	$Colision_nave.disabled= false

	





