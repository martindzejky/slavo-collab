extends Node
class_name EnemyFollowPlayer

@export var root: CharacterBody2D
@export var movement: Movement

func _process(_delta: float) -> void:
  var player := get_tree().get_first_node_in_group('player') as Node2D
  if not player: return

  var direction_to_player := player.global_position - root.global_position
  movement.move_direction = direction_to_player.normalized()
