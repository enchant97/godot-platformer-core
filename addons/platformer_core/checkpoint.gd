tool
class_name Checkpoint
extends Area2D
# A item that will activate when player collides,
# sending a signal the a CheckpointController

signal checkpoint_activated(where_global)

func _enter_tree() -> void:
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(_body) -> void:
	print_debug("checkpoint activated")
	emit_signal("checkpoint_activated", global_position)
