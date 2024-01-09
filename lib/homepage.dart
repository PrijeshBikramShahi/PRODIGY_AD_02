import 'package:flutter/material.dart';
import 'package:trac_to_do/utils/color_pallete.dart';
import 'package:trac_to_do/utils/dialog_box.dart';
import 'package:trac_to_do/utils/note_tile.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color tileCol = AppColors.defaultTileColor;

  final _controller = TextEditingController();

  List toDoList = [
    ['Make Bed', false],
    ['Bath', false],
    ['Read', false],
    ['Gym', false],
    ['Eat', false],
  ];
  void checkClicked(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
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
    super.initState();
    getDate();
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
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
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  const Text(
                    "Today",
                    style: TextStyle(
                      color: AppColors.todayTextColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    getDate(),
                    style: const TextStyle(
                        color: AppColors.dateTextColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
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
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompletion: toDoList[index][1],
            onChanged: (value) {
              checkClicked(value, index);
              setState(() {
                if (toDoList[index][1]) {
                  tileCol = AppColors.checkedTileColor;
                } else {
                  tileCol = AppColors.defaultTileColor;
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: createNewTask, label: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
