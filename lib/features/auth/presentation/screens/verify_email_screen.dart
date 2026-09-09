import 'dart:async';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/core/widgets/custom_elevated_buttom.dart';
import 'package:final_project/core/widgets/custom_text_button.dart';
import 'package:final_project/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:final_project/features/auth/presentation/auth_cubit/auth_states.dart';
import 'package:final_project/features/navigation/presentation/screens/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key, this.email = "lamsa***@gmail.com"});

  final String email;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final GlobalKey<FormState> myKey = GlobalKey();
  void _onCodeChanged(String value, int index) {
    if (value.length > 1) {
      final cleanCode = value.replaceAll(RegExp(r'\D'), '');

      if (cleanCode.isNotEmpty) {
        for (int i = 0; i < 6; i++) {
          if (i < cleanCode.length) {
            _controllers[i].text = cleanCode[i];
          }
        }
        final nextIndex = cleanCode.length >= 6 ? 5 : cleanCode.length - 1;
        _focusNodes[nextIndex].requestFocus();
      }
      return;
    }

    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
  }

  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  int _secondsRemaining = 118;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _secondsRemaining = 118;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsRemaining <= 0) {
        t.cancel();
      } else {
        setState(() => _secondsRemaining--);
      }
    });
  }

  String get _formattedTime {
    final m = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final s = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return "$m:$s";
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 50,
      height: 55,
      child: KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent: (event) {
          // عند الضغط على زر Backspace
          if (event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.backspace) {
            if (_controllers[index].text.isEmpty && index > 0) {
              _focusNodes[index - 1].requestFocus();
              _controllers[index - 1].clear();
            }
          }
        },
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.number,
          style: AppStyles.style24Bold.copyWith(
            color: AppColors.textClr,
            height: 1.0,
          ),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            counterText: "",
            filled: true,
            fillColor: AppColors.bottomBackgroundClr,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.primaryClr,
                width: 1.5,
              ),
            ),
          ),
          onChanged: (value) => _onCodeChanged(value, index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundClr,
        body: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is VerifyEmailSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Email Verified Successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavigationBarScreen(),
                  ),
                  (route) => false,
                );
              } else if (state is VerifyEmailFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(24),
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
                        const SizedBox(height: 24),
                        Text(
                          "Verify Your Email",
                          style: AppStyles.style28ExtraBold.copyWith(
                            fontFamily: "Manrope",
                            color: AppColors.textClr,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "We sent a 6-digit verification code to",
                          style: AppStyles.style16Regular.copyWith(
                            color: AppColors.grayClr,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.email,
                          style: AppStyles.style14Bold.copyWith(
                            fontFamily: "Manrope",
                            color: AppColors.textClr,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: List.generate(6, _buildOtpBox),
                        ),
                        const SizedBox(height: 25),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: "Resend code in ",
                              style: AppStyles.style14Regular.copyWith(
                                fontFamily: "Manrope",
                                color: AppColors.grayClr,
                              ),
                              children: [
                                TextSpan(
                                  text: _formattedTime,
                                  style: AppStyles.style14Bold.copyWith(
                                    fontFamily: "Manrope",
                                    color: AppColors.textClr,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: CustomTextButton(
                            text: state is ResendOtpLoadingState
                                ? "Sending..."
                                : "Resend Code",
                            onPressed: _secondsRemaining == 0
                                ? () {
                                    _startTimer();

                                    context.read<AuthCubit>().resendOtp(
                                      email: widget.email,
                                    );
                                  }
                                : null,
                            textClr: _secondsRemaining == 0
                                ? AppColors.primaryClr
                                : AppColors.grayClr,
                          ),
                        ),
                        const SizedBox(height: 32),
                        CustomElevatedButton(
                          text: state is VerifyEmailLoadingState
                              ? "Verifying..."
                              : "Verify",
                          onPressed: () {
                            final otpCode = _controllers
                                .map((c) => c.text)
                                .join();

                            if (otpCode.length == 6) {
                              context.read<AuthCubit>().verifyEmail(
                                otpCode: otpCode,
                                email: widget.email,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please enter full 6-digit code',
                                  ),
                                  backgroundColor: Colors.orange,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
