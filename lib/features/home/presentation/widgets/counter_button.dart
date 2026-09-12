import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({
    super.key,
    this.initialValue = 1,
    this.onChanged,
    this.width = 115,
    this.height = 44,
  });

  final int initialValue;
  final ValueChanged<int>? onChanged;
  final double width;
  final double height;

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  late int counter;

  @override
  void initState() {
    super.initState();
    counter = widget.initialValue;
  }

  @override
  void didUpdateWidget(CounterButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      counter = widget.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double buttonSize = (widget.height - 12).clamp(24.0, 34.0);

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: AppColors.cardFillClr,
        borderRadius: BorderRadius.circular(45),
        border: Border.all(
          color: AppColors.borderSideClr,
          width: 1,
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
                widget.onChanged?.call(counter);
              }
            },
            child: Container(
              width: buttonSize,
              height: buttonSize,
              decoration: BoxDecoration(
                color: counter > 1
                    ? AppColors.primaryClr
                    : AppColors.borderSideClr,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.remove_rounded,
                size: (buttonSize * 0.55).clamp(14.0, 18.0),
                color: counter > 1
                    ? AppColors.whiteClr
                    : AppColors.grayClr,
              ),
            ),
          ),
          // Counter text
          SizedBox(
            width: 26,
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
              widget.onChanged?.call(counter);
            },
            child: Container(
              width: buttonSize,
              height: buttonSize,
              decoration: BoxDecoration(
                color: AppColors.primaryClr,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add_rounded,
                size: (buttonSize * 0.55).clamp(14.0, 18.0),
                color: AppColors.whiteClr,
              ),
            ),
          ),
        ],
      ),
    );
  }
}