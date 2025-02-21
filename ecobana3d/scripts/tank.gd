extends Node3D

@export var width: float = 90.0  # Default to Standard Breeder
@export var height: float = 45.0
@export var depth: float = 40.0

var tank_sizes = {
	"Nano Tank": Vector3(30.0, 25.0, 25.0),
	"Small Tank": Vector3(45.0, 40.0, 30.0),
	"Standard Breeder": Vector3(90.0, 45.0, 40.0),
	"Showcase Tank": Vector3(120.0, 60.0, 50.0),
	"XL Display": Vector3(150.0, 60.0, 60.0)
}

func _ready():
	var main_scene = get_parent()

	if main_scene and main_scene.has_node("UI/TankSizeSelector") and main_scene.has_node("UI/DescriptionBox/TankSizeLabel"):
		var selector = main_scene.get_node("UI/TankSizeSelector")
		var tank_label = main_scene.get_node("UI/DescriptionBox/TankSizeLabel")

		if selector:
			selector.clear()
			selector.add_item("CHOOSE TANK!")  # Default option
			for tank_name in tank_sizes.keys():
				selector.add_item(tank_name)  # Add each tank size
			selector.select(0)  # Default to "CHOOSE TANK!"
			selector.item_selected.connect(_on_tank_size_selected)

		if tank_label:
			tank_label.clear()
			tank_label.append_text("[b]Tank:[/b] None")  # Default text

	# Ensure a default size is set in case the dropdown hasn't been used
	width = 90.0  # Default to Standard Breeder
	height = 45.0
	depth = 40.0
	update_panels()  # Ensure panels resize correctly

	# Debugging: Check if panels exist
	print("Checking Tank Panels:")
	print("BackPanel Exists:", has_node("BackPanel"))
	print("LeftPanel Exists:", has_node("LeftPanel"))
	print("RightPanel Exists:", has_node("RightPanel"))
	print("BottomPanel Exists:", has_node("BottomPanel"))

func _on_tank_size_selected(index):
	var main_scene = get_parent()
	
	if main_scene and main_scene.has_node("UI/TankSizeSelector") and main_scene.has_node("UI/DescriptionBox/TankSizeLabel"):
		var selector = main_scene.get_node("UI/TankSizeSelector")
		var tank_label = main_scene.get_node("UI/DescriptionBox/TankSizeLabel")

		if selector:
			var selected_name = selector.get_item_text(index)
			print("Selected Tank:", selected_name)  # Debugging Output

			if selected_name == "CHOOSE TANK!":
				print("Resetting to None")
				tank_label.clear()
				tank_label.append_text("[b]Tank:[/b] None")  # Reset if "CHOOSE TANK!" is selected
				return
			
			if selected_name in tank_sizes:
				print("Updating Tank Label!")
				var new_size = tank_sizes[selected_name]
				set_tank_size(new_size.x, new_size.y, new_size.z)

				if tank_label:
					tank_label.clear()
					tank_label.append_text("[b]Tank:[/b] " + selected_name)  # Update UI
					print("Tank Label Updated!")  # Debugging Output

func set_tank_size(new_width, new_height, new_depth):
	width = new_width
	height = new_height
	depth = new_depth
	update_panels()

func update_panels():
	print("Updating Tank Panels...")
	if has_node("BackPanel"):
		$BackPanel.transform.origin = Vector3(0, height / 2, -depth / 2)
		if $BackPanel.mesh is BoxMesh:
			$BackPanel.mesh.size = Vector3(width, height, 0.05)

	if has_node("LeftPanel"):
		$LeftPanel.transform.origin = Vector3(-width / 2, height / 2, 0)
		if $LeftPanel.mesh is BoxMesh:
			$LeftPanel.mesh.size = Vector3(0.05, height, depth)

	if has_node("RightPanel"):
		$RightPanel.transform.origin = Vector3(width / 2, height / 2, 0)
		if $RightPanel.mesh is BoxMesh:
			$RightPanel.mesh.size = Vector3(0.05, height, depth)

	if has_node("BottomPanel"):
		$BottomPanel.transform.origin = Vector3(0, 0, 0)
		if $BottomPanel.mesh is BoxMesh:
			$BottomPanel.mesh.size = Vector3(width, 0.05, depth)

	print("Tank Panels Updated!")
