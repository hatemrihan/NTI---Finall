import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CustomCategoriesHome extends StatefulWidget {
  const CustomCategoriesHome({super.key, this.onTabChange});
  final ValueChanged<int>? onTabChange;

  @override
  State<CustomCategoriesHome> createState() => _CustomCategoriesHomeState();
}

class _CustomCategoriesHomeState extends State<CustomCategoriesHome> {
  List categories = [];
  final dio = Dio();

  Future<void> getcategories() async {
    final Response response = await dio.get(
      "https://accessories-eshop.runasp.net/api/categories",
      options: Options(
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI3ZjgyYWJjNS1hYWJjLTQ2MTEtMzVhYy0wOGRmMGMzZjg1NmQiLCJqdGkiOiJiM2E4NzRkNi0xODk3LTRiNmQtOWVlNy0yN2E1YjM1Mzk5NWQiLCJlbWFpbCI6Im1vc3RhZmFzYWFkaGFmZXo3QGdtYWlsLmNvbSIsIm5hbWUiOiJzdHJpbmcgc3RyaW5nIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg4OTQ5MjgzLCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.an0qG510_S2a07twkgygxDy3Mnw-fokLTM8deKEWTao",
        },
      ),
    );
    categories = response.data["categories"];
    setState(() {});
    log(categories.toString());
  }

  @override
  void initState() {
    super.initState();
    getcategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 105,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        widget.onTabChange?.call(1);
                      },
                      child: CircleAvatar(
                        radius: 40,
                        child: ClipOval(
                          child: Image.network(
                            categories[index]["coverPictureUrl"] ?? "",
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.image_not_supported_outlined,
                                size: 35,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      categories[index]["name"],
                      style: AppStyles.style12Medium.copyWith(
                        color: AppColors.textClr,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
