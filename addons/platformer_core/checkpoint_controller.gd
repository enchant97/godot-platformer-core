tool
class_name CheckpointController
extends Node
# Holds Checkpoint's sending a signal on
# where the last checkpoint was activated

var checkpoint = preload("checkpoint.gd")

signal checkpoint_activated(where_global)

func _ready() -> void:
	for trap in get_children():
		trap.connect("checkpoint_activated", self, "_on_checkpoint_activated")

func _on_checkpoint_activated(where: Vector2):
	emit_signal("checkpoint_activated", where)

func _get_configuration_warning():
	if get_child_count() == 0:
		return "Needs Checkpoint Children"
	for child in get_children():
		if not (child is checkpoint):
			return "children of CheckpointController must be a Checkpoint"
	return ""
