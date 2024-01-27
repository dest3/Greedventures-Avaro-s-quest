extends Node2D

var peso_moneda = 5.5
@onready var Player = get_tree().get_first_node_in_group("player")
@onready var bolsa = get_tree().get_first_node_in_group("bolsa")
@onready var sprite  = $AnimatedSprite2D
@onready var area = $Area2D
@onready var colision = $Area2D/CollisionShape2D

func _ready():
	pass



func _on_area_entered(_area):
	if Player.is_in_group("player"):
		$AudioStreamPlayer.play()
		sprite.play("pick_up")
		await sprite.animation_finished
		queue_free()
#no se si es el orden de las cosas o que o quizas deba usar otro metodo 
#pero hay veces en las que el sonido suena raro o no suena completo 




func _on_area_exited(_area):
	if Player.is_in_group("player"):
		queue_free() # no se si este est de mas pero me soluciono un bug .. asi que....
		bolsa.peso += peso_moneda# lo puse aca porque en el entered a veces detectaba doble 
		
	
