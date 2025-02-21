extends Node3D

@export var width: float = 2.0
@export var height: float = 1.5
@export var depth: float = 1.0

func _ready():
	update_panels()

func update_panels():
	# BackPanel
	if has_node("BackPanel"):
		$BackPanel.transform.origin = Vector3(0, height / 2, -depth / 2)
		$BackPanel.transform.basis = Basis().scaled(Vector3(width, height, 0.05))

	# LeftPanel
	if has_node("LeftPanel"):
		$LeftPanel.transform.origin = Vector3(-width / 2, height / 2, 0)
		$LeftPanel.transform.basis = Basis().scaled(Vector3(0.05, height, depth))

	# RightPanel
	if has_node("RightPanel"):
		$RightPanel.transform.origin = Vector3(width / 2, height / 2, 0)
		$RightPanel.transform.basis = Basis().scaled(Vector3(0.05, height, depth))

	# BottomPanel
	if has_node("BottomPanel"):
		$BottomPanel.transform.origin = Vector3(0, 0, 0)
		$BottomPanel.transform.basis = Basis().scaled(Vector3(width, 0.05, depth))

	# FrontPanel
	if has_node("FrontPanel"):
		$FrontPanel.transform.origin = Vector3(0, height / 2, depth / 2)
		$FrontPanel.transform.basis = Basis().scaled(Vector3(width, height, 0.05))
