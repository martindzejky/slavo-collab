extends Movement
class_name PlayerMovement

func _process(delta: float) -> void:
  move_direction = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
  root.position += move_direction * move_speed * delta
