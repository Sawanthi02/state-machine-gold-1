extends CharacterBody2D
class_name Character

@onready var animatedSprite : AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	if(!animatedSprite):
		printerr("Character objects need a AnimatedSprite2D")
		
