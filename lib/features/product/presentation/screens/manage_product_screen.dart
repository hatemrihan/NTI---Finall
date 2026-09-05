import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;
  final int stock;
  final double price;
  final String imageUrl;
  final String status;

  Product({
    required this.name,
    required this.stock,
    required this.price,
    required this.imageUrl,
    required this.status,
  });
}

final List<Product> products = [
  Product(
    name: 'Chronograph Heritage',
    stock: 12,
    price: 189.00,
    imageUrl: 'https://talabat639.runasp.net/images/products/Frappuccino.jpg',
    status: 'ACTIVE',
  ),
  Product(
    name: 'Veritas Briefcase Satchel',
    stock: 4,
    price: 310.00,
    imageUrl: 'https://talabat639.runasp.net/images/products/Frappuccino.jpg',
    status: 'ACTIVE',
  ),
  Product(
    name: 'Sol Classic Frame',
    stock: 0,
    price: 120.00,
    imageUrl: 'https://talabat639.runasp.net/images/products/Frappuccino.jpg',
    status: 'DRAFT',
  ),
];

class ManageProductScreen extends StatelessWidget {
  const ManageProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundClr,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        centerTitle: true,
        title: Text('MANAGE PRODUCTS', style: AppStyles.style18ExtraBold),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      title: '',
                      hintText: 'Search items...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.filter_list),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Card(
                      elevation: 0,
                      color: AppColors.whiteClr,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: AppColors.grayClr.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                product.imageUrl,
                                width: 75,
                                height: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: AppStyles.style16Bold,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${product.price.toStringAsFixed(2)}',
                                        style: AppStyles.style14Regular
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primaryClr,
                                            ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Stock: ${product.stock}',
                                        style: AppStyles.style14Regular
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  padding: const EdgeInsets.all(8),
                                  icon: const Icon(
                                    Icons.edit_outlined,
                                    size: 20,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  padding: const EdgeInsets.all(8),
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    size: 20,
                                    color: AppColors.redClr,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
