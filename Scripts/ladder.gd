extends Area2D

func _on_body_entered(body):
	print("Ladder touched:", body.name)

	if body.name == "player":
		print("Player entered ladder")
		body.on_ladder = true

func _on_body_exited(body):
	print("Ladder exited:", body.name)

	if body.name == "player":
		body.on_ladder = false
