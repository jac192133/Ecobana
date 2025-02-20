extends Node3D

# Tank dimensions
@export var width: float = 1.5
@export var height: float = 0.8
@export var depth: float = 0.6

var water_added: bool = false  # Prevent resizing after water is added

func _ready():
	update_tank_size()

# Updates the tank panel and collision sizes dynamically
func update_tank_size():
	if water_added:
		return  # Prevent resizing after adding water
	
	# Resize panels
	$BackPanel.mesh.size = Vector3(width, height, 0.1)
	$LeftPanel.mesh.size = Vector3(0.1, height, depth)
	$RightPanel.mesh.size = Vector3(0.1, height, depth)
	$BottomPanel.mesh.size = Vector3(width, 0.1, depth)
	$FrontPanel.mesh.size = Vector3(width, height, 0.1)

	# Resize collision shapes
	$TankCollision/BackCollision.shape.size = Vector3(width / 2, height / 2, 0.05)
	$TankCollision/LeftCollision.shape.size = Vector3(0.05, height / 2, depth / 2)
	$TankCollision/RightCollision.shape.size = Vector3(0.05, height / 2, depth / 2)
	$TankCollision/BottomCollision.shape.size = Vector3(width / 2, 0.05, depth / 2)
	$TankCollision/FrontCollision.shape.size = Vector3(width / 2, height / 2, 0.05)

	# Position panels correctly
	$BackPanel.position = Vector3(0, height / 2, -depth / 2)
	$LeftPanel.position = Vector3(-width / 2, height / 2, 0)
	$RightPanel.position = Vector3(width / 2, height / 2, 0)
	$BottomPanel.position = Vector3(0, 0, 0)
	$FrontPanel.position = Vector3(0, height / 2, depth / 2)

# Allows resizing only if no water is added
func set_tank_size(new_width: float, new_height: float, new_depth: float):
	if not water_added:  
		width = clamp(new_width, 0.5, 5.0)  # Min/Max limits
		height = clamp(new_height, 0.5, 3.0)
		depth = clamp(new_depth, 0.5, 2.0)
		update_tank_size()

# Locks the tank size once water is added
func add_water():
	water_added = true  # Prevent further resizing
