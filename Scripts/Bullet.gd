extends Area2D

var bullet_speed = 350
var bullet_dir = Vector2(0, 0)
func _ready():
	pass # Replace with function body.

func _process(delta):
	translate(bullet_dir * bullet_speed * delta)


func _on_VisibilityNotifier2D_screen_exited():
	if is_in_group("enemie_bullet"):
		remove_from_group("enemie_bullet")
	if is_in_group("player_shot"):
		remove_from_group("player_shot")
	queue_free()

func _on_Bullet_area_entered(area):
	if area.is_in_group("spawn") or (area.is_in_group("enemies") and self.is_in_group("enemie_bullet")):
		return
	queue_free()
