import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:final_project/widgets/customArrowBack.dart';
import 'package:final_project/widgets/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';

class EmailverificationScreen extends StatefulWidget {
  final String userEmail;

  const EmailverificationScreen({
    super.key,
    this.userEmail = "sopaaaaaa@domain.com", // Pass the email here
  });

  @override
  State<EmailverificationScreen> createState() =>
      _EmailverificationScreenState();
}

class _EmailverificationScreenState extends State<EmailverificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  // Function to mask email according to your logic
  String _maskEmail(String email) {
    if (email.isEmpty || !email.contains('@')) return email;
    List<String> parts = email.split('@');
    String username = parts[0];
    String domain = parts[1];

    if (username.length <= 3) {
      return '$username@$domain';
    }

    String prefix = username.substring(0, 3);
    int remainingLength = username.length - 3;
    String stars = '*' * remainingLength;

    return '$prefix$stars@$domain';
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const customArrowBack(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Title
              Text(
                "Verify Your Email",
                style: AppStyles.style28Bold.copyWith(
                  color: const Color(0xFF1E2522),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // Subtitle with Masked Email
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6E7471),
                    height: 1.4,
                  ),
                  children: [
                    const TextSpan(
                      text: "We sent a 4-digit verification code to\n",
                    ),
                    TextSpan(
                      text: _maskEmail(widget.userEmail),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E2522),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // 4-Digit Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: 64,
                    height: 64,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E2522),
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Color(0xFF233D31),
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Color(0xFF233D31),
                            width: 2.0,
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
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Timer & Resend Text
              Center(
                child: Column(
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6E7471),
                        ),
                        children: [
                          TextSpan(text: "Resend code in "),
                          TextSpan(
                            text: "01:58",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E2522),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        // Resend logic
                      },
                      child: Text(
                        "Resend Code",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFB5ADA4),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Verify Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: CustomElevatedButton(text: 'Verify', onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
