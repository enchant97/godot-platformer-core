tool
class_name Key
extends Area2D
# A item that the player can pickup
# which will allow them to progress to the next level

signal key_collected

export var free_key_on_collect: bool = true

func _enter_tree() -> void:
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(_body):
	print_debug("key collision detected")
	emit_signal("key_collected")
	if free_key_on_collect:
		queue_free()
