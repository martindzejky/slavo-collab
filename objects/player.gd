extends CharacterBody2D
class_name Player

# Movement properties
@export var move_speed: float = 0
var move_direction: Vector2 = Vector2.ZERO

# Aiming properties
var aim_direction: Vector2 = Vector2.ZERO
var aim_global_position: Vector2 = Vector2.ZERO
const aim_distance: float = 100

# Shooting properties
@export var cooldown_timer: Timer
@export var projectile: PackedScene

# Health
@export var health: Health

func _physics_process(_delta: float) -> void:
  # Handle movement
  move_direction = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
  velocity = move_direction * move_speed
  move_and_slide()

func _process(_delta: float) -> void:
  # Handle aiming
  aim_direction = Input.get_vector('aim_left', 'aim_right', 'aim_up', 'aim_down')
  aim_global_position = global_position + aim_direction * aim_distance

  if aim_direction.length() <= 0.1:
    # use the mouse position
    aim_global_position = get_global_mouse_position()
    aim_direction = aim_global_position - global_position
    aim_direction = aim_direction.normalized()

  # Handle shooting
  if cooldown_timer.time_left <= 0 and Input.is_action_pressed('shoot'):
    shoot()

func shoot() -> void:
  cooldown_timer.start()

  var shot_projectile = projectile.instantiate() as Projectile
  get_parent().add_child(shot_projectile)

  shot_projectile.global_position = global_position
  shot_projectile.move_direction = aim_direction
