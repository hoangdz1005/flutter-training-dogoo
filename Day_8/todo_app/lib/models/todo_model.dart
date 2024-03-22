class Todo {
  int? id;
  String title;
  String description;
  DateTime deadLine;
  int priority;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.deadLine,
    required this.priority
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'deadline': deadLine.toIso8601String(),
      'priority': priority,
    };
  }
}