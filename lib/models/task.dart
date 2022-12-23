class Task {
  String id;
  String title;
  int date;
  bool isDone;

  Task(
      {this.id = '',
      required this.title,
      required this.date,
      this.isDone = false});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "date": date,
      "isDone": isDone,
    };
  }

  Task.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            date: json['date'],
            isDone: json['isDone']);
}
