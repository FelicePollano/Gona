extends Light2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
export var angular_velocity:= 10.0
export var move_radius:=200.0
var angle:=0.0
onready var pos := position
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if angle>=PI*2:
		angle -= PI*2
	var new_pos = Vector2(pos.x+move_radius*sin(angle),pos.y+move_radius*cos(angle))
	set_position(new_pos)
	angle += angular_velocity*delta

