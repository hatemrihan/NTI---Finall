import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:final_project/core/widgets/custom_search_text_field.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_cubit.dart';
import 'package:final_project/features/home/presentation/widgets/cutom_gridview_home.dart';
import 'package:final_project/features/home/presentation/widgets/filter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getProducts(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Search Products", style: AppStyles.style22Bold),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new, size: 25),
            ),
            backgroundColor: AppColors.backgroundClr,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSearchTextField(
                      hintText: "search products",
                      controller: _searchController,
                      onChanged: (query) {
                        context.read<ProductsCubit>().searchProducts(query);
                      },
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _searchController.clear();
                          context.read<ProductsCubit>().searchProducts('');
                        },
                        icon: const Icon(Icons.cancel_outlined),
                      ),
                    ),
                    Filter(),
                    CutomGridviewHome(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
