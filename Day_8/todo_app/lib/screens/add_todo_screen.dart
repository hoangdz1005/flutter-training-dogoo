import 'package:flutter/material.dart';
import 'package:todo_app/screens/list_todo_screen.dart';
import '../database/repository.dart';
import '../models/todo_model.dart';

class AddTodoScreen extends StatefulWidget {
  final bool isEditing;
  final Todo? todo;
  const AddTodoScreen({super.key, required this.isEditing, this.todo});
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TodoRepository _todoRepository = TodoRepository();
  int _priority = 0;
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
  void _updatePriority(int value) {
    setState(() {
      _priority = value;
    });
  }
  void _submitTodo() async {
    final title = _titleController.text;
    final description = _descriptionController.text;
    int priorityValue = _priority;
    DateTime deadLine = _selectedDate!;
    if (title.isNotEmpty && description.isNotEmpty && _selectedDate != null) {
      if (widget.isEditing && widget.todo != null) {
        final updatedTodo = Todo(
          id: widget.todo!.id,
          title: title,
          description: description,
          deadLine: deadLine,
          priority: priorityValue,
        );
        await _todoRepository.update(updatedTodo);
        Navigator.push(context, MaterialPageRoute(builder: (context) => TodoListScreen()));
      } else {
        final newTodo = Todo(
          title: title,
          description: description,
          deadLine: deadLine,
          priority: priorityValue,
        );
        await _todoRepository.insert(newTodo);
        Navigator.push(context, MaterialPageRoute(builder: (context) => TodoListScreen()));
      }
      _titleController.clear();
      _descriptionController.clear();
      _priority = 0;
      _selectedDate = null;
      setState(() {});
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Not Valid",
              textAlign: TextAlign.center,
            ),
            content: const Text(
              "Please fill all field",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      );
    }
  }
  @override
  void initState() {
    super.initState();
    _titleController.text = widget.isEditing ? widget.todo?.title ?? '' : '';
    _descriptionController.text = widget.isEditing ? widget.todo?.description ?? '' : '';
    _priority = widget.isEditing ? widget.todo?.priority ?? 0 : 0;
    _selectedDate = widget.isEditing ? widget.todo?.deadLine : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: widget.isEditing ? Colors.yellow.shade500 : Colors.blue,
          centerTitle: true,
          title: Text(widget.isEditing ? "Edit Todo" : "Add Todo", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                children: [
                  TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                          labelText: "Title",
                          labelStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  const SizedBox(height: 10),
                  TextField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                          labelText: "Description",
                          labelStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)))
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Deadline',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => _selectDate(context),
                        icon: const Icon(
                          Icons.calendar_today,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      Text(
                        _selectedDate != null
                            ? _selectedDate.toString().substring(0, 10)
                            : 'No Select',
                        style: const TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Priority",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 2,
                        groupValue: _priority,
                        onChanged: (value) {
                          setState(() {
                            _priority = value as int;
                          });
                        },
                      ),
                      const Text(
                        'High',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _priority,
                        onChanged: (value) {
                          setState(() {
                            _priority = value as int;
                          });
                        },
                      ),
                      const Text(
                        'Medium',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 0,
                        groupValue: _priority,
                        onChanged: (value) {
                          setState(() {
                            _priority = value as int;
                          });
                        },
                      ),
                      const Text(
                        'Low',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              TextButton(
                onPressed: _submitTodo,
                style: TextButton.styleFrom(
                  backgroundColor: widget.isEditing? Colors.yellow.shade500 : Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Đặt bo tròn với bán kính 20
                  ),
                  minimumSize: const Size(200, 50),
                ),
                child: Text(
                  widget.isEditing? "EDIT": "ADD",
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }
}
