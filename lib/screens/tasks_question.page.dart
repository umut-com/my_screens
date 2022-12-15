import 'package:flutter/material.dart';
import 'package:limak/question_for_tasks.dart';
import 'package:limak/screens/completed_tasks_page.dart';
import 'package:limak/task_manager.dart';

class TasksQuestionPage extends StatefulWidget {
  TasksQuestionPage(
    this.selectedIndex, {
    Key? key,
  }) : super(key: key);

  final int selectedIndex;
  Tasks instance = Tasks();

  final List<QuestionForTasks> questionForTasks = [
    QuestionForTasks('1.Zeminde kayganlık var mı?', false, false),
    QuestionForTasks(
        '2.Ekipmanların koruyucu kapakları yerinde mi?', false, false),
    QuestionForTasks('3.5S düzenine uygun mu?', false, false),
    QuestionForTasks('4.Boru tesisatında sızıntı var mı?', false, false),
    QuestionForTasks('5.Tünel önünde buzlanma var mı?', false, false),
  ];

  @override
  State<TasksQuestionPage> createState() => _TasksQuestionPageState();
}

class _TasksQuestionPageState extends State<TasksQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Olay Yönetimi'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.instance
                    .getNonCompletedTasks()[widget.selectedIndex]
                    .stationName,
                style: TextStyle(fontSize: 18, backgroundColor: Colors.blue),
              ),
              Expanded(
                flex: 6,
                child: ListView.builder(
                  padding: EdgeInsets.all(7),
                  itemCount: widget.questionForTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 65, 2),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                  widget.questionForTasks[index].questionName),
                            ),
                            Checkbox(
                                value: widget.questionForTasks[index].isDone1,
                                onChanged: (value) {
                                  setState(() {
                                    widget.questionForTasks[index].isDone1 =
                                        value!;
                                    widget.questionForTasks[index].isDone =
                                        !value;
                                  });
                                }),
                            Checkbox(
                                value: widget.questionForTasks[index].isDone,
                                onChanged: (value) {
                                  setState(() {
                                    widget.questionForTasks[index].isDone =
                                        value!;
                                    widget.questionForTasks[index].isDone1 =
                                        !value;
                                  });
                                }),
                            Icon(
                              Icons.camera_alt,
                              size: 15,
                            ),
                          ],
                        ));
                  },
                ),
              ),
              Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.instance
                          .getNonCompletedTasks()[widget.selectedIndex]
                          .isDone = true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompletedTasks()));
                    },
                    child: Text('Gönder'),
                  ))
              //Buttons
            ],
          ),
        ));
  }
}
