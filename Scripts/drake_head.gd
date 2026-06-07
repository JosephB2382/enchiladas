extends Area2D
class_name DrakeHead





func _on_body_entered(body: Node2D) -> void:
	if body.has_method("jump"):
		body.jump(1.3)
	get_parent().queue_free()
