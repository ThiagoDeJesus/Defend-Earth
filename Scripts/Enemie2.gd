extends Area2D

var speed = 150
var pre_bullet = preload("res://Scenes/Bullet.tscn")
var dir = Vector2(0, 0)
onready var tela = get_viewport_rect().size

func _ready():
	add_to_group("enemie2")
	dir.x = 1

func _process(delta):
	if $Enemie2Timer.time_left <= 0.0:
		_on_Timer_timeout()
	if global_position.x > tela.x + 100 or global_position.x < - 100:
		global_position.y += 50
		dir = -dir
	translate(dir * speed * delta)

func _on_Enemie1_area_entered(area):
	if area.is_in_group("enemie_bullet") or area.is_in_group("Spawn"):
		return
	print("Morreu")
	queue_free()


func _on_Timer_timeout():
	var bullet1 = pre_bullet.instance()
	var bullet2 = pre_bullet.instance()
	bullet1.global_position = $Enemie2Muzzle1.global_position
	bullet2.global_position = $Enemie2Muzzle2.global_position
	bullet1.bullet_dir = Vector2(0, 1)
	bullet2.bullet_dir = Vector2(0, 1)
	bullet1.add_to_group("enemie_bullet")
	bullet2.add_to_group("enemie_bullet")
	get_node("../").add_child(bullet1)
	get_node("../").add_child(bullet2)
