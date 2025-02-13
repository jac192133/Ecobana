extends Control

@onready var substrate_dropdown = $HBoxContainer/SubstrateDropdown
@onready var substrate = $"../Substrate"  # Adjust the path if needed

func _ready():
	substrate_dropdown.item_selected.connect(_on_substrate_selected)

	# Set "Choose!" as the default selection
	substrate_dropdown.selected = 0

	# Ensure the substrate starts hidden
	substrate.visible = false

	# Also reset the shader parameters to eliminate artifacts
	var material = substrate.material
	if material and material is ShaderMaterial:
		material.set_shader_parameter("substrate_color", Color(0, 0, 0, 0))  # Fully transparent
		material.set_shader_parameter("square_size", 0)  # Disable pattern

func _on_substrate_selected(index: int):
	var selected_text = substrate_dropdown.get_item_text(index)
	print("Selected:", selected_text)

	# Ensure substrate exists
	if not is_instance_valid(substrate):
		print("Substrate node not found!")
		return

	# Hide substrate if "Choose!" is selected
	if selected_text == "Choose!":
		substrate.visible = false
		return  # Exit early

	substrate.visible = true  # Ensure it's visible for valid selections

	var material = substrate.material
	if material and material is ShaderMaterial:
		match selected_text:
			"Fine Sand":
				material.set_shader_parameter("substrate_color", Color(0.862745, 0.772549, 0.65098, 1))  # Light beige
				material.set_shader_parameter("square_size", 1.5)  # Finer pattern
			"Gravel":
				material.set_shader_parameter("substrate_color", Color(0.77, 0.65, 0.49, 1))  # Warm brown
				material.set_shader_parameter("square_size", 1.0)  # Medium pattern
			"Nutrient-Rich Soil":
				material.set_shader_parameter("substrate_color", Color(0.55, 0.42, 0.3, 1))  # Dark brown
				material.set_shader_parameter("square_size", 0.6)  # Larger pattern
			_:
				print("Unknown substrate type selected")
	else:
		print("Substrate does not have a ShaderMaterial assigned")
