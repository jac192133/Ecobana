extends Label

@onready var time_manager = get_node("/root/RoomScene/TimeManager")

func _ready():
	if time_manager:
		time_manager.time_updated.connect(_on_time_updated)

func _on_time_updated(day, time_of_day):  # ✅ Now it's being used
	print("Updating UI: Day", day, "Time:", round(time_of_day * 24), "hours")
	text = "Day " + str(day) + " | Time: " + str(round(time_of_day * 24)) + "h"
