extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

onready var label:=get_node("CanvasModulate/CanvasLayer/Label")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	label.text=LevelTo.level_name
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	get_tree().change_scene_to(LevelTo.level_to_go)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
