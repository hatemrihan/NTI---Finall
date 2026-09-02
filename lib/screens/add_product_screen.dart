import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:final_project/widgets/custom_category_dropdown.dart';
import 'package:final_project/widgets/custom_image_upload_container.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundClr,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textClr),
        ),
        centerTitle: true,
        title: Text('ADD PRODUCT', style: AppStyles.style18ExtraBold),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildImageUploadContainer(),
                const SizedBox(height: 20),
                CustomTextField(
                  title: 'PRODUCT NAME',
                  hintText: 'e.g. Heirloom Gold Bracelet',
                  // controller: _nameController,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  title: 'DESCRIPTION',
                  hintText: 'Write product narrative and specs...',
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,

                  // controller: _descriptionController,
                ),
                const SizedBox(height: 20),
                BuildCategoryDropdown(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        title: 'PRICE (\$)',
                        hintText: '120.00',
                        // controller: _priceController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomTextField(
                        title: 'STOCK QUANTITY',
                        hintText: '25',
                        // controller: _stockController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryClr,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Publish Product',
                      style: AppStyles.style16Bold.copyWith(
                        color: AppColors.whiteClr,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
