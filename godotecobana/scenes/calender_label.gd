extends Label

@onready var time_manager = get_node("/root/RoomScene/TimeManager")

func _ready():
	time_manager.connect("time_updated", _on_time_updated)

func _on_time_updated(day, time_of_day):
	text = "Day " + str(day)
