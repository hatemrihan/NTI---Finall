import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:final_project/widgets/custom_container_row.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});

  final List<Map<String, String>> teamMembers = [
    {'image': '', 'name': 'Team Member 1', 'role': 'Role 1'},
    {'image': '', 'name': 'Team Member 2', 'role': 'Role 2'},
    {'image': '', 'name': 'Team Member 3', 'role': 'Role 3'},
    {'image': '', 'name': 'Team Member 4', 'role': 'Role 4'},
    {'image': '', 'name': 'Team Member 5', 'role': 'Role 5'},
    {'image': '', 'name': 'Team Member 6', 'role': 'Role 6'},
    {'image': '', 'name': 'Team Member 7', 'role': 'Role 7'},
    {'image': '', 'name': 'Team Member 8', 'role': 'Role 8'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundClr,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text('About Us', style: AppStyles.style18ExtraBold),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 900,
                    child: SettingsContainer(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            'assets/images/cart_item.png',
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Curated Accessories.',
                      style: AppStyles.style20ExtraBold,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Founded in 2024, NOMA was built on the appreciation for honest materials, refined geometry, and everyday utility. We believe the objects we carry define our daily space.',
                      style: AppStyles.style14Regular,
                    ),
                  ],
                ),
                SizedBox(height: 20),

                SettingsContainer(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Our Values', style: AppStyles.style20ExtraBold),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text('• ', style: AppStyles.style14Regular),
                              Text('Quality:', style: AppStyles.style14Bold),
                              Expanded(
                                child: Text(
                                  ' Handcrafted items created to endure across seasons.',
                                  style: AppStyles.style13Regular.copyWith(
                                    color: AppColors.grayClr,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              //  Text('• ', style: AppStyles.style14),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Sustainability: ',
                                        style: AppStyles.style14Bold,
                                      ),
                                      TextSpan(
                                        text:
                                            'Sourced with respect for local communities and ecosystems.',
                                        style: AppStyles.style13Regular
                                            .copyWith(color: AppColors.grayClr),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              // Text('• ', style: AppStyles.style14),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '• Community: ',
                                        style: AppStyles.style14Bold,
                                      ),
                                      TextSpan(
                                        text:
                                            'Supporting artisans preserving timeless techniques.',
                                        style: AppStyles.style13Regular
                                            .copyWith(color: AppColors.grayClr),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),

                Text("Meet the Team", style: AppStyles.style20ExtraBold),

                SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    height: 150,
                    child: ListView.separated(
                      itemCount: 8,
                      padding: EdgeInsets.all(8),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                'assets/images/img_profile.png',
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Team Member',
                              style: AppStyles.style16ExtraBold,
                            ),
                            Text(
                              'Role',
                              style: AppStyles.style14Regular.copyWith(
                                color: AppColors.grayClr,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 10);
                      },
                    ),
                  ),
                ),

                SizedBox(height: 70),
                Center(
                  child: Text(
                    'NOMA Accessories • v1.4.0',
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
