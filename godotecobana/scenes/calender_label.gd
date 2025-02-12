# calender_label.gd - Ensuring it properly updates on day change and avoiding null reference error

extends Label

func _ready():
	var time_manager = get_tree().get_root().find_child("TimeManager", true, false)
	if time_manager:
		time_manager.connect("day_changed", _on_day_changed)

func _on_day_changed(new_day: int):
	text = "Day: " + str(new_day)
