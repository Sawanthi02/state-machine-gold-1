extends State
class_name Dash

var dash_lock : float
var direction

func Enter():
	direction = Input.get_axis("ui_left", "ui_right")
	target.velocity.y = 0
	dash_lock = 0.5
	
func Update(_delta:float):
	if dash_lock > 0:
		dash_lock -= _delta
	else:
		state_transition.emit("walking")

func Physics_Update(_delta: float):
	if target:
		target.velocity.x = direction * dash_speed
