import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/home/presentation/screens/product_model.dart';
import 'package:final_project/features/home/presentation/screens/product_screen.dart';
import 'package:flutter/material.dart';

class CutomGridviewHome extends StatefulWidget {
  const CutomGridviewHome({super.key});

  @override
  State<CutomGridviewHome> createState() => _CutomGridviewHomeState();
}

class _CutomGridviewHomeState extends State<CutomGridviewHome> {
  List<ProductModel> products = [];
  final dio = Dio();

  Future<void> getProducts() async {
    log(" get products");
    final Response response = await dio.get(
      "https://accessories-eshop.runasp.net/api/products",
    );
    for (var element in response.data['items']) {
    final ProductModel model = ProductModel.fromJson(element);
    products.add(model);
    }
    setState(() {});
    log(products.toString());
  }

  @override
  initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(product: products[index],),
              ),
            );
          },
          child: Card(
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
                      products[index].coverPictureUrl,
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
                        products[index].name,
                        style: AppStyles.style11Bold.copyWith(
                          color: AppColors.grayClr,
                        ),
                      ),
                      Text(
                        products[index].description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.style14SemiBold.copyWith(
                          color: AppColors.textClr,
                        ),
                      ),
          
                      Row(
                        children: [
                          Text(
                            "\$${products[index].price.toString()}"
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
          ),
        );
      },
    );
  }
}
