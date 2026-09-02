import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:final_project/screens/cart_screen.dart';
import 'package:final_project/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class HomeScreenHeader extends StatefulWidget {
  const HomeScreenHeader({super.key, this.onTabChange});
  final ValueChanged<int>? onTabChange;

  @override
  State<HomeScreenHeader> createState() => _HomeScreenHeaderState();
}

class _HomeScreenHeaderState extends State<HomeScreenHeader> {
  final GlobalKey<FormState> myKey = GlobalKey();
  final TextEditingController searchCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "NOMA",
                style: AppStyles.style24ExtraBold.copyWith(
                  fontFamily: "Manrope",
                  color: AppColors.textClr,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: AppColors.textClr,
                  size: 24,
                ),
              ),
              IconButton(
                onPressed: () {
                  widget.onTabChange?.call(2);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.textClr,
                  size: 24,
                ),
              ),
            ],
          ),
          SearchTextField(
            controller: searchCtl,
            hintText: 'Search products...',
            prefixIcon: Icon(Icons.search_outlined),
          ),
        ],
      ),
    );
  }
}
