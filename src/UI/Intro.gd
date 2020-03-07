extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
export var level: PackedScene
export var level_name:=""
onready var label:=get_node("CanvasModulate/CanvasLayer/Label")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	label.text=level_name
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	get_tree().change_scene_to(level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
