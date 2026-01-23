extends Area2D

@export var IDobjet = 0
@export var cond = "start"

func _ready() -> void:
	$objetImage.animation = str(IDobjet)
	if Global.condApparition[cond] == false:
		visible = false

func _process(delta: float) -> void:
	pass
	
func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click") and Global.condApparition[cond]:
		visible = true
		if Global.onTextBox == false and abs(position.x-Global.positionPersonage.x) < 20 and abs(position.y-Global.positionPersonage.y) < 20:
			var c = Global.objetID
			Global.objetID = IDobjet
			IDobjet = c
			$objetImage.animation = str(IDobjet)
