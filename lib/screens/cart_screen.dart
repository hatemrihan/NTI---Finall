import 'dart:developer';

import 'package:final_project/screens/cart_empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List mylist = [];
  bool isLoading = true;

  Future<void> getproduct_cart() async {
    try {
      setState(() {
        isLoading = true;
      });
      final Dio dio = Dio();
      final Response response = await dio.get(
        'https://accessories-eshop.runasp.net/api/cart',
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhMDY5MmE4NS00OGQyLTQ2NzUtY2MwMC0wOGRmMDY5Y2ExNDMiLCJqdGkiOiI5OWE4ZTQ1Ny1mYWU2LTQ4YzctOTlmNC1mYTBjNmIzYzgxMmIiLCJlbWFpbCI6ImFsc2FpZGE5NThAZ21haWwuY29tIiwibmFtZSI6IkFobWVkIEVsaGFkZGFkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg4MzI4MzYyLCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.c4Mg92qt0rzOrbA2MzKmtR10VzF24LvQrLC0jfTjbEM',
          },
        ),
      );
      mylist = response.data['cartItems'] ?? [];
    } on DioException catch (e) {
      log(e.response?.data ?? e.message ?? 'Unknown error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  double get calculateTotal {
    double total = 0;
    for (var item in mylist) {
      total += item['basePricePerUnit'] * item['quantity'];
    }
    return total;
  }

  @override
  void initState() {
    getproduct_cart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundClr,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text('MY CART', style: AppStyles.style27ExtraBold),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : mylist.isEmpty
          ? CartEmptyScreen()
          : _buildFullCartUI(),
    );
  }

  Widget _buildFullCartUI() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: mylist.length,
                itemBuilder: (context, index) {
                  return Card(
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
                                mylist[index]['productCoverUrl'],
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mylist[index]['productName'],
                                  style: AppStyles.style20ExtraBold,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$${mylist[index]['basePricePerUnit']} ',
                                      style: AppStyles.style14Bold,
                                    ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.bottomBackgroundClr,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              if (mylist[index]['quantity'] >
                                                  1) {
                                                mylist[index]['quantity']--;
                                                setState(() {});
                                              }
                                            },
                                            icon: const Icon(Icons.remove),
                                          ),
                                          Text(
                                            mylist[index]['quantity']
                                                .toString(),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              mylist[index]['quantity']++;
                                              setState(() {});
                                            },
                                            icon: const Icon(Icons.add),
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
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back, size: 17, color: AppColors.hintClr),
                  Text('Swipe left to delete item', style: AppStyles.style11),
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
                        hintStyle: AppStyles.style14.copyWith(
                          color: AppColors.grayClr,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
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
                      Text('Order Summary', style: AppStyles.style14Bold),
                      const SizedBox(height: 10),
                      CustomSummaryItem(
                        title: 'Subtotal',
                        value: '\$${calculateTotal.toStringAsFixed(2)}',
                      ),
                      const CustomSummaryItem(title: 'Shipping', value: 'free'),
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
                  style: AppStyles.style16Bold.copyWith(color: Colors.white),
                ),
              ),
            ],
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
