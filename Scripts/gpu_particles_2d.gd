extends GPUParticles2D
class_name DrakeDeathParticles



func _on_finished() -> void:
	queue_free()
