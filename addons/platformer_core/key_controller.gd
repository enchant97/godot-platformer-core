tool
class_name KeyController
extends Node
# Holder for Key's, sends a signal each time the number of keys change

signal on_key_count_change

onready var keys_count = get_child_count()

var key = preload("key.gd")

func _ready():
	emit_signal("on_key_count_change", keys_count)

	for key in get_children():
		key.connect("key_collected", self, "_on_key_collected")

func _on_key_collected():
	keys_count -= 1
	assert(keys_count >= 0, "can't have negative key count")
	emit_signal("on_key_count_change", keys_count)

func _get_configuration_warning():
	if get_child_count() == 0:
		return "Needs key Children"
	for child in get_children():
		if not (child is key):
			return "children of KeyController must be a Key"
	return ""
