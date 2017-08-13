extends Reference

var id
var name
var description
var status = Status.UNKNOWN setget set_status
var rewards = []
var requirements = []
var goals = []

signal started(event_target)
signal progressed(event_target)
signal goals_completed(event_target)
signal finished(event_target)

func _init(id = 0, name = "", description = "", status = Status.UNKNOWN):
	self.id = id
	self.name = name
	self.description = description

func start():
	emit_signal("on_started", self)

func set_status(value):
	# Support passing a Status enum
	if typeof(value) != TYPE_STRING:
		status = value
		return

	# Support passing a string, parse into a Status enum
	if typeof(value) == TYPE_STRING:
		value = value.to_lower()

		if value.match("unknown"):
			status = Status.UNKNOWN
		elif value.match("started"):
			status = Status.STARTED
		elif value.match("finished"):
			status = Status.FINISHED
		elif value.match("failed"):
			status = Status.FAILED
		else:
			print("Invalid quest status: ", value)

enum Status {
	UNKNOWN
	STARTED
	FINISHED
	FAILED
}
