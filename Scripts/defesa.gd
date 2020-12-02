extends Area2D
# var speed = 100
# var dir = Vector2(0, 0)
# var dist = 0
# onready var start_position = global_position

func _ready():
	pass 

#	 func _process(delta):
#	 translate(Vector2(25,0) * dir * delta)
#	 dist = global_position - start_position
#	 if dist.x >= 50:
#		 dir.x = -dir.x
#	 if dist.x <= -50:
#		 dir.x = -dir.x

func _on_defesa_area_entered(area):
	$defesa_animation.play("Hit")

func _on_defesa_animation_animation_finished(anim_name):
	queue_free()

