extends "res://src/actors/actor.gd"

const kill_score:=10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#disable until enabled by visibility enabler
	set_physics_process(false)
	velocity.x = -0.2*speed.x;



func _physics_process(delta: float) -> void:
	
	if is_on_wall():
		velocity.x *= -1
	velocity.y += gravity*delta
	velocity.y = move_and_slide(velocity,Vector2.UP).y





func _on_Stomper_body_entered(body: Node) -> void:
	PlayerData.score += kill_score
	queue_free()
