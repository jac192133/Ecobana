extends ColorRect

func _ready():
	# Manually force the size
	size = Vector2(1280, 720)  # Change this based on your game's resolution

	# Ensure it anchors correctly
	anchor_left = 0.0
	anchor_top = 0.0
	anchor_right = 1.0
	anchor_bottom = 1.0

	# Reset offsets to prevent 0px issue
	offset_left = 0
	offset_top = 0
	offset_right = 0
	offset_bottom = 0

	# Set a visible color (light peach)
	color = Color(1.0, 0.854, 0.725, 1.0)

	# Print debug info
	print("Wall size set to: ", size)
