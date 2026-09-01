import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:final_project/widgets/custom_profile_item.dart';
import 'package:final_project/widgets/custom_profile_item_modle.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<ProfileItemModle1> mylist1 = [
    ProfileItemModle1(
      title: 'My Orders',
      icon: Icons.shopping_bag_outlined,
      Ricon: Icons.arrow_forward_ios,
    ),
    ProfileItemModle1(
      title: 'Wishlist',
      icon: Icons.favorite_border_rounded,
      Ricon: Icons.arrow_forward_ios,
    ),
    ProfileItemModle1(
      title: 'Shipping Addresses',
      icon: Icons.location_on_outlined,
      Ricon: Icons.arrow_forward_ios,
    ),
    ProfileItemModle1(
      title: 'Payment Methods',
      icon: Icons.credit_card,
      Ricon: Icons.arrow_forward_ios,
    ),
  ];
  List<ProfileItemModle2> mylist2 = [
    ProfileItemModle2(
      title: 'Settings',
      icon: Icons.settings_outlined,
      Ricon: Icons.arrow_forward_ios,
      onTap: () {},
    ),
    ProfileItemModle2(
      title: 'Help and Support',
      icon: Icons.help_outline_rounded,
      Ricon: Icons.arrow_forward_ios,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundClr,
        title: Padding(
          padding: const EdgeInsets.all(24.0),
          child: const Text('MY PROFILE', style: AppStyles.style20ExtraBold),
        ),
      ),
      backgroundColor: AppColors.backgroundClr,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 45.5,
                        backgroundImage: const AssetImage(
                          'assets/images/img_profile.png',
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(6.0),
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
                  Text('Sarah Johnson ', style: AppStyles.style20ExtraBold),
                  Text('sarah@email.com', style: AppStyles.style13),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Card(
                  color: AppColors.whiteClr,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mylist1.length,
                    itemBuilder: (context, index) {
                      return CustomProfileItems(
                        title: mylist1[index].title,
                        icon: mylist1[index].icon,
                        Ricon: mylist1[index].Ricon,
                        color: AppColors.primaryClr,
                        onTap: () {},
                      );
                    },

                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: Card(
                  color: AppColors.whiteClr,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mylist2.length,
                    itemBuilder: (context, index) {
                      return CustomProfileItems(
                        title: mylist2[index].title,
                        icon: mylist2[index].icon,
                        Ricon: mylist2[index].Ricon,
                        color: AppColors.primaryClr,
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),
              Card(
                color: AppColors.whiteClr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomProfileItems(
                    title: 'Log Out',
                    icon: Icons.logout,
                    color: AppColors.redClr,
                    onTap: () {},
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
