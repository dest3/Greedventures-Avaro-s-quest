extends RigidBody2D

#bolsa de avaro, aca van todos sus estados, para ser accedidos 

const lines: Array[String]= [
	"hola este es el primer test del sistemas de dialogo",


]

@onready var interaction_area: interactionArea = $InteractionArea
@onready var Player = get_tree().get_first_node_in_group("player")
@onready var colision = $CollisionShape2D

var peso = 0
var p = self
var is_caught = false

func _ready():
	interaction_area.interact = Callable(self, "on_interact")
	print(self.position)

func _physics_process(_delta):
	print("Peso de la bolsa ",peso,"kl")
	
	
	
func on_interact():
	DialogManager.start_dialog(global_position, lines)


func _on_area_entered(_area):
	if Player.is_in_group("player"):#area para detectar si entro el personaje y asi que pueda 
		#agarrar la bolsa 
		is_caught = true 



func _on_area_exited(_area):
	if Player.is_in_group("player"):
		is_caught = false

	
