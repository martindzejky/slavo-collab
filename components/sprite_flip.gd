extends Node2D
class_name SpriteFlip

@export var root: CharacterBody2D

func _physics_process(_delta: float) -> void:
  if root.velocity.x > 0:
    scale.x = 1
  elif root.velocity.x < 0:
    scale.x = -1
