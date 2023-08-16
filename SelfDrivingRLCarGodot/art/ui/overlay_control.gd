extends Node2D

@onready var action_checkbox = get_node("Action")
@onready var observation_checkbox = get_node("Observation")
@onready var endless_checkbox = get_node("Endless")
@onready var gamelogic_node = get_node("/root/game/GameLogic")

var overlay_action_node
var overlay_observation_node

func _ready():
	action_checkbox.pressed.connect(self._action_checkbox_pressed)
	observation_checkbox.pressed.connect(self._observation_checkbox_pressed)
	endless_checkbox.pressed.connect(self._endless_checkbox_pressed)
	overlay_action_node = get_node("/root/game/Overlay_UI_Action")
	overlay_observation_node = get_node("/root/game/Overlay_UI_Observation")

func _action_checkbox_pressed():
	if action_checkbox.button_pressed:
		var color = overlay_action_node.modulate
		color.a = 0.75
		overlay_action_node.set_modulate(color)
	else:
		var color = overlay_action_node.modulate
		color.a = 0.0
		overlay_action_node.set_modulate(color)

func _observation_checkbox_pressed():
	if observation_checkbox.button_pressed:
		var color = overlay_observation_node.modulate
		color.a = 0.75
		overlay_observation_node.set_modulate(color)
	else:
		var color = overlay_observation_node.modulate
		color.a = 0.0
		overlay_observation_node.set_modulate(color)

func _endless_checkbox_pressed():
	if endless_checkbox.button_pressed:
		gamelogic_node.SetEndlessMode(true)
	else:
		gamelogic_node.SetEndlessMode(false)
