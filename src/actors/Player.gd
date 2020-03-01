extends Actor

var impulse:=0.0
export var bounche_acceleration:= 1000.0
export var bounche_impulse:= 800.0

onready var audioPlayerJump:= get_node("AudioPlayerJump")
onready var audioPlayerOuch:= get_node("AudioPlayerOuch")

func _physics_process(delta: float) -> void:
	var direction: = get_direction()
	if direction.y == -1:
		audioPlayerJump.play()
	var jump_interrupted: = velocity.y <0 and Input.is_action_just_released("jump")	
	velocity = calculate_velocity(velocity,direction,speed,jump_interrupted)
	#second parameter is the floor normal in order to be able
	#to make is_on_floor() working
	velocity = move_and_slide(velocity,Vector2.UP)
	
func get_direction() -> Vector2:
	
	return Vector2(
		Input.get_action_strength("move_right")-
		Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
		)
func calculate_velocity(linear_velocity: Vector2,
						direction: Vector2,
						speed: Vector2,
						interrupted: bool) -> Vector2:
	var new_velocity: = linear_velocity
	new_velocity.x = speed.x*direction.x
	new_velocity.x+= impulse
	if impulse<0:
		impulse += bounche_acceleration*get_physics_process_delta_time()
		if impulse>0:
			impulse=0
	if impulse>0:
		impulse -= bounche_acceleration*get_physics_process_delta_time()
		if impulse<0:
			impulse=0
		
	new_velocity.y += gravity*get_physics_process_delta_time() 
	if direction.y == -1.0:
		new_velocity.y = direction.y*speed.y
	if interrupted:
		new_velocity.y=0
	return new_velocity
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EnemyColliderForward_body_entered(body: Node) -> void:
	if !body.name.countn("Container") and body.name.begins_with("Enemy") and impulse==0.0:
		audioPlayerOuch.play()
		impulse = -bounche_impulse


func _on_EnemyColliderBackward_body_entered(body: Node) -> void:
	if !body.name.countn("Container") and body.name.begins_with("Enemy") and impulse == 0.0:
		impulse = bounche_impulse
		audioPlayerOuch.play()
