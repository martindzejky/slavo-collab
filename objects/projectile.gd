extends Node2D
class_name Projectile

@export var move_speed: float = 0
@export var move_direction: Vector2 = Vector2.ZERO

func _process(delta: float) -> void:
  position += move_direction * move_speed * delta
