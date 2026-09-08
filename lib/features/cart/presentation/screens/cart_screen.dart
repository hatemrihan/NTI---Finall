import 'dart:developer';

import 'package:final_project/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:final_project/features/cart/presentation/cubits/cart_state.dart';
import 'package:final_project/features/cart/presentation/screens/cart_empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isLoading = true;
  List productsCart = [];

  double get calculateTotal {
    double total = 0;
    for (var item in productsCart) {
      total += item['basePricePerUnit'] * item['quantity'];
    }
    return total;
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartCubit>(context).getcart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundClr,
        elevation: 0,
        title: Text('MY CART', style: AppStyles.style28ExtraBold),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocConsumer<CartCubit, CartState>(
            listenWhen: (previous, current) {
              return current is removeCartfialure ||
                  current is removeCartsuccess;
            },
            listener: (context, state) {
              if (state is removeCartfialure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('error.....'),
                    backgroundColor: AppColors.primaryClr,
                  ),
                );
              } else if (state is removeCartsuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('success.....'),
                    backgroundColor: AppColors.primaryClr,
                  ),
                );
              }
            },
            buildWhen: (previous, current) {
              return current is getcartloding ||
                  current is getcartempty ||
                  current is getcartscusses;
            },
            builder: (context, state) {
              if (state is getcartloding) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is getcartempty) {
                return const CartEmptyScreen();
              } else if (state is getcartscusses) {
                productsCart = state.productscart;
                if (productsCart.isEmpty) {
                  return const CartEmptyScreen();
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: productsCart.length,
                        itemBuilder: (context, index) {
                          log('productsCart:${productsCart[index]['itemId']}');
                          return Dismissible(
                            key: ValueKey(
                              productsCart[index]['id'] ?? UniqueKey(),
                            ),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: AppColors.redClr,
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20.0),
                              child: const Icon(
                                Icons.delete,
                                color: AppColors.borderSideClr,
                                size: 30,
                              ),
                            ),
                            onDismissed: (direction) {
                              final itemId =
                                  productsCart[index]['itemId'] ??
                                  productsCart[index]['id'];
                              if (itemId != null) {
                                BlocProvider.of<CartCubit>(
                                  context,
                                ).removeCart(productsCart[index]['itemId']);
                              } else {
                                log('error');
                              }
                              setState(() {
                                productsCart.removeAt(index);
                              });
                            },
                            child: Card(
                              color: AppColors.whiteClr,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          productsCart[index]['productCoverUrl'],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            productsCart[index]['productName'],
                                            style: AppStyles.style20ExtraBold,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '\$${productsCart[index]['basePricePerUnit']} ',
                                                style: AppStyles.style14Bold,
                                              ),
                                              const Spacer(),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors
                                                      .bottomBackgroundClr,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        if (productsCart[index]['quantity'] >
                                                            1) {
                                                          setState(() {
                                                            productsCart[index]['quantity']--;
                                                          });
                                                        }
                                                      },
                                                      icon: const Icon(
                                                        Icons.remove,
                                                      ),
                                                    ),
                                                    Text(
                                                      productsCart[index]['quantity']
                                                          .toString(),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          productsCart[index]['quantity']++;
                                                        });
                                                      },
                                                      icon: const Icon(
                                                        Icons.add,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.arrow_back,
                            size: 17,
                            color: AppColors.hintClr,
                          ),
                          Text(
                            'Swipe left to delete item',
                            style: AppStyles.style11Regular,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              obscureText: false,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Enter promo code...',
                                hintStyle: AppStyles.style14Regular.copyWith(
                                  color: AppColors.grayClr,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(width: 0.5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    color: AppColors.primaryClr,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              log('is applied');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryClr,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Apply',
                              style: AppStyles.style14Bold.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Card(
                        color: AppColors.whiteClr,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order Summary',
                                style: AppStyles.style14Bold,
                              ),
                              const SizedBox(height: 10),
                              CustomSummaryItem(
                                title: 'Subtotal',
                                value: '\$${calculateTotal.toStringAsFixed(2)}',
                              ),
                              const CustomSummaryItem(
                                title: 'Shipping',
                                value: 'free',
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  Text('Total', style: AppStyles.style16Bold),
                                  const Spacer(),
                                  Text(
                                    '\$${calculateTotal.toStringAsFixed(2)}',
                                    style: AppStyles.style16Bold.copyWith(
                                      color: AppColors.primaryClr,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          log('you checkout ');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryClr,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Proceed to Checkout',
                          style: AppStyles.style16Bold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const CartEmptyScreen();
            },
          ),
        ),
      ),
    );
  }
}

class CustomSummaryItem extends StatelessWidget {
  const CustomSummaryItem({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: AppStyles.style14Medium.copyWith(color: AppColors.grayClr),
          ),
          const Spacer(),
          Text(value, style: AppStyles.style14SemiBold),
        ],
      ),
    );
  }
}
