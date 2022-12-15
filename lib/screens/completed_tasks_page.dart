import 'package:flutter/material.dart';
import 'package:limak/screens/pending_tasks_page.dart';
import 'package:limak/task_manager.dart';

import '../task.dart';

class CompletedTasks extends StatefulWidget {
  Tasks instance = Tasks();

  final List<Task> completedtasks = [];

  CompletedTasks({super.key}) {
    for (Task tasks in instance.getAllTasks()) {
      if (tasks.isDone) {
        instance.getCompletedTasks().add(tasks);
      }
    }
  }

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Tamamlanmış Görevler'),
        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: widget.instance.getCompletedTasks().length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title: Text(
                        widget.instance.getCompletedTasks()[index].stationName),
                    leading:
                        Text(widget.instance.getCompletedTasks()[index].date),
                    trailing: Text('Tamamlandı'),
                    onTap: () {},
                  );
                },
              ),
            ),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    print(widget.instance.getAllTasks());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PendingTasks()));
                  },
                  child: Text('Başa dön'),
                ))
          ],
        ),
      ),
    );
  }
}
