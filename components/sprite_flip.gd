extends Node
class_name SpriteFlip

@export var spriteRoot: Node2D
@export var movement: Movement

func _process(_delta: float) -> void:
  if movement.move_direction.x > 0:
    spriteRoot.scale.x = 1
  elif movement.move_direction.x < 0:
    spriteRoot.scale.x = -1
