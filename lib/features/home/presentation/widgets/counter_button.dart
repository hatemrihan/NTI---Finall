import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({super.key});

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.cardFillClr,
        borderRadius: BorderRadius.circular(45),
        border: Border.all(
          color: AppColors.borderSideClr,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Minus button
          GestureDetector(
            onTap: () {
              if (counter > 1) {
                setState(() {
                  counter--;
                });
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: counter > 1
                    ? AppColors.primaryClr
                    : AppColors.borderSideClr,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.remove_rounded,
                size: 18,
                color: counter > 1
                    ? AppColors.whiteClr
                    : AppColors.grayClr,
              ),
            ),
          ),
          // Counter text
          SizedBox(
            width: 28,
            child: Center(
              child: Text(
                "$counter",
                style: AppStyles.style16SemiBold.copyWith(
                  color: AppColors.textClr,
                ),
              ),
            ),
          ),
          // Plus button
          GestureDetector(
            onTap: () {
              setState(() {
                counter++;
              });
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.primaryClr,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add_rounded,
                size: 18,
                color: AppColors.whiteClr,
              ),
            ),
          ),
        ],
      ),
    );
  }
}