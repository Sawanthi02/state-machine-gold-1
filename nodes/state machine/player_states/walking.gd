extends State
class_name PlayerWalking

func Enter():
	pass
	
func Update(_delta:float):
	if not target.is_on_floor():
		state_transition.emit("falling")
	elif Input.is_action_pressed("ui_up"):
		state_transition.emit("jump")
	elif Input.get_axis("ui_left", "ui_right") == 0.0:
		state_transition.emit("idle")
	elif Input.is_action_pressed("ui_down"):
		state_transition.emit("dash")

func Physics_Update(_delta: float):
	if target:
		var horizontal := Input.get_axis("ui_left", "ui_right")
		target.velocity.x = horizontal * speed
