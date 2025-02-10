extends Node

# Algae properties
var algae_level = 1.0  # Initial algae population
@export var max_algae = 100.0  # Maximum algae capacity

# Light sources affecting algae
var light_sources = []  # Holds all light nodes
var total_light_intensity = 0.0  

# Environmental factors
@export var nutrient_level: float = 1.0  # Nutrient availability
@export var algae_growth_rate: float = 0.5  # Growth multiplier

func _ready():
	# Automatically find all Light2D nodes in RoomScene
	for light in get_tree().get_nodes_in_group("light_sources"):
		light_sources.append(light)

func _process(delta):
	# Calculate total light from all sources
	total_light_intensity = 0.0
	for light in light_sources:
		total_light_intensity += light.energy  # `energy` controls light brightness

	# Normalize intensity (avoid extreme values)
	total_light_intensity = clamp(total_light_intensity, 0.1, 2.0)

	# Algae growth formula (light & nutrients influence growth)
	var growth = algae_growth_rate * total_light_intensity * nutrient_level * delta
	algae_level += growth
	algae_level = min(algae_level, max_algae)  # Cap algae growth

	print("Total Light Intensity: ", total_light_intensity, " | Algae Level: ", algae_level)
