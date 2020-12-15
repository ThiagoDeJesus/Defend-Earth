extends Node
var pre_enemie1: = preload("res://Scenes/Enemie1.tscn")
var pre_enemie2: = preload("res://Scenes/Enemie2.tscn")
var pre_defesa: = preload("res://Scenes/defesa.tscn")
var enemie1_start_position: = 0
var enemie2_start_position: = 0
var defesa_start_position: = 55
var enemie1_born: = false
var enemie2_born: = false
onready var pause_scene: = $PauseCanvas/PauseScene


func _ready():
	for c in 30:
		if c == 6 or c == 12 or c == 18 or c == 24:
			defesa_start_position += 64
		var defesa = pre_defesa.instance()
		defesa.global_position = Vector2(defesa_start_position, 275)
		add_child(defesa)
		var defesa1 = pre_defesa.instance()
		defesa1.global_position = Vector2(defesa_start_position, 259)
		add_child(defesa1)
		defesa_start_position += 9
		c+=1

func _on_Spawn_area_entered(area):
	area.add_to_group("spawn")

func _on_Spawn_area_exited(area):
	area.remove_from_group("spawn")

func _process(delta):
	if get_tree().get_nodes_in_group("spawn").size() < 1 and enemie1_born == false:
		enemie1_born = true
		for c in 30:
			var enemie1 = pre_enemie1.instance()
			enemie1.global_position = Vector2(enemie1_start_position, 25)
			add_child(enemie1)
			enemie1.add_to_group("Enemie1alive")
			var t = Timer.new()
			t.set_wait_time(.4)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			t.queue_free()
			c += 1
		
#	if get_tree().get_nodes_in_group("spawn").size() < 1 and enemie2_born == false:
#		enemie2_born = true
#		for c in 10:
#			var enemie2 = pre_enemie2.instance()
#			enemie2.global_position = Vector2(enemie2_start_position, 25)
#			add_child(enemie2)
#			var t = Timer.new()
#			t.set_wait_time(1)
#			t.set_one_shot(true)
#			self.add_child(t)
#			t.start()
#			yield(t, "timeout")
#			t.queue_free()
#			c += 1

	if enemie1_born and get_tree().get_nodes_in_group('Enemie1alive').size() == 0:
		pause_scene.win = true
		pause_scene.pause_game()


func _on_Player_player_dead() -> void:
	pause_scene.pause_game()
	pause_scene.player_dead = true
