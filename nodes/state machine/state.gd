extends Node
class_name State

signal state_transition

@onready var state_machine : StateMachine = get_parent()
@onready var target : CharacterBody2D = state_machine.target

var speed = 400
var jump_velocity = -2500
var gravity = 200
var dash_speed = 800
var crouch_speed = 200
var attack_speed = 300


func Enter():
	pass
	
func Exit():
	pass
	
func Update(_delta:float):
	pass
	
func Physics_Update(_delta:float):
	pass
