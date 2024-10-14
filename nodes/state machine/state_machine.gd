extends Node
class_name StateMachine

@export var target : Character
@export var active_collision: CollisionShape2D

# Dict of possible states that are assigned to this state machine
var states : Dictionary = {} 
@export var current_state : State

# Fills the states Dict with all the child states of the state machine
# On entering sets the player physics and process to the assigned starting state
func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			# Connects all the transition signals from the states to the change state function in this machine
			child.state_transition.connect(change_state)
	
	if current_state:
		current_state.Enter()

# Uses the Update and Physics_Update function from the current active state
func _process(delta: float) -> void:
	if current_state:
		current_state.Update(delta)
		play_animation()

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.Physics_Update(delta)
		target.move_and_slide()

# Changes state whenever a state has send a state_transition signal
func change_state(new_state_name : String):
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		print("new state error empty")
		return
	
	print("swithing states: " + str(current_state) + " --> " + str(new_state))
	# Activates old states exit code
	if current_state:
		current_state.Exit()
	
	# Enters new state
	new_state.Enter()
	current_state = new_state

var last_direction : int = 1
func play_animation():
	target.animatedSprite.play(current_state.name.to_lower())
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		last_direction = sign(direction)
	target.animatedSprite.flip_h = last_direction < 0
