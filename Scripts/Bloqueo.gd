extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite2D2
#var label: Label
var collision_shape: CollisionShape2D

func _ready():
	#label = get_node("Label")
	collision_shape = $CollisionShape2D 
	#label.text = "Sprite ID:" + str(sprite.frame)
	
func destroy():
	
	if sprite.frame == 0:
		sprite.frame = 1  # Cambiar sprite.frame a 1
		collision_shape.scale = Vector2(1, 1)	
		
	elif sprite.frame == 1:
		sprite.frame = 3 
		
	elif sprite.frame == 3:
		queue_free()  # Destruir el objeto (StaticBody2D)
		print("destroyed!")
	
	#label.text = "Sprite ID:" + str(sprite.frame)
		
