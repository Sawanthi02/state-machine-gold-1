extends State
class_name PlayerFalling
	
func Update(_delta:float):
	if target.is_on_floor():
		state_transition.emit("idle")
	elif target.is_on_wall_only():
		state_transition.emit("wall_slide")

func Physics_Update(_delta: float):
	if target:
		var horizontal := Input.get_axis("ui_left", "ui_right")
		
		target.velocity.y += gravity
		target.velocity.x = horizontal * speed
