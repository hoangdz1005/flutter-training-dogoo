import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/add_todo_screen.dart';
import 'package:todo_app/screens/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../database/repository.dart';
import '../models/todo_model.dart';
import '../providers/app_setting_provider.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late SharedPreferences _prefs;
  final TodoRepository _todoRepository = TodoRepository();
  late AppSettings _appSettings;
  List<Todo> _todos = [];
  Color getColorByPriority(int priority) {
    return priority == 0
        ? Colors.blue.shade200
        : (priority == 1 ? Colors.yellow : Colors.red);
  }
  String getNameByPriority(int priority) {
    return priority == 0 ? 'Low' : (priority == 1 ? 'Medium' : 'High');
  }
  @override
  void initState() {
    super.initState();
    _loadTodos();
  }
  Future<void> _loadTodos() async {
    final todos = await _todoRepository.getAllTodos();
    _prefs = await SharedPreferences.getInstance();
    _appSettings = Provider.of<AppSettings>(context, listen: false);

    bool? sortByTitleAsc = _appSettings.sortByTitleAsc;
    bool? sortByTitleDesc = _appSettings.sortByTitleDesc;
    bool? sortByDeadlineEarly = _appSettings.sortByDeadlineEarly;
    bool? sortByDeadlineLatest = _appSettings.sortByDeadlineLatest;
    setState(() {
      if (sortByTitleAsc) {
        todos.sort((a, b) => a.title.compareTo(b.title));
      } else {
        if(sortByTitleDesc) {
          todos.sort((a, b) => b.title.compareTo(a.title));
        } else if(sortByDeadlineEarly) {
          todos.sort((a, b) => a.deadLine.compareTo(b.deadLine));
        } else if(sortByDeadlineLatest) {
          todos.sort((a, b) => b.deadLine.compareTo(a.deadLine));
        }
      }
      _todos = todos;
    });

  }
  void _confirmDeleteDialog(BuildContext context, int? id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Confirm Delete",
            textAlign: TextAlign.center,
          ),
          content: const Text(
            "Are you sure you want to delete this todo?",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _deleteTodo(id);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void _deleteTodo(int? todoId) async {
    await _todoRepository.delete(todoId!);
    _loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "List Todo",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (String action) {
              if (action.compareTo('settings') == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SettingsPage(),
                  ),
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: "settings",
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todo = _todos[index];
                return Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            todo.title,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${todo.description.substring(0, 23)}...',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1.0),
                                  color: getColorByPriority(todo.priority),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                margin: const EdgeInsets.only(right: 8),
                                alignment: Alignment.center,
                                width: 70,
                                height: 20,
                                child: Text(getNameByPriority(todo.priority)),
                              ),
                              const Icon(Icons.event_available),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                todo.deadLine.toString().substring(0, 10),
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          )
                        ],
                      ),
                      PopupMenuButton(
                        onSelected: (String action) {
                          if (action.compareTo('edit') == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AddTodoScreen(isEditing: true, todo: todo),
                              ),
                            ).then((_) {
                              _loadTodos();
                            });
                          } else if (action.compareTo('delete') == 0) {
                            _confirmDeleteDialog(context, todo.id);
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: "edit",
                            child: ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('Edit'),
                            ),
                          ),
                          const PopupMenuItem<String>(
                            value: "delete",
                            child: ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Delete'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AddTodoScreen(isEditing: false)));
                      },
                      child: const Text(
                        "+",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
