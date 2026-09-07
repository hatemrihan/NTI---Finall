import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/home/presentation/widgets/color_button.dart';
import 'package:final_project/features/home/presentation/widgets/size_button.dart' show SizeButton;
import 'package:flutter/material.dart';

class ProductOptions extends StatefulWidget {
  const ProductOptions({super.key});

  @override
  State<ProductOptions> createState() => _ProductOptionsState();
}

class _ProductOptionsState extends State<ProductOptions> {
  String? selectedSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Select Color', style: AppStyles.style13Bold),
        SizedBox(height: 8),
        Row(
          spacing: 10,
          children: [
            ColorButton(color: AppColors.primaryClr, text: "green"),
            ColorButton(color: Color(0xffB9785B), text: "color"),
            ColorButton(color: AppColors.blackClr, text: "black"),
            ColorButton(color: Color(0xffE8DDCB), text: "color"),
          ],
        ),
        SizedBox(height: 20),
        Text("Select Size", style: AppStyles.style13Bold),
        SizedBox(height: 8),
        Row(
          spacing: 6,
          children: [
            SizeButton(size: "S", width: 20, height: 50, isSelected: selectedSize == "S", onPressed: () { setState(() { selectedSize = "S"; }); }),
            SizeButton(size: "M", width: 20, height: 50, isSelected: selectedSize == "M", onPressed: () { setState(() { selectedSize = "M"; }); }),
            SizeButton(size: "L", width: 20, height: 50, isSelected: selectedSize == "L", onPressed: () { setState(() { selectedSize = "L"; }); }),
          ],
        ),
      ],
    );
  }
}