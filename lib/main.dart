import 'package:final_project/features/home/Admin/admin_cubit.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_cubit.dart';
import 'package:final_project/features/home/presentation/screens/manage_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const LAMSA());
}

class LAMSA extends StatelessWidget {
  const LAMSA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LAMSA',
      theme: ThemeData(fontFamily: "Manrope"),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AdminCubit(),
          ),
          BlocProvider(
            create: (context) => ProductsCubit()..getProducts(),
          ),
        ],
        child: ManageProductScreen(),
      ),
    );
  }
}
