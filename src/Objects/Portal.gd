extends Node2D
export var next_level :PackedScene
export var next_level_name:=""

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var player:= get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Area2D_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_Area2D_body_entered(body: Node) -> void:
	player.play("FadeOut")
	yield(player,"animation_finished")
	LevelTo.level_to_go=next_level
	LevelTo.level_name=next_level_name
	var scene = get_tree().change_scene("res://src/UI/Intro.tscn");
	
	
