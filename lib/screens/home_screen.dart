import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Noma",
                      style: AppStyles.style28ExtraBold.copyWith(
                        color: AppColors.textClr,
                        fontSize: 24,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_none_outlined,
                        color: AppColors.textClr,
                        size: 24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.wallet_outlined,
                        color: AppColors.textClr,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  title: '',
                  hintText: 'Search products...',
                  prefixIcon: Icon(Icons.search_outlined),
                ),
                SizedBox(height: 24),
                Text(
                  "Categories",
                  style: AppStyles.style16SemiBold.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textClr,
                  ),
                ),
                SizedBox(height: 16),
                Column(
                  children: [
                    SizedBox(
                      height: 106,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,

                                  backgroundImage: NetworkImage(
                                    'https://talabat639.runasp.net/images/products/Frappuccino.jpg',
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text("name",
                                    style: AppStyles.style12SemiBold.copyWith(
                                      color: AppColors.textClr,
                                    )),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Trending Now",
                  style: AppStyles.style16SemiBold.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textClr,
                  ),
                ),
                SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.62,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: AppColors.bottomBackgroundClr,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              child: Image.network(
                                "https://talabat639.runasp.net/images/products/Frappuccino.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Meridian",
                                    style: AppStyles.style11SemiBold
                                        .copyWith(color: AppColors.grayClr)), 
                                Text("Chronograph Heritage",
                                    style: AppStyles.style14SemiBold.copyWith(
                                      color: AppColors.textClr,
                                    )),

                                Row(
                                  children: [
                                    Text("\$189.00",style: AppStyles.style14Bold,),

                                    const Spacer(),

                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints:  BoxConstraints(),
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.star_border_outlined,
                                        color: AppColors.primaryClr,
                                        size: 15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
