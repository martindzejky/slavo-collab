extends Node
class_name PlayerMovement

@export var root: Node2D
@export var move_speed: float = 100
@export var move_direction: Vector2 = Vector2.ZERO

func _process(delta: float) -> void:
  move_direction = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
  root.position += move_direction * move_speed * delta
