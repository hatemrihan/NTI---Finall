import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/settings/presentation/screens/privacy_policy_screen.dart';
import 'package:final_project/features/settings/presentation/screens/about_us_screen.dart';
import 'package:final_project/features/auth/presentation/screens/change_password_screen.dart';
import 'package:final_project/features/settings/presentation/screens/contact_us_screen.dart';
import 'package:final_project/core/theme/theme_cubit.dart';
import 'package:final_project/features/home/presentation/widgets/custom_container_row.dart';
import 'package:final_project/features/home/presentation/widgets/custom_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool value1 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundClr,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('SETTINGS', style: AppStyles.style20ExtraBold),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsContainer(
                children: [
                  SettingsRow(
                    icon: Icons.notifications_none,
                    title: 'Notifications',
                    trailing: Switch(
                      value: value1,
                      onChanged: (newvalue1) {
                        setState(() {
                          value1 = newvalue1;
                        });
                      },
                    ),
                  ),
                  Divider(color: AppColors.borderSideClr),

                  InkWell(
                    onTap: () {},
                    child: SettingsRow(
                      icon: Icons.language,
                      title: 'Language',
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('English',style: AppStyles.style16Regular,),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_ios, size: 18),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: AppColors.borderSideClr),
                  InkWell(
                    onTap: () {},
                    child: SettingsRow(
                      icon: Icons.attach_money,
                      title: 'Currency',
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('USD (\$)',style: AppStyles.style16Regular,),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_ios, size: 18),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: AppColors.borderSideClr),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangepasswordScreen(),
                        ),
                      );
                    },
                    child: SettingsRow(
                      icon: Icons.lock_outline,
                      title: 'Change Password',
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [Icon(Icons.arrow_forward_ios, size: 18)],
                      ),
                    ),
                  ),
                  Divider(color: AppColors.borderSideClr),
                  InkWell(
                    onTap: () {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                    child: SettingsRow(
                      icon: Icons.dark_mode_outlined,
                      title: 'Dark Theme',
                      trailing: Switch(
                        value: context.watch<ThemeCubit>().isDark,
                        onChanged: (newvalue2) {
                          context.read<ThemeCubit>().setDarkMode(newvalue2);
                        },
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              SettingsContainer(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen(),
                        ),
                      );
                    },
                    child: SettingsRow(
                      icon: Icons.shield_outlined,
                      title: 'Privacy Policy',
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    ),
                  ),
                  Divider(color: AppColors.borderSideClr),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutUsScreen(),
                        ),
                      );
                    },
                    child: SettingsRow(
                      icon: Icons.info_outline,
                      title: 'About Us',
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    ),
                  ),
                  Divider(color: AppColors.borderSideClr),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactUsScreen(),
                        ),
                      );
                    },
                    child: SettingsRow(
                      icon: Icons.mail_outline,
                      title: 'Contact Us',
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              InkWell(
                onTap: () {},
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.profileCard,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color:AppColors.borderSideClr,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_outline,
                        color: AppColors.redClr,
                        size: 28,
                      ),

                      SizedBox(width: 10),

                      Text(
                        'Delete Account',
                        style: AppStyles.style16Bold.copyWith(color:AppColors.redClr,),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
