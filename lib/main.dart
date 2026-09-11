import 'package:final_project/core/Token/token.dart';
import 'package:final_project/features/home/Admin/admin_cubit.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_cubit.dart';
import 'package:final_project/features/home/presentation/screens/home_screen.dart';
import 'package:final_project/features/splash/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadToken();

  runApp(const LAMSA());
}

class LAMSA extends StatelessWidget {
  const LAMSA({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AdminCubit()),
        BlocProvider(create: (context) => ProductsCubit()..getProducts()),
      ],
      child: MaterialApp(
        title: 'LAMSA',
        theme: ThemeData(fontFamily: "Manrope"),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
