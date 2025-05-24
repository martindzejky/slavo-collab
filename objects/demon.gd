extends CharacterBody2D
class_name Demon

# Movement properties
@export var move_speed: float = 100
@export var move_direction: Vector2 = Vector2.ZERO

func _process(_delta: float) -> void:
  follow_player()

func follow_player() -> void:
  var player := get_tree().get_first_node_in_group('player') as Node2D
  if not player: return

  var direction_to_player := player.global_position - global_position
  move_direction = direction_to_player.normalized()

func _physics_process(_delta: float) -> void:
  # Handle movement
  velocity = move_direction * move_speed
  move_and_slide()
