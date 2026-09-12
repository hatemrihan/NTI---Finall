import 'package:final_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.profileCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderSideClr,width: 1.5),
      ),
      child: Column(children: children),
    );
  }
}
