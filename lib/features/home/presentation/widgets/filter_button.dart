import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  final List<Filterbutton> filterbutton = [
    Filterbutton(
      text: "Price",
      onPressed: () {},
      buttoncolor: AppColors.primaryClr,
      textcolor: AppColors.whiteClr,
    ),
    Filterbutton(
      text: "Brand",
      onPressed: () {},
      buttoncolor: AppColors.whiteClr,
      textcolor: AppColors.blackClr,
    ),
    Filterbutton(
      text: "Rating",
      onPressed: () {},
      buttoncolor: AppColors.whiteClr,
      textcolor: AppColors.blackClr,
    ),
    Filterbutton(
      text: "Color",
      onPressed: () {},
      buttoncolor: AppColors.whiteClr,
      textcolor: AppColors.blackClr,
    ),
  ];
  Filter({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
            child: ListView.separated(
              itemCount: filterbutton.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: filterbutton[index].buttoncolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize:  Size(40, 40),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      filterbutton[index].text,
                      style: AppStyles.style14SemiBold.copyWith(
                        color: filterbutton[index].textcolor,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 10);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Filterbutton {
  final String text;
  final void Function()? onPressed;
  final Color? buttoncolor;
  final Color? textcolor;

  Filterbutton({
    required this.text,
    this.onPressed,
    this.buttoncolor,
    this.textcolor,
  });
}
