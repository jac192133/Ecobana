extends Control

@onready var substrate_dropdown = $HBoxContainer/SubstrateDropdown
@onready var substrate = get_node("../Substrate") # Adjust if needed

# Substrate colors
var substrate_colors = {
	"Fine Sand": Color(0.862745, 0.772549, 0.65098, 1),  # Light beige
	"Gravel": Color(0.77, 0.65, 0.49, 1),               # Warm brown
	"Nutrient-Rich Soil": Color(0.55, 0.42, 0.3, 1)     # Dark brown
}

func _ready():
	substrate_dropdown.item_selected.connect(_on_substrate_selected)

func _on_substrate_selected(index):
	var selected_text = substrate_dropdown.get_item_text(index)
	
	# Update substrate color if it's a valid selection
	if selected_text in substrate_colors:
		substrate.color = substrate_colors[selected_text]
