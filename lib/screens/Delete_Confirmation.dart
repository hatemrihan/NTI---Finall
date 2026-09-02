import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DeleteConfirmation extends StatelessWidget {
  const DeleteConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundClr,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        centerTitle: true,
        title: Text('DELETE ITEM', style: AppStyles.style18ExtraBold),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              color: AppColors.whiteClr,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.broClr.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      height: 70,
                      width: 70,
                      child: const Icon(
                        Icons.warning_amber_rounded,
                        size: 30,
                        color: AppColors.bro2Clr,
                      ),
                    ),
                    Text('Delete Product?', style: AppStyles.style18ExtraBold),
                    const SizedBox(height: 12),
                    Text(
                      'Are you sure you want to permanently remove this product from your inventory? This action cannot be undone.',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: AppStyles.style13,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.backgroundClr,
                            foregroundColor: Colors.black,
                          ),
                          child: const Text(
                            'Cancel',
                            style: AppStyles.style14SemiBold,
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.redClr,
                            foregroundColor: AppColors.backgroundClr,
                          ),
                          child: const Text(
                            'Delete',
                            style: AppStyles.style14SemiBold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
