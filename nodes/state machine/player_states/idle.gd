extends State
class_name playerIdle

func Enter():
	if target:
		target.velocity = Vector2(0, 0)

func Update(_delta:float):
	if Input.get_axis("ui_left", "ui_right"):
		state_transition.emit("walking")
	elif Input.is_action_pressed("ui_up"):
		state_transition.emit("jump")
