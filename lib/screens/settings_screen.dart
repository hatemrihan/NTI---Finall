import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:final_project/screens/about_us_screen.dart';
import 'package:final_project/screens/change_password_screen.dart';
import 'package:final_project/screens/contact_us_screen.dart';
import 'package:final_project/screens/privacy_policy_screen.dart';
import 'package:final_project/widgets/custom_container_row.dart';
import 'package:final_project/widgets/custom_row.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool value1 = true;
  bool value2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),

                  const Text('SETTINGS', style: AppStyles.style20ExtraBold),
                ],
              ),

              const SizedBox(height: 12),

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
                  Divider(),

                  InkWell(
                    onTap: () {},
                    child: SettingsRow(
                      icon: Icons.language,
                      title: 'Language',
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('English'),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_ios, size: 14),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {},
                    child: SettingsRow(
                      icon: Icons.attach_money,
                      title: 'Currency',
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('USD (\$)'),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_ios, size: 14),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
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
                        children: [Icon(Icons.arrow_forward_ios, size: 14)],
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {},
                    child: SettingsRow(
                      icon: Icons.dark_mode_outlined,
                      title: 'Dark Theme',
                      trailing: Switch(
                        value: value2,
                        onChanged: (newvalue2) {
                          setState(() {
                            value2 = newvalue2;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              SettingsContainer(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicy(),
                        ),
                      );
                    },
                    child: SettingsRow(
                      icon: Icons.shield_outlined,
                      title: 'Privacy Policy',
                      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                    ),
                  ),
                  Divider(),
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
                      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                    ),
                  ),
                  Divider(),
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
                      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              InkWell(
                onTap: () {},
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.whiteClr,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color.fromARGB(255, 232, 222, 208),
                    ),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.delete_outline,
                        color: AppColors.redClr,
                        size: 18,
                      ),

                      SizedBox(width: 10),

                      Text(
                        'Delete Account',
                        style: TextStyle(
                          color: AppColors.redClr,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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
