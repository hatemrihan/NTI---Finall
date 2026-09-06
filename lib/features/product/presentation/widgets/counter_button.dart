import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({super.key});

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 92,
        height: 52,
        decoration: BoxDecoration(
          color: AppColors.cardFillClr,
          borderRadius: BorderRadius.circular(45),
          border: Border.all(
            color: AppColors.borderSideClr,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                if (counter > 0) {
                  setState(() {
                    counter--;
                  });
                }
              },
              child: const Icon(
                Icons.remove,
                size: 20,
              ),
            ),
            Text("$counter",style: AppStyles.style16SemiBold,),
            InkWell(
              onTap: () {
                setState(() {
                  counter++;
                });
              },
              child: const Icon(
                Icons.add,
                size: 20,
              ),
            ),
          ],
        ),
      );
  }
}