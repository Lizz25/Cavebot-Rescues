extends StaticBody2D

@export var pickup_type : PackedScene
@onready var level_parent = get_parent()
@onready var sprite : Sprite2D = $Sprite2D

@export var amount : int 

@export var launch_speed : float = 250
@export var launch_duration : float = 0.20

func _ready():
	set_random_properties()  # Cambiar el frame del sprite al iniciar
	

func collect():
	for n in range(amount):
		call_deferred("spawn_resource")  # Llamar a spawn_resource usando call_deferred()
	
	queue_free()

func spawn_resource(): 
	var pickup_instance = pickup_type.instantiate()  # Instanciar la PackedScene

	level_parent.add_child(pickup_instance)  # Agregar la instancia al escenario
	pickup_instance.set_global_position(global_position) # Establecer la position de diamante
	
	var direction : Vector2 = Vector2( 
		randf_range(-30, 30), # Para que sea random lugar de caida
		randf_range(-30, 30)
		).normalized()
		
	pickup_instance.launch(direction * launch_speed, launch_duration) 
		
		
func set_random_properties():
	amount= int(randf_range(3, 6))
	sprite.frame = int(randf_range(0, 4))
	
	# Invertir sprite con escala
	var scale_factor = randf()
	if scale_factor < 0.5:
		sprite.scale = Vector2(0.4, 0.4)  
	else:
		sprite.scale = Vector2(-0.4, 0.4)  
