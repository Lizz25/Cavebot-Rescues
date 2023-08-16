extends Area2D


func _on_body_entered(body):
		if body.is_in_group("player"):
			body.collect_orbe()  # Llama a la función collect_orbe del jugador
			queue_free()
