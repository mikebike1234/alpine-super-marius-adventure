extends CanvasLayer


var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.coin_collected.connect(update_coins)
	Globals.lose_life.connect(update_lives)
	$LivesPanel/LivesLabel.text = str(Globals.lives)
	
	
func update_coins():
	score+= 1
	$CoinSound.play()
	$CoinsPanel/ScoreLabel.text = str(score)
	if score%5 == 0:
		Globals.lives += 1
		$LivesPanel/LivesLabel.text = str(Globals.lives)
		
func update_lives():
	Globals.lives -= 1
	$DeathSound.play()
	$LivesPanel/LivesLabel.text = str(Globals.lives)
	if Globals.lives <= 0:
		get_tree().change_scene_to_file("res://lose_screen.tscn")
