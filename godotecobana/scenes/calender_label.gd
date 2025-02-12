extends Label

@onready var time_manager = get_node("/root/RoomScene/TimeManager")

func _ready():
	if time_manager:
		if not time_manager.time_updated.is_connected(_on_time_manager_time_updated):
			time_manager.time_updated.connect(_on_time_manager_time_updated)
			print("✅ CalendarLabel successfully connected to time_updated signal!")  # Debugging confirmation
		else:
			print("⚠️ Warning: CalendarLabel was already connected to time_updated.")

func _on_time_manager_time_updated(day: int, _time_of_day: float):  # ✅ Fixed unused variable warning
	text = "Day " + str(day)
	print("📅 Updated Calendar Label: Day", day)  # Debugging confirmation
