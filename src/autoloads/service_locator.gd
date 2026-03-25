class_name ServiceLocator
extends Node

const PLAYER = &"Player"
const CAMERA = &"Camera"
const UI = &"UI"

static var _services: Dictionary = { }


static func register(service_name: StringName, service: Object) -> void:
	if _services.has(service_name):
		push_warning("ServiceLocator: Overwriting service %s " % [service_name])

	_services[service_name] = service


static func unregister(service_name: StringName) -> void:
	var found: bool = _services.erase(service_name)

	if not found:
		push_warning("ServiceLocator: Service %s not found" % [service_name])


static func get_service(service_name: StringName) -> Object:
	if not _services.has(service_name):
		push_error("ServiceLocator: Service not found: %s" % [service_name])
		return null

	return _services[service_name]
