extends Movement
class_name PlayerMovement

@export var root: CharacterBody2D

func _physics_process(delta: float) -> void:
  move_direction = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')

  root.velocity = move_direction * move_speed
  root.move_and_slide()
