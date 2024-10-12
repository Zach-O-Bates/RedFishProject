extends Control


@export var enemy_scene: PackedScene
@onready var textScore: Label = $lableTwo  


var score: int = 0
var max_score: int = 3


func _ready():
	if textScore:
		textScore.text = str(score)
	var return_button = Button.new()
	return_button.text = "Return to Menu"
	return_button.connect("pressed", Callable(self, "_on_return_button_pressed"))
	add_child(return_button)

func _process(delta):
	pass

func increase_score():
	score += 1  
	update_score_display()
	if score >= max_score:
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("/Users/zacharybates/Desktop/GameCode/AngryBirdsBase/scenes/level_three.tscn") 
	else:
		spawn_enemy()

func update_score_display():
	if textScore:
		textScore.text = str(score)
	else:
		print("txtScore is not assigned")

func spawn_enemy():
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.position = Vector2(randf_range(0, 1150), randf_range(0, 700))
	get_tree().root.add_child(enemy_instance)

func _on_return_button_pressed():

	get_tree().change_scene_to_file("/Users/zacharybates/Desktop/GameCode/AngryBirdsBase/scenes/menu.tscn")  
