extends "res://scripts/player/state.gd"
@onready var Bolsa = get_tree().get_first_node_in_group("bolsa")
#desde el estado de IDLE el jugador puede ingresar a 
#MOVE,DASH,JUMP,FALL
func update(delta):
	Player.gravity(delta)
	if Player.movement_input.x != 0:
		return STATES.MOVE
	if Player.jump_input_actuation == true:
		return STATES.JUMP
	if Player.velocity.y >0:
		return STATES.FALL
	if Player.dash_input and Player.can_dash:
		return STATES.DASH
	if Player.climb_input and Player.get_next_to_wall() != null:
		return STATES.SLIDE
	if Player.velocity.y < 0 and Player.get_next_to_wall() != null:
		return STATES.JUMP
	#if Player.grab_input and Player.is_on_floor() :
		#return STATES.GRAB
	#
	return null

#al entrar al estado resetea el dash
func enter_state():
	Player.can_dash = true
	Player.sprite.play("idle")
