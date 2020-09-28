extends Node

var PlayerScore = 0
var OpponentScore = 0


func _on_Left_body_entered(_body):
	score_achieved()

func _on_Right_body_entered(_body):
	score_achieved()

func _process(_delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left)+1)

func _on_CountdownTimer_timeout():
	get_tree().call_group('BallGroup','restart_ball')
	$CountdownTimer.visible = false

func score_achieved():
	$Ball.position = Vector2(512,304)
	OpponentScore += 1
	get_tree().call_group('BallGroup','stop_ball')
	$CountdownTimer.start()
	$CountdownTimer.visible = true
