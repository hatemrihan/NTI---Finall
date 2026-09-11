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
  String? selectedColor;
  String? selectedSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Color', style: AppStyles.style13Bold),
        SizedBox(height: 8),
        Row(
          spacing: 10,
          children: [
            ColorButton(color: AppColors.primaryClr, isSelected: selectedColor == "green", onPressed: (){ setState(() { selectedColor = "green";});}),
            ColorButton(color: AppColors.brownClr, isSelected: selectedColor == "brown", onPressed: (){ setState(() { selectedColor = "brown";});}),
            ColorButton(color: Color(0xffDCD9D2), isSelected: selectedColor == "Tan", onPressed: (){ setState(() { selectedColor = "Tan";});}),
            ColorButton(color: Color(0xffE8DDCB), isSelected: selectedColor == "beige", onPressed: (){ setState(() { selectedColor = "beige";});}),
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
