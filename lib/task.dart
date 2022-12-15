class Task {
  String stationName;
  String date;
  bool isDone;

  Task(this.date, this.stationName, this.isDone);

  bool isEqual(Task other) {
    return this.date.compareTo(other.date) == 0 &&
        stationName.compareTo(other.stationName) == 0;
  }
}
