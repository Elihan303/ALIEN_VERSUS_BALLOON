extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#connect("body_entered", self, "RecibirDisparo")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Visibilidad_screen_exited():
	queue_free() #se elimina el globo al salir de la pantalla


