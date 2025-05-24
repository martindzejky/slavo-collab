extends Node
class_name PlayerAiming

@export var root: Node2D
@export var aim_direction: Vector2 = Vector2.ZERO
@export var aim_global_position: Vector2 = Vector2.ZERO

const aim_distance: float = 100

func _process(_delta: float) -> void:
  aim_direction = Input.get_vector('aim_left', 'aim_right', 'aim_up', 'aim_down')
  aim_global_position = root.global_position + aim_direction * aim_distance

  if aim_direction.length() <= 0.1:
    # use the mouse position
    aim_global_position = root.get_global_mouse_position()
    aim_direction = aim_global_position - root.global_position
    aim_direction = aim_direction.normalized()
