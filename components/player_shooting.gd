extends Node
class_name PlayerShooting

@export var root: Node2D
@export var cooldown_timer: Timer
@export var aiming: PlayerAiming

@export var projectile: PackedScene
@export var projectile_movement_component_path: NodePath
@export var projectile_movement_direction_name: String

func _process(_delta: float) -> void:
  assert(projectile != null, 'Projectile is not set!')

  if cooldown_timer.time_left > 0:
    return

  if not Input.is_action_pressed('shoot'):
    return

  cooldown_timer.start()

  var shot_projectile = projectile.instantiate()
  root.get_parent().add_child(shot_projectile)

  shot_projectile.global_position = root.global_position
  shot_projectile.get_node(projectile_movement_component_path)[projectile_movement_direction_name] = aiming.aim_direction
