import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/home/Admin/admin_cubit.dart';
import 'package:final_project/features/home/Admin/admin_product_states.dart';
import 'package:final_project/features/home/data/models/product_model.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_cubit.dart';
import 'package:final_project/features/home/presentation/screens/manage_product_screen.dart';
import 'package:final_project/features/home/presentation/widgets/custom_category_dropdown.dart';
import 'package:final_project/features/home/presentation/widgets/custom_image_upload_container.dart';
import 'package:final_project/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductScreen extends StatefulWidget {
  final ProductModel? productToEdit;
  const AddProductScreen({super.key, this.productToEdit});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _coverPictureUrlController =
      TextEditingController();

  bool get _isEditing => widget.productToEdit != null;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _coverPictureUrlController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.productToEdit != null) {
      _nameController.text = widget.productToEdit!.name;
      _priceController.text = widget.productToEdit!.price.toString();
      _descriptionController.text = widget.productToEdit!.description;
      _stockController.text = widget.productToEdit!.stock.toString();
      _coverPictureUrlController.text = widget.productToEdit!.coverPictureUrl;
    }
  }

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    final double? parsedPrice = double.tryParse(_priceController.text);
    if (parsedPrice == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid price'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ProductModel product = ProductModel(
      id: "153cdea7-c2d7-4fa7-8dfb-d64feb7a88a0",
      name: _nameController.text,
      description: _descriptionController.text,
      price: parsedPrice,
      coverPictureUrl: _coverPictureUrlController.text.isNotEmpty
          ? _coverPictureUrlController.text
          : "https://images.unsplash.com/photo-1617038220319-276d3cfab638?w=500&auto=format&fit=crop&q=60",
      stock: int.tryParse(_stockController.text) ?? 0,
      categoryIds: ["773b3cc6-1d35-4225-824d-07cb6bd81f8a"],
      sellerId: "88e0621b-d148-4772-35ef-08df0daa4f93",
      nameArabic: "تيست",
      color: "red",
      descriptionArabic: "تيستت",
      productPictureUrls: [
        "https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/8e3f5c6b-4d7a-4f9e-8c2e-1f5b6c3e5f5a/air-max-270-mens-shoes-KkLcGR.png",
      ],
    );

    if (!_isEditing) {
      context.read<AdminCubit>().addProduct(product);
    } else {
      context.read<AdminCubit>().updateProduct(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
            backgroundColor: AppColors.backgroundClr,
            appBar: AppBar(
              backgroundColor: AppColors.backgroundClr,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.textClr,
                ),
              ),
              centerTitle: true,
              title: Text(
                _isEditing ? 'EDIT PRODUCT' : 'ADD PRODUCT',
                style: AppStyles.style18ExtraBold,
              ),
            ),
            body: SingleChildScrollView(
              child: BlocConsumer<AdminCubit, AdminProductStates>(
                listener: (context, state) {
                  if (state is AdminAddProductSuccessState ||
                      state is AdminUpdateProductSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state is AdminAddProductSuccessState
                            ? 'Product added successfully'
                            : 'Product updated successfully'),
                        backgroundColor: Colors.green,
                      ),
                    );

                    if (_isEditing) {
                      Navigator.pop(context);
                    } else {
                      final adminCubit = context.read<AdminCubit>();
                      final productsCubit = context.read<ProductsCubit>();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiBlocProvider(
                            providers: [
                              BlocProvider.value(value: adminCubit),
                              BlocProvider.value(value: productsCubit),
                            ],
                            child: const ManageProductScreen(),
                          ),
                        ),
                      );
                    }
                  } else if (state is AdminAddProductFailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  final bool isLoading =
                      state is AdminAddProductLoadingState ||
                          state is AdminUpdateProductLoadingState;

                  return SafeArea(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BuildImageUploadContainer(
                                onImageSelected: (String url) {
                                  setState(() {
                                    _coverPictureUrlController.text = url;
                                  });
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                title: 'PRODUCT NAME',
                                hintText: 'e.g. Heirloom Gold Bracelet',
                                controller: _nameController,
                                validator: (value) =>
                                    (value == null || value.trim().isEmpty)
                                        ? 'Product name is required'
                                        : null,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                title: 'DESCRIPTION',
                                hintText: 'Write product narrative and specs...',
                                keyboardType: TextInputType.multiline,
                                maxLines: 4,
                                controller: _descriptionController,
                              ),
                              const SizedBox(height: 20),
                              const BuildCategoryDropdown(),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      title: 'PRICE (\$)',
                                      hintText: '120.00',
                                      controller: _priceController,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Required';
                                        }
                                        if (double.tryParse(value) == null) {
                                          return 'Invalid price';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: CustomTextField(
                                      title: 'STOCK QUANTITY',
                                      hintText: '25',
                                      controller: _stockController,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Required';
                                        }
                                        if (int.tryParse(value) == null) {
                                          return 'Invalid stock';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed:
                                      isLoading ? null : () => _submit(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryClr,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: isLoading
                                      ? const CircularProgressIndicator(
                                          color: AppColors.whiteClr,
                                        )
                                      : Text(
                                          _isEditing
                                              ? 'Update Product'
                                              : 'Publish Product',
                                          style: AppStyles.style16Bold.copyWith(
                                            color: AppColors.whiteClr,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
    
  }
}