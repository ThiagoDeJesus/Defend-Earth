extends Button

onready var buttonscontainer: = get_node("../../ButtonsContainer")
onready var instructions: = get_node("../../Instructions2/ColorRect")
onready var gametittle: = get_node("../../GameTitleContainer")

func _on_button_up() -> void:
	buttonscontainer.visible = not buttonscontainer.visible
	gametittle.visible = not gametittle.visible
	instructions.visible = not instructions.visible
	
