import 'dart:async';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/core/widgets/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:final_project/features/auth/presentation/screens/forgot%20_password_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key, this.email = "lamsa***@gmail.com"});

  final String email;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final GlobalKey<FormState> myKey = GlobalKey();

  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

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
      width: 64,
      height: 64,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: AppStyles.style24Bold.copyWith(color: AppColors.textClr),
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
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            _focusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: SafeArea(
        child: Padding(
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
                    "We sent a 4-digit verification code to",
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
                    spacing: 20,
                    children: List.generate(4, _buildOtpBox),
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
                    child: GestureDetector(
                      onTap: _secondsRemaining == 0 ? _startTimer : null,
                      child: Text(
                        "Resend Code",
                        style: AppStyles.style14SemiBold.copyWith(
                          fontFamily: "Manrope",
                          color: _secondsRemaining == 0
                              ? AppColors.primaryClr
                              : AppColors.grayClr,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  CustomElevatedButton(
                    text: "Verify",
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    ),
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
