extends Control

onready var score:=get_node("Label")
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerData.connect("score_changed",self,"update_ui")
	update_ui(PlayerData.score)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
func update_ui(newscore: int) -> void:
	score.text="Score: %s" % PlayerData.score
