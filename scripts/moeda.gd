extends Area2D

var coins := 1
@onready var coin = $coin as AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	$anim.play("collect")
	await $colision.call_deferred("queue_free")
	Globals.coins += coins
	coin.play()
	
	

func _on_anim_animation_finished():
	queue_free()
