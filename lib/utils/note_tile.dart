import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:trac_to_do/utils/color_pallete.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompletion,
    this.onChanged,
    this.deleteFunction,
    this.editFunction,
  });
  final String taskName;
  final bool taskCompletion;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  final Function(BuildContext)? editFunction;

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
      padding: const EdgeInsets.all(12.0).copyWith(left: 20,right: 20),
      child: Slidable(
        closeOnScroll: true,
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              autoClose: true,
              onPressed: editFunction,
              icon: Icons.edit,
              backgroundColor: AppColors.todayTextColor,
            ),
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              autoClose: true,
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.6),
                spreadRadius: 3,
                blurRadius: 1,
                offset: Offset(0, 4),
              )
            ],
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
                  Text(
                    taskName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      decoration: taskCompletion
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0, bottom: 10),
                    child: Text(
                      taskCompletion
                          ? "Task Completed at ${getTime()}"
                          : getDate(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
