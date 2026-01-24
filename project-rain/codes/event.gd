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
			
		elif IDevent=="cadre":
			text.queue_text("Employé du mois, et deux de suite !")
			
		elif IDevent=="poubelle":
			if Global.objetID == 2:
				text.queue_text("Ils devraient jeter leur cochonneries eux-même !")
				text.queue_text("Beurk ! qui a laissé son gobelet ici ?")
				Global.objetID = 0
				Global.condApparition["poubelle"] = true
			elif Global.objetID == 5:
				text.queue_text("Non ! je ne jetterai pas Cookie clicker 17 à la poubelle.")
			else:
				text.queue_text("Elle est assez moche mais c'est bien une poubelle.")
			
		elif IDevent=="frigo":
			text.queue_text("J'ai bien retenu qu'il ne fallait JAMAIS mettre la nouriture dans le frigo commun.")
			text.queue_text('certaines personnes prennent trop au serieu le sens de "commun". ')
			Global.condApparition["frigo"] = true
		
		elif IDevent=="pc1":
			text.queue_text("Pourquoi ce mettre soit même en fond d'écran ?.")
			text.queue_text("Il y a des idiots, mais quand même.")
			
		elif IDevent=="pc2":
			text.queue_text("J'èspere que ce sont ses enfants à lui !")
			
		elif IDevent=="pc3":
			text.queue_text("Mon ordinateur, bien propre, bien rangé.")
		
		elif IDevent=="pc4":
			text.queue_text("Visiblement un diaporama remplis d'anime girls.")
			
		elif IDevent=="pub1":
			text.queue_text("Une pub pour du parfum ? je ne sais pas ce qu'elle fait là, mais certains en aurait besoin.")
			
		elif IDevent=="pub2":
			text.queue_text("Une affiche promotionelle pour la sortie du quatorzième Biscuit clicker. Superbe.")
			
		elif IDevent=="eau":
			text.queue_text("Mes idiots de collègues font toujours des pyramides en gobelets, et maintenant on ne peut plus boire.")
			if Global.objetID == 6:
				text.queue_text("J'ai rempli le verre...")
				Global.objetID = 7
			
		elif IDevent=="asc":
			if Global.objetID == 4:
				text.queue_text("Noooooon! Cette clef est si belle et cette serrure si parfaite,")
				text.queue_text("comment j'aurrai pu savoir qu'elle ne rentre pas...")
			else:
				text.queue_text("Ah, je vais descendre par l'ascenceur. Voilà ce que je dirait si ce n'etait pas un ascenceur à clé !")
			
		elif IDevent=="boss":
			text.queue_text("Le bureau du chef, j'espere qu'il y a des dossiers tasty crousty dedans...")
			
		elif IDevent=="papier1":
			text.queue_text('''Un début de lettre. "Le projet de biscuit clicker 17 avance à merveille ''')
			text.queue_text('''Je sens qu'on a toucher à une mine d'or !" ''')
			
		elif IDevent=="papier2":
			text.queue_text(''' "DEVENIR MAIGRE EN QUELQUES SEMAINES ! GUIDE PRATIQUE ET Approuvé PAR LA Communauté SCIENTIFIQUE !" ''')
			text.queue_text(''' le reste est un ramassis d’âneries. ''')
			
		elif IDevent=="papier3":
			text.queue_text(''' "Surtout, N'UTILISER PAS LA PRISE UNE ! elle grille vos appareils ! ''')
			
		elif IDevent=="papier4":
			text.queue_text(''' "La prise une marche parfaitement" ''')
		
		elif IDevent=="papier5":
			text.queue_text(''' C'est écrit en espagnol. Je n'essaire même pas. ''')
			
		elif IDevent=="papier6":
			text.queue_text(''' C'est absolument illisible ! ''')
			
		elif IDevent=="papier7":
			text.queue_text(''' Vu l'encoche rouge, ça m'a l'air très important. ''')
			
		elif IDevent=="cafe":
			text.queue_text("Personne ne peut faire une tâche aussi énorme sans le vouloir.")
			
		elif IDevent=="blouson":
			text.queue_text("Aucun respect ! mettre son manteau sur la table, comme ça...")
			Global.condApparition["veste"] = true
			
		elif IDevent=="compteur":
			text.queue_text("C'est le décompte avant le début de la fête, mais j'ai vraiment pas envie de voir mes collègues !")
			
			
		elif IDevent=="casier1":
			if Global.condApparition["casier1"]:
					text.queue_text("Pleins de photos d'animaux. par contre, Je ne voit juste pas pourquoi")
					text.queue_text("apeller son chien maman.")
			elif Global.objetID == 3:
				text.queue_text("Une clé, youpi.")
				Global.condApparition["casier1"] = true
			else:
				text.queue_text("un casier electronique. Le bureau pourrait tout de meme faire partir ")
				text.queue_text("le budget ailleurs que dans des boites gadgets.")
			
		elif IDevent=="horloge":
			text.queue_text("Très belle horloge, la regarder fait vraiment passer le temps.")
			Global.nbClics -= 4
			
			
		elif IDevent=="jus":
			text.queue_text("Je pari que le propriétaire a craché dedans,")
			text.queue_text("même si c'est plains de bonnes vitamines energétiques, je ne m'y risquerai pas.")
			
			
		elif IDevent=="plante":
			if Global.objetID == 7:
				text.queue_text("Mhmm c'est bon la plante ? tu aimes bien le glou glou ? mais qu'est ce que je raconte..")
				Global.objetID = 6
			else : 
				text.queue_text("quelle belle plante... Elle est en plastique ? je ne l'ai jamais su ? et moi")
				text.queue_text("qui lui donnait toujours les restes de boissons...")
		
		elif IDevent=="fenetre":
			if Global.objetID == 4:
				text.queue_text("Je peux enfin sortir ! Vive la liberté")
				get_parent().get_parent().get_parent().get_node("cinematique").etape = 1
			else:
				text.queue_text("Fenêtre fermée, bien sûr...")
