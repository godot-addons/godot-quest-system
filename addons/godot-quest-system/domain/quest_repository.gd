extends Reference

signal quest_created(quest)
signal quest_deleted(quest)
signal quest_saved(quest)
signal quests_cleared()

"""
Find quest by ID
@param int id
@return Quest
"""
func find_by_id(id): pass

"""
Find all quests
@return Quest[]
"""
func find_all(): pass

"""
Clear all quests
"""
func clear(): pass

"""
Save quest
@param Quest quest
"""
func save(quest): pass

"""
Delete quest
@param Quest quest
"""
func delete(quest): pass

"""
Delete quest by ID
@param int id
"""
func delete_by_id(id): pass
