extends Area2D

signal player_dead

var pre_bullet = preload("res://Scenes/Bullet.tscn")
var speed = 150
var dir = Vector2(0,0)
onready var tela = get_viewport_rect().size

func _ready():
	pass

func _process(delta):
	dir.x = 0
	if Input.is_action_pressed("ui_right"):
		dir.x = 1
	
	if Input.is_action_pressed("ui_left"):
		dir.x = -1
	
	translate(dir * speed * delta)
	
	if Input.is_action_just_pressed(("shot")) and $ShotTimer.time_left == 0:
		var bullet = pre_bullet.instance()
		bullet.global_position = $Muzzle.global_position
		bullet.bullet_dir = Vector2(0, -1)
		get_node("../").add_child(bullet)
		bullet.add_to_group("player_shot")
		$ShotTimer.start()
	global_position.x = clamp(global_position.x, 0 +15, tela.x -15)

func _on_Player_area_entered(area):
	queue_free()
	emit_signal("player_dead")
