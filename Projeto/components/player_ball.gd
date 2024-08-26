extends RigidBody3D

@onready var impact_point: Marker3D = $ImpactPoint

func _on_impact_area_area_entered(area: Area3D) -> void:
	if area.is_in_group("segment"):
		if abs(linear_velocity.y) > 5:
			var instance = load("res://components/ImpactEffect.tscn").instantiate() as ImpactEffect
			add_sibling(instance)
			instance.global_position = impact_point.global_position
