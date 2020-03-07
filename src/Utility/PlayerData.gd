extends Node


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var score:=0 setget set_score,get_score


func set_score(value:int)->void:
	score=value
	emit_signal("score_changed",value)
func get_score() -> int:
	return score


signal score_changed
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
