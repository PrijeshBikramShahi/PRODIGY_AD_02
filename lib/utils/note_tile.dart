import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trac_to_do/utils/color_pallete.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompletion,
    this.onChanged,
  });
  final String taskName;
  final bool taskCompletion;
  final Function(bool?)? onChanged;
  String getDate() {
    final date = DateTime.now();
    String dateFormat = DateFormat('hh:mm a, EEE(MMM d)').format(date);
    return dateFormat;
  }
  String getTime() {
    final date = DateTime.now();
    String dateFormat = DateFormat('hh:mm a').format(date);
    return dateFormat;
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: taskCompletion
              ? AppColors.checkedTileColor
              : AppColors.defaultTileColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(value: taskCompletion, onChanged: onChanged),
                Text(taskName,style: TextStyle(
                  fontSize: 18,
                  decoration: taskCompletion? TextDecoration.lineThrough : TextDecoration.none,
                ),),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13.0, bottom: 10),
                  child: Text(taskCompletion? "Task Completed at ${getTime()}" : getDate(),style: const TextStyle(),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
