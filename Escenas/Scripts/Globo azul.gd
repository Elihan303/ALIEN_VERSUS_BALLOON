extends RigidBody2D

#Variables
export (int) var velocidad_max
export(int) var velocidad_min


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Visibilidad_screen_exited():
	queue_free() #se elimina el globo al salir de la pantalla


