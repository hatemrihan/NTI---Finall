import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class SettingsRow extends StatelessWidget {
  const SettingsRow({super.key, 
    required this.icon,
    required this.title,
    required this.trailing,
  });

  final IconData icon;
  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(
              icon,
              size: 17,
            ),

            const SizedBox(width: 10),

            Text(
              title,
              style: AppStyles.style16SemiBold
            ),

            const Spacer(),

            trailing,
          ],
        ),
      ),
    );
  }
}