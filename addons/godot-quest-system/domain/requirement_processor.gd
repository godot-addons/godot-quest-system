extends Reference

var character_repo
var trigger_repo
var faction_repo

func requirements_are_met(quest):
	for r in quest.requirements:
		if !r.is_met():
			return false
	return true