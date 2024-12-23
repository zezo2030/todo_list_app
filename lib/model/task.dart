class Task {
  //task name
  String title;
  // task is done or not
  bool isDone;

  Task({required this.title, this.isDone = false});

  // تحويل المهمه الي json

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }

  factory Task.fromJason(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      isDone: json['isDone'],
    );
  }
}
