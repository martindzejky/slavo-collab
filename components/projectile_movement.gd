extends Node
class_name ProjectileMovement

@export var root: Node2D
@export var speed: float = 200
@export var direction: Vector2 = Vector2.ZERO

func _process(delta: float) -> void:
  root.position += direction * speed * delta
