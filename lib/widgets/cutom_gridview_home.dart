import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:flutter/material.dart';

class CutomGridviewHome extends StatefulWidget {
  const CutomGridviewHome({super.key});

  @override
  State<CutomGridviewHome> createState() => _CutomGridviewHomeState();
}

class _CutomGridviewHomeState extends State<CutomGridviewHome> {
  List categories = [];
  final dio = Dio();

  Future<void> getcategories() async {
    log(" get categories");
    final Response response = await dio.get(
      "https://accessories-eshop.runasp.net/api/products",
    );
    categories = response.data["items"];
    setState(() {
      
    });
    log(categories.toString());
  }

  @override
  initState() {
    super.initState();
    getcategories();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
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
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    width: double.infinity,
                    categories[index]["coverPictureUrl"],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 2, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categories[index]["name"],
                      style: AppStyles.style11SemiBold.copyWith(
                        color: AppColors.grayClr,
                      ),
                    ),
                    Text(
                      categories[index]["description"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.style14SemiBold.copyWith(
                        color: AppColors.textClr,
                      ),
                    ),

                    Row(
                      children: [
                        Text(
                          "\$${categories[index]["price"].toString()}"
                          , style: AppStyles.style14Bold),

                        const Spacer(),
                        IconButton(
                          color: AppColors.primaryClr,
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outlined),
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
    );
  }
}
