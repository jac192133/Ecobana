extends Label

@onready var time_manager = get_node("/root/RoomScene/TimeManager")

func _ready():
	if time_manager:
		time_manager.time_updated.connect(_on_time_updated)

func _on_time_updated(day, _time_of_day):
	print("Day updated to:", day)
	text = "Day " + str(day)
