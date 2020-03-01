extends KinematicBody2D
class_name Actor
var velocity: = Vector2.ZERO
export var speed:= Vector2(300.0,1000.0)
export var gravity = 3000.0
func _physics_process(delta: float) -> void:
	pass
	#velocity.y = max(velocity.y,speed.y)
	


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
