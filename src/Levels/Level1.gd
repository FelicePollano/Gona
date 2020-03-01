extends Node2D

onready var audio:= get_node("AudioPlayerScream")
onready var anim:= get_node("AnimationPlayer")
func respawn() -> void:
	get_tree().reload_current_scene()

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
func _physics_process(delta: float) -> void:
	var player := get_node("Player/.") as KinematicBody2D
	if null != player and player.get_global_position().y > 573:
		audio.play()
		#player.set_global_position(Vector2.ZERO)
		player.queue_free()
		anim.play("Respawn")
		
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
