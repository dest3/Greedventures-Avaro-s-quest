extends "res://scripts/player/state.gd"
#pasiencia con el sketch que esta en proceso, creo que lo estoy haciendo mal (?

var grabing = true
@onready var Bolsa = get_tree().get_first_node_in_group("bolsa")


 
func update(delta):
	#aca se indica de que fomra sale del estado 
	#(si este escript se ejecuta es porque ya esta en el estado) 
	Player.gravity(delta)
	player_movement()
	if Player.velocity.x == 0:
		return STATES.IDLE
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
	
	return null

func enter_state():
	#aca se aplicarian los "trades de la bolsa" cuando la agarra
	#if de jony 

	if Player.grab_input :
			Bolsa.global_position = Player.pi.global_position
			Bolsa.freeze = true #freeze y sleeping en true le quitan la fisica a la bolsa
			Bolsa.sleeping=  true

	if Player.grab_input :#el drop funciona pero en player , no se porque no aqui
		
		Bolsa.freeze = false
		Bolsa.sleeping=  false
	pass

func exit_state():
	#aca se quitan los "trades de la bolsa" cuando la suelta
	grabing = false
	pass

