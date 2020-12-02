extends Timer

var randstart = 0

func _ready():
	randomize()
	randstart = rand_range(1,4)
	start(randstart)

func _process(delta):
	if time_left <= 0:
		start()
