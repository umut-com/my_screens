import 'package:flutter/material.dart';
import 'package:limak/screens/login_page.dart';
import 'package:limak/task_manager.dart';

import 'task.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    for (int i = 0; i < pendingtasks.length; i++) {
      taskManager.addTask(pendingtasks[i]);
    }
  }

  Tasks taskManager = Tasks();

  List<Task> pendingtasks = [
    Task('14-04-2019', 'Station 1: Dispencer Besleme Sandwich Makinesi', false),
    Task('15-04-2019', 'Station 2: Tepsi Besleme Vienetta', false),
    Task('16-04-2019', 'Station 3:Ön Paketleme OTEM', false),
    Task('14-04-2019', 'Station 4:Kolileme Robot', false),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[800],
      body: LoginPage(),
    ));
  }
}
