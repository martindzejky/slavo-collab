extends Node2D
class_name Projectile

@export var damage: float = 0

@export var move_speed: float = 0
var move_direction: Vector2 = Vector2.ZERO

func _process(delta: float) -> void:
  position += move_direction * move_speed * delta

func _on_collider_body_entered(body: Node2D) -> void:
  # Should be something we can damage
  body.health.current_health -= damage
  queue_free()
