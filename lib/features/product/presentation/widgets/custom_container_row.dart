import 'package:final_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteClr,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color.fromARGB(255, 232, 222, 208)),
      ),
      child: Column(children: children),
    );
  }
}
