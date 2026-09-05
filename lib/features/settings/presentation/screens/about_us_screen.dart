import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/settings/presentation/widgets/custom_appBar_widget.dart';
import 'package:final_project/features/settings/presentation/widgets/team_member_widget.dart';
import 'package:final_project/features/settings/presentation/widgets/value_text_widget.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      appBar: CustomAppbarWidget(
        
        title: 'ABOUT US',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),

                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/cart_item.png',
                      fit: BoxFit.cover,
                      height: 150,
                      width: double.infinity,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                /// Title & Description
                Text(
                  'Curated Accessories',
                  style: AppStyles.style22Bold.copyWith(
                    color: AppColors.textClr,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Founded in 2026, LAMSA was built on the appreciation for honest materials, refined geometry, and everyday utility. We believe the objects we carry define our daily space.',
                  style: AppStyles.style14Regular.copyWith(
                    color: AppColors.grayClr,
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 28),

                /// Our Values Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.whiteClr,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color.fromARGB(255, 232, 222, 208),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OUR VALUES',
                        style: AppStyles.style16ExtraBold.copyWith(
                          color: AppColors.textClr,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ValueTextWidget(
                        title: 'Quality:',
                        description: 'Handcrafted items created to endure across seasons.',
                      ),
                      const SizedBox(height: 12),
                      ValueTextWidget(
                        title: 'Sustainability:',
                        description: 'Sourced with respect for local communities and ecosystems.',
                      ),
                      const SizedBox(height: 12),
                      ValueTextWidget(
                        title: 'Community:',
                        description: 'Supporting artisans preserving timeless techniques.',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                /// Meet the Team
                Text(
                  'MEET THE TEAM',
                  style: AppStyles.style16ExtraBold.copyWith(
                    color: AppColors.textClr,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TeamMemberWidget(name: 'rezk <3', role: 'role'),
                    TeamMemberWidget(name: 'rezk <3', role: 'role'),
                    TeamMemberWidget(name: 'rezk <3', role: 'role'),
                  ],
                ),

                const SizedBox(height: 30),

                /// Footer
                Center(
                  child: Text(
                    'LAMSA Accessories • v1.4.0',
                    style: AppStyles.style12Medium.copyWith(
                      color: AppColors.grayClr,
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
