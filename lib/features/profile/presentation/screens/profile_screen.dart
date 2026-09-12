import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:final_project/features/auth/presentation/screens/login_screen.dart';
import 'package:final_project/features/home/presentation/screens/manage_product_screen.dart';
import 'package:final_project/features/settings/presentation/screens/settings_screen.dart';
import 'package:final_project/features/profile/presentation/widgets/custom_profile_item.dart';
import 'package:final_project/features/profile/presentation/widgets/custom_profile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:final_project/core/theme/theme_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<ProfileItemModel1> mylist1 = [
    ProfileItemModel1(
      title: 'My Orders',
      icon: Icons.shopping_bag_outlined,
      rightIcon: Icons.arrow_forward_ios,
    ),
    ProfileItemModel1(
      title: 'Wishlist',
      icon: Icons.favorite_border_rounded,
      rightIcon: Icons.arrow_forward_ios,
    ),
    ProfileItemModel1(
      title: 'Shipping Addresses',
      icon: Icons.location_on_outlined,
      rightIcon: Icons.arrow_forward_ios,
    ),
    ProfileItemModel1(
      title: 'Payment Methods',
      icon: Icons.credit_card,
      rightIcon: Icons.arrow_forward_ios,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        List<ProfileItemModel2> mylist2 = [
          ProfileItemModel2(
            title: 'Settings',
            icon: Icons.settings_outlined,
            rightIcon: Icons.arrow_forward_ios,
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
              if (mounted) setState(() {});
            },
          ),
          ProfileItemModel2(
            title: 'Manage Products',
            icon: Icons.inventory_2,
            rightIcon: Icons.arrow_forward_ios,
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ManageProductScreen(),
                ),
              );
              if (mounted) setState(() {});
            },
          ),
          ProfileItemModel2(
            title: 'Help and Support',
            icon: Icons.help_outline_rounded,
            rightIcon: Icons.arrow_forward_ios,
          ),
        ];

        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.backgroundClr,
            title: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'MY PROFILE',
                style: AppStyles.style20ExtraBold.copyWith(
                  color: AppColors.textClr,
                ),
              ),
            ),
          ),
          backgroundColor: AppColors.backgroundClr,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 60.5,
                              backgroundImage: const AssetImage(
                                'assets/images/logo.png',
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryClr,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.photo_camera,
                                  color: AppColors.bottomBackgroundClr,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'LAMSA',
                          style: AppStyles.style20ExtraBold.copyWith(
                            color: AppColors.textClr,
                          ),
                        ),
                        Text(
                          'lamsa@gmail.com',
                          style: AppStyles.style14Regular.copyWith(
                            color: AppColors.grayClr,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Card(
                      color: AppColors.profileCard,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: mylist1.length,
                    itemBuilder: (context, index) {
                      return CustomProfileItems(
                        title: mylist1[index].title,
                        icon: mylist1[index].icon,
                        rightIcon: mylist1[index].rightIcon,
                        color: AppColors.primaryClr,
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(color: AppColors.borderSideClr);
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                  ),
                  child: Card(
                    color: AppColors.profileCard,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: mylist2.length,
                      itemBuilder: (context, index) {
                        return CustomProfileItems(
                          title: mylist2[index].title,
                          icon: mylist2[index].icon,
                          rightIcon: mylist2[index].rightIcon,
                          color: AppColors.primaryClr,
                          onTap: () {
                            (mylist2[index].onTap ?? () {})();
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(color: AppColors.borderSideClr);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Card(
                  color: AppColors.profileCard,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomProfileItems(
                      title: 'Log Out',
                      icon: Icons.logout,
                      color: AppColors.redClr,
                      onTap: () {
                                        showDialog(
                  context: context,
                  builder: (dialogContext) => AlertDialog(
                    title: const Text('Logout?'),
                    content: Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(dialogContext),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => AuthCubit(),
                                child: const LoginScreen(),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Logout',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );

                      },
                    ),
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
