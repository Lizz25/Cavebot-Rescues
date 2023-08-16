extends Node2D #Este es el poder del robot

func _on_area_2d_body_entered(body): #Detecta si algun objeto entra en la area de colisión del poder):
	
	#var local_position = to_local(body.global_transform.origin)
	if body.has_method("collect"):
		body.collect()
	
	if body.has_method("destroy"):
		body.destroy()
