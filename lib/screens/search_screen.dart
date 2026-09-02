import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/widgets/bottom_nav_bar.dart';
import 'package:final_project/widgets/custom_search_text_field.dart';
import 'package:final_project/widgets/cutom_gridview_home.dart';
import 'package:final_project/widgets/filter_button.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchTextField(
                  hintText: "search products",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.cancel_outlined),
                ),
                Filter(),

                CutomGridviewHome(),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:BottomNavBar(),

    );
  }
}
