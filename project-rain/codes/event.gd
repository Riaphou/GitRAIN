extends Area2D

@export var IDevent = ""
@export var lenDetection = 20

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click") and Global.onTextBox == false and abs(position.x-Global.positionPersonage.x) < lenDetection and abs(position.y-Global.positionPersonage.y) < lenDetection:
		var text = get_parent().get_parent().get_node("dialogue")
		
		
		if IDevent=="":
			text.queue_text("Rien d'interessant ici.")
		elif IDevent=="fenetre":
			text.queue_text("Fenêtre : Fermée, évidament.")
		elif IDevent=="casier1":
			if Global.condApparition["casier1"]:
				text.queue_text("Vous avez déjà ouvert ce casier.")
			elif Global.objetID == 4:
				text.queue_text("Le badge ouvre le casier")
				Global.condApparition["casier1"] = true
			else:
				text.queue_text("Ce casier est verrouillé")
			text.queue_text("Canard en plastique")
		elif IDevent=="":
			text.queue_text("Canard en plastique")
		elif IDevent=="":
			text.queue_text("Canard en plastique")
		elif IDevent=="":
			text.queue_text("Canard en plastique")
