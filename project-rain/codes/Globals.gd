extends Node

var nbClics = 0
var dialogInQueue = 0

var onTextBox = false

var positionPersonage = Vector2(0,0)
var objetID = 0

var condApparition = {}

#initialisation dans affichageCliques

func restart():
	nbClics = 25
	dialogInQueue = 0
	onTextBox = false
	positionPersonage = Vector2(0,0)
	objetID = 0
	condApparition = {
	"start" = true,
	"frigo" = false,
	"casier1" = false,
	"veste" = false,
	"poubelle" = false,
}
