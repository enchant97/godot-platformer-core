tool
class_name Door
extends Area2D
# Allows a player to progress to next level

signal door_collide

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(_body):
	print_debug("door collided")
	emit_signal("door_collide")
