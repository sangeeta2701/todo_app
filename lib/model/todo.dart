class TodoField {
  static const createdTime = "createdTime";
}

class Todo {
  DateTime createdTime;
  String title;
  String description;
  String id;
  bool isDone;

  Todo({
    required this.createdTime,
    required this.title,
    required this.description,
    required this.id,
    this.isDone = false
  });
}
