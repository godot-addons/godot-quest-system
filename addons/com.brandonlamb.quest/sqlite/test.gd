extends Node

var SQLite = preload("res://lib/sqlite.gdns");
var db = SQLite.new();

func _ready():
	randomize();

	$logwindow.set_readonly(true);
	$command.connect("text_entered", self, "executed");

	# Enable debugging
	db.set_debugging(true);

	# Open SQL
	if db.open("data.sql") != OK:
		print("ERR: ", db.get_errormsg());
		return;

	var columns = [];
	columns.append("id INTEGER PRIMARY KEY AUTOINCREMENT");
	columns.append("name TEXT");
	columns.append("age INTEGER");

	# args: String tablename | Array columns | Bool create only if not exists
	# return: Integer retval
	db.create_table("users", columns, true);

	# args: String query
	# return: Array rows
	var data = db.fetch_array("SELECT * FROM users LIMIT 10;");
	for i in data:
		print(i);

	# args: String query
	# return: Integer retval
	if (data.size() < 5):
		db.query("INSERT INTO users (name, age) VALUES ('khairul', '"+str(int(rand_range(10, 50)))+"');");

func _exit_tree():
	db.close();

func executed(what):
	var result;
	var query = $command.text;

	if ($method.get_selected() == 0):
		result = db.query(query);
	if ($method.get_selected() == 1):
		result = db.fetch_array(query);

	add_log(str(result, "; ", db.get_errormsg()));

func add_log(string):
	var date = OS.get_datetime();
	string = str(date.hour, ":", date.minute, ":", date.second, " ", string);
	$logwindow.set_text($logwindow.get_text() + string + "\n");
	$logwindow.cursor_set_line($logwindow.get_line_count());
