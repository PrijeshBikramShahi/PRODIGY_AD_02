import 'package:flutter/material.dart';
import 'package:trac_to_do/hive_storage/database.dart';
import 'package:trac_to_do/utils/color_pallete.dart';
import 'package:trac_to_do/utils/dialog_box.dart';
import 'package:trac_to_do/utils/note_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color tileCol = AppColors.defaultTileColor;

  final _controller = TextEditingController();

  final _myBox = Hive.box('myBox');

  TracToDoDataBase db = TracToDoDataBase();
  void checkClicked(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  String getDate() {
    var date = DateTime.now();
    String dateFormat = DateFormat('EEEE').format(date);
    return dateFormat;
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
    getDate();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBoxa(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  const Text(
                    "Today",
                    style: TextStyle(
                      color: AppColors.todayTextColor,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    getDate(),
                    style: const TextStyle(
                        color: AppColors.dateTextColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.add,
                      size: 35,
                      color: AppColors.dateAddColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompletion: db.toDoList[index][1],
            onChanged: (value) {
              checkClicked(value, index);
              setState(() {
                if (db.toDoList[index][1]) {
                  tileCol = AppColors.checkedTileColor;
                } else {
                  tileCol = AppColors.defaultTileColor;
                }
              });
            },
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: InkWell(
        onTap: createNewTask,
        splashColor: AppColors.defaultTileColor,
        child: Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1.8,
                color: Colors.black,
              ),
              color: AppColors.todayTextColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor.withOpacity(0.5),
                  offset: const Offset(1, 3),
                  spreadRadius: 2,
                )
              ]),
          child: const Icon(
            Icons.add_rounded,
            size: 50,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
