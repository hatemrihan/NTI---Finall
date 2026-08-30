import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:flutter/material.dart';

class CutomGridviewHome extends StatelessWidget {
  const CutomGridviewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: AppColors.bottomBackgroundClr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    "https://talabat639.runasp.net/images/products/Frappuccino.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 2, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Meridian",
                      style: AppStyles.style11SemiBold.copyWith(
                        color: AppColors.grayClr,
                      ),
                    ),
                    Text(
                      "Chronograph Heritage",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.style14SemiBold.copyWith(
                        color: AppColors.textClr,
                      ),
                    ),

                    Row(
                      children: [
                        Text("\$189.00", style: AppStyles.style14Bold),

                        const Spacer(),
                        IconButton(
                          color: AppColors.primaryClr,
                          onPressed: (){}, icon: const Icon(Icons.add_circle_outlined))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
    ;
  }
}
