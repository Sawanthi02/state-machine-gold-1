extends State
class_name PlayerWallSlide

var wall_direction

func Enter():
	target.velocity = Vector2(0, 0)
	wall_direction = target.get_slide_collision(0).get_normal().x

func Update(_delta:float):
	if Input.is_action_pressed("ui_up"):
		state_transition.emit("jump")
	elif Input.get_axis("ui_left", "ui_right") != 0 && Input.get_axis("ui_left", "ui_right") == wall_direction:
		state_transition.emit("falling")
