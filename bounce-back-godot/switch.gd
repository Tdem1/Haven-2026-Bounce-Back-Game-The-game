extends StaticBody2D

var inside=false

signal flip

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("switch_flip") and inside:
		emit_signal("flip")		
		scale.x=-1

func _on_enter() -> void:
	inside=true
	hide()

func _on_exit() -> void:
	inside=false
