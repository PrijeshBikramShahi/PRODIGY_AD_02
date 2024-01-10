import 'package:flutter/material.dart';
import 'package:trac_to_do/utils/color_pallete.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [BoxShadow(
              color: AppColors.shadowColor2,
              blurRadius: 1,
              spreadRadius: 2,
              offset: Offset(0, 2),
            )],
            border: Border.all(),
            borderRadius: BorderRadius.circular(20),
            color: AppColors.backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0).copyWith(top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
