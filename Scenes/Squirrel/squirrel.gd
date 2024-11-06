extends CharacterBody2D

func _physics_process(_delta: float) -> void:
	
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		velocity = velocity.move_toward(direction * Globals.speed, Globals.acceleration)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, Globals.friction)
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		Globals.lose_nut()
	if area.is_in_group("nut"):
		Globals.collect_nut()
