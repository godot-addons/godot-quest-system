# godot-quest-system
Godot Engine (v3.0) Quest System

## Running the example

Copy addons folder to example folder, then open the example folder in Godot. The example folder acts as the base project folder.

## Design considerations

I am attempting to apply Domain-Driven Design principles, with repositories acting as adapters to various underlying infrastructure concerns (database, file, api).

## Persistence implementations

This is probably the biggest problem to solve, how to persist the data. I haven't read up yet on JSON and file read/write in Godot.

If implementing a file-based quest_repository, I suspect you would read in the file, then loop over each line and use it to create a quest.

This could also be implemented via a REST API probably using the HTTP functions.

### Status of SQLite

Broken. When I first started to dive into this, I had no clue what I was doing and was basing the work off of another project.

I think what needs to happen is you would need to bind to a sqlite library via cpp, and then compile a dynamic library for Windows, Linux, and Mac.

### File-based

For a local game, you might implement a file repository. This could be a file-per-quest that you open and read, and maybe an index file to lookup.

### REST-based

Exposing an API, you could have a network/internet/API implementation to find and read quests.

### RDBM-based

It's possible that you could create bindings for Godot server to communicate with an actual RDBM server (mysql, pgsql).
