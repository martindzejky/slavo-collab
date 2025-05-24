extends Movement
class_name EnemyMovement

@export var root: CharacterBody2D

func _physics_process(_delta: float) -> void:
  root.velocity = move_direction * move_speed
  root.move_and_slide()
