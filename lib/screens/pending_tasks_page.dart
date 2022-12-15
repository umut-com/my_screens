import 'package:flutter/material.dart';
import 'package:limak/screens/completed_tasks_page.dart';
import 'package:limak/task.dart';

import '../task_manager.dart';
import 'tasks_question.page.dart';

class PendingTasks extends StatefulWidget {
  PendingTasks({Key? key}) : super(key: key) {
    for (Task tasks in taskManager.getAllTasks()) {
      if (!tasks.isDone) {
        taskManager.getNonCompletedTasks().add(tasks);
      }
    }
  }
  Tasks taskManager = Tasks();

  List<Task> nonCompletedtasks = [];

  @override
  State<PendingTasks> createState() => _PendingTasksState();
}

class _PendingTasksState extends State<PendingTasks> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
        title: const Text(
          'Bekleyen Görevlerim',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: ListView.builder(
              padding: EdgeInsets.all(7),
              itemCount: widget.taskManager.getNonCompletedTasks().length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(widget.taskManager
                      .getNonCompletedTasks()[index]
                      .stationName),
                  leading: Text(
                      widget.taskManager.getNonCompletedTasks()[index].date),
                  trailing: Text(
                      widget.taskManager.getNonCompletedTasks()[index].isDone
                          ? 'Tamamlandı'
                          : 'Bekliyor'),
                  onTap: () {
                    selectedIndex = index;
                    //print(pendingtasks[selectedIndex].stationName);
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            margin: const EdgeInsets.fromLTRB(30, 1, 20, 55),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new CompletedTasks()));
                  },
                  child: const Text(
                    'Tamamlanan \n'
                    'Görevler',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Olay Yönetimi',),
                          content: const Text(
                            'Bekleyen görevlerden birini seçiniz!',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                      return;
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                new TasksQuestionPage(selectedIndex)));
                  },
                  child: const Text(
                    'Olay Yönetimi',
                  ),
                )
              ],
            ),
          ), //Buttons
        ],
      ),
    );
  }
}
