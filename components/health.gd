extends Node
class_name Health

signal died
signal health_changed

@onready var max_health: float = current_health

@export var current_health: float:
  set(value):
    current_health = value
    emit_signal('health_changed')

    if current_health <= 0:
      emit_signal('died')