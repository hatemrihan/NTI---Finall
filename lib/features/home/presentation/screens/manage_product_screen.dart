import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/core/widgets/custom_text_field.dart';
import 'package:final_project/features/home/Admin/admin_cubit.dart';
import 'package:final_project/features/home/Admin/admin_product_states.dart';
import 'package:final_project/features/home/data/models/product_model.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_cubit.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_states.dart';
import 'package:final_project/features/home/presentation/screens/add_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageProductScreen extends StatefulWidget {
  const ManageProductScreen({super.key});

  @override
  State<ManageProductScreen> createState() => _ManageProductScreenState();
}

class _ManageProductScreenState extends State<ManageProductScreen> {
  List<ProductModel> _products = [];

  ProductModel? _pendingDeleteProduct;
  int? _pendingDeleteIndex;

  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  Future<void> _confirmDelete(BuildContext context, ProductModel product) {
    return showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete product?'),
        content: Text('Are you sure you want to delete "${product.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              _deleteImmediately(context, product);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _deleteImmediately(BuildContext context, ProductModel product) {
    final int index = _products.indexWhere((p) => p.id == product.id);
    if (index == -1) return;

    // Remove the card from the UI right away.
    setState(() {
      _pendingDeleteProduct = product;
      _pendingDeleteIndex = index;
      _products.removeAt(index);
    });

    context.read<AdminCubit>().deleteProduct(product.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundClr,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('MANAGE PRODUCTS', style: AppStyles.style18ExtraBold),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
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
                child: MultiBlocListener(
                  listeners: [
                    // ProductsCubit owns the list itself.
                    BlocListener<ProductsCubit, ProductsState>(
                      listener: (context, state) {
                        if (state is GetProductsSuccessState) {
                          setState(() {
                            _products = state.products;
                          });
                        } else if (state is GetProductsFailureState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.error ?? 'Failed to load products'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    ),
                    BlocListener<AdminCubit, AdminProductStates>(
                      listener: (context, state) {
                        if (state is AdminDeleteProductSuccessState) {
                          // Already removed from the UI — just confirm it.
                          _pendingDeleteProduct = null;
                          _pendingDeleteIndex = null;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                              backgroundColor: Colors.green,
                            ),
                          );
                        } else if (state is AdminDeleteProductFailureState) {
                          // Roll back: put the card back where it was.
                          if (_pendingDeleteProduct != null &&
                              _pendingDeleteIndex != null) {
                            setState(() {
                              final insertAt = _pendingDeleteIndex!
                                  .clamp(0, _products.length);
                              _products.insert(
                                insertAt,
                                _pendingDeleteProduct!,
                              );
                              _pendingDeleteProduct = null;
                              _pendingDeleteIndex = null;
                            });
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.error),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else if (state is AdminAddProductSuccessState ||
                            state is AdminUpdateProductSuccessState) {
                          context.read<ProductsCubit>().getProducts();
                        }
                      },
                    ),
                  ],
                  child: BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, productsState) {
                      final bool isLoading =
                          productsState is GetProductsLoadingState;

                      if (isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (_products.isEmpty) {
                        return Center(
                          child: Text(
                            'No products yet',
                            style: AppStyles.style14Regular
                                .copyWith(color: Colors.grey),
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: _products.length,
                        itemBuilder: (context, index) {
                          final product = _products[index];
                          return Card(
                                elevation: 0,
                                color: AppColors.whiteClr,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  side: BorderSide(
                                    color: AppColors.grayClr
                                        .withValues(alpha: 0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12),
                                        child: Image.network(
                                          product.coverPictureUrl,
                                          width: 75,
                                          height: 75,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stack) =>
                                                  Container(
                                            width: 75,
                                            height: 75,
                                            color: AppColors.grayClr
                                                .withValues(alpha: 0.2),
                                            child:
                                                const Icon(Icons.broken_image),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                  style: AppStyles
                                                      .style14Regular
                                                      .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color:
                                                        AppColors.primaryClr,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  'Stock: ${product.stock}',
                                                  style: AppStyles
                                                      .style14Regular
                                                      .copyWith(
                                                          color: Colors.grey),
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
                                            onPressed: () {
                                              final adminCubit =
                                                  context.read<AdminCubit>();
                                              final productsCubit = context
                                                  .read<ProductsCubit>();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MultiBlocProvider(
                                                    providers: [
                                                      BlocProvider.value(
                                                        value: adminCubit,
                                                      ),
                                                      BlocProvider.value(
                                                        value: productsCubit,
                                                      ),
                                                    ],
                                                    child: AddProductScreen(
                                                      productToEdit: product,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          IconButton(
                                            padding: const EdgeInsets.all(8),
                                            icon: const Icon(
                                              Icons.delete_outline,
                                              size: 20,
                                              color: AppColors.redClr,
                                            ),
                                            onPressed: () => _confirmDelete(
                                              context,
                                              product,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
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