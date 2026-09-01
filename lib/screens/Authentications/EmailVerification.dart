import 'dart:async';
import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:final_project/widgets/customArrowBack.dart';
import 'package:final_project/widgets/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Custom files from Authentications folder
import 'package:final_project/screens/Authentications/SharableCode/auth_scaffold.dart';
import 'package:final_project/screens/Authentications/ForgotPassword.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key, this.email = "sop***@domain.com"});

  final String email;

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
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
        style: AppStyles.style24Bold.copyWith(
          fontFamily: "Manrope",
          color: AppColors.textClr,
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
    // Custom file: auth_scaffold.dart
    return AuthScaffold(
      scrollable: false,
      children: [
        // ── Back button
        const Customarrowback(),
        const SizedBox(height: 24),

        // ── Title
        Text(
          "Verify Your Email",
          style: AppStyles.style28Bold.copyWith(
            fontFamily: "Manrope",
            color: AppColors.textClr,
          ),
        ),
        const SizedBox(height: 8),

        // ── Subtitle with bold email
        Text.rich(
          TextSpan(
            text: "We sent a 4-digit verification code to\n",
            style: AppStyles.style14Regular.copyWith(
              fontFamily: "Manrope",
              color: AppColors.grayClr,
            ),
            children: [
              TextSpan(
                text: widget.email,
                style: AppStyles.style14Bold.copyWith(
                  fontFamily: "Manrope",
                  color: AppColors.textClr,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // ── OTP boxes
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: List.generate(4, _buildOtpBox),
        ),
        const SizedBox(height: 20),

        // ── Resend timer
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
        const SizedBox(height: 6),

        // ── Resend link
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

        // ── Verify button
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
    );
  }
}
