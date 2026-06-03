extends Node2D

@export var speed: float = 40
@export var move_distance: float = 50

var start_x: float
var direction: int = 1

func _ready() -> void:
	start_x = position.x

func _process(delta: float) -> void:
	position.x += speed * direction * delta

	if position.x > start_x + move_distance:
		direction = -1

	if position.x < start_x - move_distance:
		direction = 1
