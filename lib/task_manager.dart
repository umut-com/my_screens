import 'task.dart';

class Tasks {
  static final Tasks _instance = Tasks._inner();

  final List<Task> _tasks = [];

  factory Tasks() {
    return _instance;
  }

  Tasks._inner();

  List<Task> getAllTasks() {
    return _tasks;
  }

  void addTask(Task task) {
    for (Task thisTask in _tasks) {
      if (thisTask.isEqual(task)) return;
    }
    _tasks.add(task);
  }

  void removeTask(Task task) {
    for (int i = 0; i < _tasks.length; i++) {
      if (_tasks[i].isEqual(task)) {
        _tasks.removeAt(i);
        return;
      }
    }
  }

  List<Task> getCompletedTasks() {
    List<Task> completedTasks = [];
    for (Task task in _tasks) {
      if (task.isDone) {
        completedTasks.add(task);
      }
    }
    return completedTasks;
  }

  List<Task> getNonCompletedTasks() {
    List<Task> nonCompletedTasks = [];
    for (Task task in _tasks) {
      if (!task.isDone) {
        nonCompletedTasks.add(task);
      }
    }
    return nonCompletedTasks;
  }
}
