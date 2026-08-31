import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.text,
    required this.iconPath,
  });
  final String text;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        side: BorderSide(color: AppColors.grayClr),
        backgroundColor: AppColors.bottomBackgroundClr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
      ),
      onPressed: () {},
      icon: SizedBox(width: 25, height: 25, child: SvgPicture.asset(iconPath)),
      label: Text(
        text,
        style: AppStyles.style14SemiBold.copyWith(color: AppColors.blackClr),
      ),
    );
  }
}