extends Area2D

@export var IDobjet = 0
@export var cond = "start"

func _ready() -> void:
	$objetImage.animation = str(IDobjet)
	if Global.condApparition[cond] == false:
		visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and Global.condApparition[cond]:
		visible = true
	
func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click") and Global.condApparition[cond]:
		if Global.onTextBox == false and abs(position.x-Global.positionPersonage.x) < 20 and abs(position.y-Global.positionPersonage.y) < 20:
			var text = get_parent().get_parent().get_node("dialogue")
			if IDobjet==1:
				text.queue_text("Canard en plastique nul.")
			elif IDobjet==2:
				text.queue_text("Erk, je suis sûr que c'est Thierry. non seulement il gâche, mais en plus il ne jette pas ses vieux trucs.")
			elif IDobjet==3:
				text.queue_text("Badge")
			elif IDobjet==4:
				text.queue_text("Clef")
			elif IDobjet==5:
				text.queue_text("Dossier")
			elif IDobjet==6:
				text.queue_text("Un gobelet vide, avec un fond de liquide inconnu ???")
			elif IDobjet==7:
				text.queue_text("Beurk, je ne vais pas boire ça.")
			
			var c = Global.objetID
			Global.objetID = IDobjet
			IDobjet = c
			$objetImage.animation = str(IDobjet)
