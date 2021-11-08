extends RigidBody2D

var pixelesPorSegundos= 380
var tiempoHastaDisparo= 1.0
var timepoPorCadaDisparo =2.0


func _ready():
	pass



func _process(delta):
	position.x -= pixelesPorSegundos * delta
	if(position.x<0):
		queue_free()
		




