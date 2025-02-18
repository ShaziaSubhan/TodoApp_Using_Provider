class Task {
  final String  title;
  bool isCompleted;
  Task({
    required this.title,
    required this.isCompleted,
  });

  //task object to map
    Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }

 //map to task object
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }

  void isDone(){
    isCompleted = !isCompleted;
  }
}