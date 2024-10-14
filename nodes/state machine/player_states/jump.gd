extends State
class_name PlayerJump

func Enter():
	target.velocity.y = jump_velocity

func Exit():
	pass
	
func Update(_delta:float):
	if target.velocity.y > 0:
		state_transition.emit("falling")


func Physics_Update(_delta: float):
	if target:
		var horizontal := Input.get_axis("ui_left", "ui_right")
		target.velocity.x = horizontal * speed
		target.velocity.y += gravity
