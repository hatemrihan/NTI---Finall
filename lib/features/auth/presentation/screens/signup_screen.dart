import 'dart:developer';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:final_project/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:final_project/features/auth/presentation/auth_cubit/auth_states.dart';
import 'package:final_project/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:final_project/core/widgets/custom_elevated_buttom.dart';
import 'package:final_project/core/widgets/custom_text_button.dart';
import 'package:final_project/core/widgets/custom_text_field.dart';
import 'package:final_project/core/utils/validators.dart';
import 'package:final_project/features/auth/presentation/widgets/custom_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> myKey = GlobalKey();
  final TextEditingController firstNameCtl = TextEditingController();
  final TextEditingController lastNameCtl = TextEditingController();
  final TextEditingController emailCtl = TextEditingController();
  final TextEditingController passwordCtl = TextEditingController();
  final TextEditingController confirmPasswordCtl = TextEditingController();
  final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource();
  bool isVisiablePassword = true;
  bool isVisiableConfirmPassword = true;

  bool isChecked = false;
  @override
  void dispose() {
    super.dispose();
    emailCtl.dispose();
    passwordCtl.dispose();
    confirmPasswordCtl.dispose();
    firstNameCtl.dispose();
    lastNameCtl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              key: myKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.maybePop(context),
                    padding: EdgeInsets.zero,
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.bottomBackgroundClr,
                      side: BorderSide(color: AppColors.grayClr),
                    ),
                    icon: const Icon(Icons.arrow_back, size: 20),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Create Account',
                    style: AppStyles.style28ExtraBold.copyWith(
                      color: AppColors.textClr,
                      fontFamily: "Manrope",
                      height: 1.1,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Join LAMSA today for exclusive collections.',
                    style: AppStyles.style14Regular.copyWith(
                      color: AppColors.grayClr,
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          prefixIcon: Icon(Icons.person_2_outlined),
                          controller: firstNameCtl,
                          title: 'First Name',
                          hintText: 'Your first name',
                          validator: (firstName) {
                            return Validator.validateUserName(firstName!);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomTextField(
                          prefixIcon: Icon(Icons.person_2_outlined),
                          controller: lastNameCtl,
                          title: 'Last Name',
                          hintText: 'Your last name',
                          validator: (lastName) {
                            return Validator.validateUserName(lastName!);
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  CustomTextField(
                    prefixIcon: Icon(Icons.mail_outline),
                    controller: emailCtl,
                    title: 'Email Address',
                    hintText: 'Enter your email',
                    validator: (email) {
                      return Validator.validateEmail(email!);
                    },
                  ),
                  SizedBox(height: 16),
                  CustomPasswordField(
                    controller: passwordCtl,
                    title: 'Password',
                    hintText: 'Please enter your password',
                    validator: (password) {
                      return Validator.validatePassword(password!);
                    },
                    obscureText: isVisiablePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisiablePassword = !isVisiablePassword;
                        });
                      },
                      icon: Icon(
                        isVisiablePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.grayClr,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  CustomPasswordField(
                    controller: confirmPasswordCtl,
                    title: 'Confirm Password',
                    hintText: 'Confirm your password',
                    obscureText: isVisiableConfirmPassword,
                    validator: (confirmPassword) {
                      return Validator.validateConfirmPassword(
                        passwordCtl.text,
                        confirmPassword!,
                      );
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisiableConfirmPassword =
                              !isVisiableConfirmPassword;
                        });
                      },
                      icon: Icon(
                        isVisiableConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.grayClr,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  Row(
                    children: [
                      Checkbox(
                        visualDensity: VisualDensity(
                          horizontal: -4,
                          vertical: -2,
                        ),
                        activeColor: AppColors.primaryClr,
                        value: isChecked,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onChanged: (newVal) {
                          log(newVal.toString());
                          isChecked = newVal!;
                          setState(() {});
                        },
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'I agree to the ',
                              style: AppStyles.style14Regular.copyWith(
                                color: AppColors.grayClr,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms of Service',
                              style: AppStyles.style14Bold.copyWith(
                                color: AppColors.textClr,
                              ),
                            ),
                            TextSpan(
                              text: ' & ',
                              style: AppStyles.style14Regular.copyWith(
                                color: AppColors.grayClr,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: AppStyles.style14Bold.copyWith(
                                color: AppColors.textClr,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  BlocConsumer<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is SignUpLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return CustomElevatedButton(
                          text: 'Create Account',
                          onPressed: isChecked
                              ? () async {
                                  if (myKey.currentState!.validate()) {
                                    await context.read<AuthCubit>().signup(
                                      email: emailCtl.text,
                                      password: passwordCtl.text,
                                      firstName: firstNameCtl.text,
                                      lastName: lastNameCtl.text,
                                    );
                                  }
                                }
                              : null,
                        );
                      }
                    },
                    listener: (context, state) {
                      if (state is SignUpSuccessState) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifyEmailScreen(),
                          ),
                        );
                      } else if (state is SignUpFailureState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Sign up failed. Please try again.'),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: AppStyles.style14Regular.copyWith(
                          color: AppColors.grayClr,
                        ),
                      ),
                      CustomTextButton(
                        text: 'Login',
                        onPressed: () => Navigator.pop(context),
                        textClr: AppColors.primaryClr,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
