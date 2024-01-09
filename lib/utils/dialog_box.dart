import 'package:flutter/material.dart';
import 'package:trac_to_do/utils/color_pallete.dart';
import 'package:trac_to_do/utils/my_button.dart';

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
    return AlertDialog(
      backgroundColor: AppColors.checkedTileColor,
      content: Container(
        height: 130,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.butIconColor,
                    ),
                    Text("Add your Task"),
                  ],
                ),
                labelStyle: TextStyle(),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: MyButton(
                    text: "Cancel",
                    onPressed: onCancel,
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: MyButton(
                    text: "Save",
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
