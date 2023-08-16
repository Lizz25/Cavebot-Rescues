extends Node

var diamantes : int

#func _ready():
	
	#var diamantesNode = find_child("Pickup_diamante")
	#var diamantesNode = get_parent().get_node("res://Objetos/Pickups/Pickup_diamante.tscn/Sprite2D")
	#var diamantesNode = get_parent().get_node("Pickup_diamante")
	#diamantesNode.connect("diamantesCollected",self,"handleDiamanteCollected")
	#diamantesNode.connect("diamantesCollected",Callable(self,"handleDiamanteCollected"))
	
	#var pickup_diamante_scene = preload("res://Objetos/Pickups/Pickup_diamante.tscn")
	#var pickup_diamante_instance = pickup_diamante_scene.instantiate()
	#add_child(pickup_diamante_instance)

# Acceder al nodo llamado "Sprite" dentro de la instancia de Pickup_diamante
	#var sprite_node = pickup_diamante_instance.get_node("Sprite2D")
	
	#sprite_node.connect("diamantesCollected",Callable(self,"handleDiamanteCollected"))

	#$diamantesCont.text = str(diamantes)

#func handleDiamanteCollected():
	#print("Diamante Recogido")
	#diamantes += 1
	#$diamantesCont.text = str(diamantes)
	
func _process(_delta):
	$diamantesCont.text = str(Global.contador)
	
