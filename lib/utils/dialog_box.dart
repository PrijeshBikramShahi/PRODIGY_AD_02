import 'package:flutter/material.dart';
import 'package:trac_to_do/utils/color_pallete.dart';
import 'package:trac_to_do/utils/my_button.dart';

// ignore: must_be_immutable
class DialogBoxa extends StatelessWidget {
  DialogBoxa({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                width: 4,
              ),
              borderRadius: BorderRadius.circular(32)),
          width: 287,
          height: 189,
        ),
      ),
      AlertDialog(
        backgroundColor: AppColors.todayTextColor,
        content: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                expands: false,
                controller: controller,
                decoration: const InputDecoration(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      Text("Add your Task"),
                    ],
                  ),
                  labelStyle: TextStyle(),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: MyButton(
                      text: "Cancel",
                      onPressed: onCancel,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: MyButton(
                      text: "Save",
                      onPressed: onSave,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
