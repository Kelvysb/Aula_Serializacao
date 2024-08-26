extends Node3D
class_name ImpactEffect

@onready var gpu_particles_3d: GPUParticles3D = $GPUParticles3D

var __lifeTime = 5.0
var timer = 0.0

func _ready() -> void:
	gpu_particles_3d.emitting = true
	timer = __lifeTime

func _process(delta: float) -> void:
	timer = timer - delta
	if timer <= 0:
		queue_free()
