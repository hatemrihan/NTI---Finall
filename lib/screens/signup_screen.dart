import 'package:final_project/app_colors.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isVisiable = true;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: SafeArea(
          child:Padding(padding: EdgeInsets.all(24)
          ,
          child: SingleChildScrollView(
child: Column(
  spacing: 10,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    
  ],
),
          ),),

      ),
    );
  }
}