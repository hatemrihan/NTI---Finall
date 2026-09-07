import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_cubit.dart';
import 'package:final_project/features/home/presentation/widgets/cutom_gridview_home.dart';
import 'package:final_project/features/home/presentation/widgets/custom_container_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getProducts(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundClr,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundClr,
          centerTitle: true,
          title: Text('Category Products', style: AppStyles.style18ExtraBold),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Showing products',
                        style: AppStyles.style13Regular.copyWith(
                          color: AppColors.grayClr,
                        ),
                      ),
                      const Spacer(),
                      const SettingsContainer(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 8),
                              Text(
                                'Sort & Filter',
                                style: AppStyles.style13Regular,
                              ),
                              SizedBox(width: 8),
                              IconButton(
                                onPressed: null,
                                icon: Icon(Icons.filter_list),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const CutomGridviewHome(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
