class Todo {
  String title;
  String subtitle;
  bool isDone;

  Todo({
    required this.title,
    required this.subtitle,
    this.isDone = false,
  });
}
