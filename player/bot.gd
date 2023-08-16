extends CharacterBody2D

@export var speed:float = 350
@onready var animation_tree : AnimationTree = $AnimationTree
var direction : Vector2 = Vector2.ZERO

@export var orbe_scene : PackedScene

var max_orbes : int = 5
var orbes : Array = []
var orbe_spacing : float = 50.0
var orbe_spring_strength : float = 30.0

func _ready():
	animation_tree.active = true
	
func _process(_delta):  #Salia error que delta nunca se usaba y que le pusiera _delta (tambien abajo)
	update_animation_parameters()
	
func _physics_process(_delta): 
	direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down").normalized()
	
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
	
	for i in range(orbes.size()):
		
		var target_position = global_position + Vector2(0, i * orbe_spacing)
		
		var spring_force = (target_position - orbes[i].global_position) * orbe_spring_strength
		
		orbes[i].apply_central_impulse(spring_force * _delta)
		
func update_animation_parameters():
	if (velocity == Vector2.ZERO): 
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true
		
	if (Input.is_action_just_pressed("atack")):
		animation_tree["parameters/conditions/swing"] = true
	else:
		animation_tree["parameters/conditions/swing"] = false
		
	if (direction != Vector2.ZERO):
		animation_tree["parameters/Idle/blend_position"] = direction
		animation_tree["parameters/Walk/blend_position"] = direction
		
		
func create_orbes():
	
	for i in range(max_orbes):
		
		var new_orbe = orbe_scene.instantiate()
		
		add_child(new_orbe)
		
		orbes.append(new_orbe)
		
		new_orbe.global_position = global_position + Vector2(0, i * orbe_spacing)

func collect_orbe():
	
	if orbes.size() < max_orbes:
		
		var new_orbe = orbe_scene.instantiate()
		
		add_child(new_orbe)
		
		orbes.append(new_orbe)
		
		new_orbe.global_position = global_position + Vector2(0, orbes.size() * orbe_spacing)
