extends Control

@export var initial_scene: StringName = &""
@export var play_button: Button


func _ready() -> void:
	play_button.pressed.connect(_on_play_pressed)


func _on_play_pressed() -> void:
	var scene_loader = ServiceLocator.get_service(&"SceneLoader")
	scene_loader.load_scene(initial_scene)
