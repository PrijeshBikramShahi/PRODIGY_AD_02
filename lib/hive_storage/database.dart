import 'package:hive_flutter/hive_flutter.dart';

class TracToDoDataBase {
  List toDoList = [];

  final _myBox = Hive.box('myBox');

  void createInitialData() {
    toDoList = [
      ['Wake Up', false],
      ['Bath', false],
      ['Eat', false]
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
