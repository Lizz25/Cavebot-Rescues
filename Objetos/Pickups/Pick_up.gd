extends Area2D

#senal para el puntaje 
signal diamantesCollected

@onready var collision_shape : CollisionShape2D = $CollisionShape2D
@onready var sprite : Sprite2D = $Sprite2D

var launch_velocity : Vector2 = Vector2.ZERO
var move_duration : float = 0
var time_since_launch : float = 0
var launching : bool = false : 
	
	set(is_launching): 
		launching = is_launching
		collision_shape.disabled = launching
	
func _ready():
	set_random_properties()  # Cambiar el frame del sprite al iniciar
	
	
func _process(delta): 
	if(launching):
		position += launch_velocity * delta
		time_since_launch += delta
		
		if (time_since_launch >= move_duration):
			launching = false

func launch(velocity : Vector2, duration : float): 
	launch_velocity = velocity
	move_duration = duration
	time_since_launch = 0
	launching = true
	
func set_random_properties():
	# Frame
	sprite.frame = int(randf_range(0, 3))
	
	# Invertir sprite con escala
	var scale_factor = randf()
	if scale_factor < 0.5:
		sprite.scale = Vector2(0.7, 0.7)  
	else:
		sprite.scale = Vector2(-0.7, -0.7)  
	
	# rotation
	rotation_degrees = randf_range(-100, -115)  
	sprite.rotation_degrees = rotation_degrees  # Aplicar la rotación al sprite
	print(scale_factor)
	print(sprite.scale)

#Recoleccion de diamantes 
func _on_body_entered(body):
	if body.is_in_group("player"):
		print("player detectado")
		
		Global.contador += 1 
		print(Global.contador)
		#get_parent().diamantes += 1 
		#print(str(get_parent().diamantes))
		#Emitir senal 
		emit_signal("diamantesCollected")
		queue_free()
		
		


	
