extends Node3D

@export var width: float = 1.5
@export var height: float = 0.8
@export var depth: float = 0.6

var water_added: bool = false  # Prevent resizing after adding water

func _ready():
	print("Tank script is running. Checking nodes...")

	# Check if each expected node exists and print the result
	if has_node("BackPanel"):
		print("BackPanel: FOUND")
	else:
		print("ERROR: BackPanel is MISSING!")

	if has_node("LeftPanel"):
		print("LeftPanel: FOUND")
	else:
		print("ERROR: LeftPanel is MISSING!")

	if has_node("RightPanel"):
		print("RightPanel: FOUND")
	else:
		print("ERROR: RightPanel is MISSING!")

	if has_node("BottomPanel"):
		print("BottomPanel: FOUND")
	else:
		print("ERROR: BottomPanel is MISSING!")

	if has_node("FrontPanel"):
		print("FrontPanel: FOUND")
	else:
		print("ERROR: FrontPanel is MISSING!")

	if has_node("TankCollision"):
		print("TankCollision: FOUND")
	else:
		print("ERROR: TankCollision is MISSING!")

	if has_node("TankCollision/BackCollision"):
		print("BackCollision: FOUND")
	else:
		print("ERROR: BackCollision is MISSING!")

	if has_node("TankCollision/LeftCollision"):
		print("LeftCollision: FOUND")
	else:
		print("ERROR: LeftCollision is MISSING!")

	if has_node("TankCollision/RightCollision"):
		print("RightCollision: FOUND")
	else:
		print("ERROR: RightCollision is MISSING!")

	if has_node("TankCollision/BottomCollision"):
		print("BottomCollision: FOUND")
	else:
		print("ERROR: BottomCollision is MISSING!")

	if has_node("TankCollision/FrontCollision"):
		print("FrontCollision: FOUND")
	else:
		print("ERROR: FrontCollision is MISSING!")

	update_tank_size()

func update_tank_size():
	if water_added:
		return  # Prevent resizing after adding water

	print("Updating tank size...")

	# Check and update panels
	if has_node("BackPanel") and $BackPanel.mesh:
		$BackPanel.mesh.size = Vector3(width, height, 0.1)
	else:
		print("ERROR: BackPanel is MISSING or mesh is NULL!")

	if has_node("LeftPanel") and $LeftPanel.mesh:
		$LeftPanel.mesh.size = Vector3(0.1, height, depth)
	else:
		print("ERROR: LeftPanel is MISSING or mesh is NULL!")

	if has_node("RightPanel") and $RightPanel.mesh:
		$RightPanel.mesh.size = Vector3(0.1, height, depth)
	else:
		print("ERROR: RightPanel is MISSING or mesh is NULL!")

	if has_node("BottomPanel") and $BottomPanel.mesh:
		$BottomPanel.mesh.size = Vector3(width, 0.1, depth)
	else:
		print("ERROR: BottomPanel is MISSING or mesh is NULL!")

	if has_node("FrontPanel") and $FrontPanel.mesh:
		$FrontPanel.mesh.size = Vector3(width, height, 0.1)
	else:
		print("ERROR: FrontPanel is MISSING or mesh is NULL!")

	# Check and update collision shapes
	if has_node("TankCollision/BackCollision") and $TankCollision/BackCollision.shape:
		$TankCollision/BackCollision.shape.size = Vector3(width / 2, height / 2, 0.05)
	else:
		print("ERROR: BackCollision is MISSING or shape is NULL!")

	if has_node("TankCollision/LeftCollision") and $TankCollision/LeftCollision.shape:
		$TankCollision/LeftCollision.shape.size = Vector3(0.05, height / 2, depth / 2)
	else:
		print("ERROR: LeftCollision is MISSING or shape is NULL!")

	if has_node("TankCollision/RightCollision") and $TankCollision/RightCollision.shape:
		$TankCollision/RightCollision.shape.size = Vector3(0.05, height / 2, depth / 2)
	else:
		print("ERROR: RightCollision is MISSING or shape is NULL!")

	if has_node("TankCollision/BottomCollision") and $TankCollision/BottomCollision.shape:
		$TankCollision/BottomCollision.shape.size = Vector3(width / 2, 0.05, depth / 2)
	else:
		print("ERROR: BottomCollision is MISSING or shape is NULL!")

	if has_node("TankCollision/FrontCollision") and $TankCollision/FrontCollision.shape:
		$TankCollision/FrontCollision.shape.size = Vector3(width / 2, height / 2, 0.05)
	else:
		print("ERROR: FrontCollision is MISSING or shape is NULL!")
