extends Label

@onready var time_manager = get_node("/root/RoomScene/TimeManager")

func _ready():
	if time_manager:
		time_manager.time_updated.connect(_on_time_updated)

# ✅ Corrected function: either USE or IGNORE `time_of_day`
func _on_time_updated(day, _time_of_day):  # ✅ `_time_of_day` ignored
	text = "Day " + str(day)
