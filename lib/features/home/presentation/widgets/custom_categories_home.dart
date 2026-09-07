import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_cubit.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCategoriesHome extends StatelessWidget {
  const CustomCategoriesHome({super.key, this.onTabChange});
  final ValueChanged<int>? onTabChange;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) =>
          current is GetCategoriesLoadingState ||
          current is GetCategoriesSuccessState ||
          current is GetCategoriesFailureState ||
          current is ProductsInitialState,
      builder: (context, state) {
        final cubit = context.read<ProductsCubit>();

        if (cubit.isCategoriesLoading ||
            (state is ProductsInitialState && cubit.categories.isEmpty) ||
            (state is GetCategoriesLoadingState)) {
          return const SizedBox(
            height: 105,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is GetCategoriesFailureState && cubit.categories.isEmpty) {
          return SizedBox(
            height: 105,
            child: Center(
              child: Text(
                state.error ?? "Failed to load categories",
                style: AppStyles.style12Medium.copyWith(color: Colors.red),
              ),
            ),
          );
        }

        if (cubit.categories.isEmpty) {
          return const SizedBox(
            height: 105,
            child: Center(child: Text("No categories available")),
          );
        }

        return Column(
          children: [
            SizedBox(
              height: 105,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: cubit.categories.length,
                itemBuilder: (context, index) {
                  final category = cubit.categories[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            onTabChange?.call(1);
                          },
                          child: CircleAvatar(
                            radius: 40,
                            child: ClipOval(
                              child: Image.network(
                                category["coverPictureUrl"] ?? "",
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
                          category["name"] ?? "",
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
      },
    );
  }
}
