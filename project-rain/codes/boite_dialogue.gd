extends CanvasLayer
#vittese de lecture
const speed = 0.05 


#les nodes
@onready var textbox_container = $textBoxContainer # la boite de dialogue
@onready var start_symbol = $textBoxContainer/MarginContainer/HBoxContainer/start 
@onready var end_symbol = $textBoxContainer/MarginContainer/HBoxContainer/end
@onready var label = $textBoxContainer/MarginContainer/HBoxContainer/text # le texte

#les états
enum state {
	ready,
	reading,
	finished,
}

var tween
var current_state = state.ready 
var text_queue = [] # la liste des dialogue

#les fonction
func _ready():#le démarrage
	hide_textbook()
	visible = true

func _process(_delta: float) -> void:#tt du long de la game
	match  current_state:# décide quoi faire en fonction de l'état
		state.ready:
			if !text_queue.is_empty(): # affiche un dialogue s'il y en a un 
				display_text()
		state.reading:
			if Input.is_action_just_pressed("click"):# si on appui sur entrer pendant l'affichage skip le dialogue
				label.visible_ratio = 1.0
				tween.kill()
				end_symbol.text = "v"
				change_state(state.finished)
		state.finished:
			if Input.is_action_just_pressed("click"):#quand l'affichage est finit en attend d'appuier entrer pr continuer
				change_state(state.ready)
				hide_textbook()

func queue_text(next_text):# ajoute un dialogue dans la liste des dialoge
	text_queue.push_back(next_text)

func hide_textbook(): # cache la boite de dialogue
	start_symbol.text = ""
	end_symbol.text = ""
	label.text = ""
	textbox_container.hide()
	Global.onTextBox = false

func show_textbox(): # affiche la boite de dialogue
	start_symbol.text = ">"
	textbox_container.show()

func display_text(): # affiche le texte
	var next_text = text_queue.pop_front() #suprime le premier element de la list d dialogue tt en le suvagardant dans une variable 
	label.text = next_text
	change_state(state.reading)
	show_textbox()
	tween = create_tween()
	label.visible_ratio = 0.0
	tween.tween_property(label, "visible_ratio", 1.0, len(next_text)*speed).set_trans(Tween.TRANS_LINEAR)
	tween.finished.connect(_on_tween_finished)
	Global.onTextBox = true
	
func _on_tween_finished(): #quand le texte a fini de déffiler
	end_symbol.text = "v"
	change_state(state.finished)

func change_state(next_stat):  # change l'etat 
	current_state = next_stat
	match  current_state: # je crois qu'a partire d'ici c juste du débbug
		state.ready:
			print("ready")
		state.reading:
			print("reading")
		state.finished:
			print("finished")
			
	
