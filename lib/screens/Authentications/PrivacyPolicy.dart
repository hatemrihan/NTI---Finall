import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  Widget _buildSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.style16Bold.copyWith(
            fontFamily: "Manrope",
            color: AppColors.textClr,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: AppStyles.style14Regular.copyWith(
            fontFamily: "Manrope",
            color: AppColors.grayClr,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header Row
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.chevron_left,
                      size: 28,
                      color: AppColors.textClr,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "PRIVACY POLICY",
                    style: AppStyles.style20ExtraBold.copyWith(
                      fontFamily: "Manrope",
                      color: AppColors.textClr,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // ── Last updated & Intro
              Text(
                "LAST UPDATED: OCTOBER 2026",
                style: AppStyles.style12Medium.copyWith(
                  fontFamily: "Manrope",
                  color: AppColors.grayClr,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "At LAMSA, your trust is our ultimate accessory. This policy describes how we collect, safeguard, and gracefully handle your personal information to ensure a secure, curated retail experience.",
                style: AppStyles.style14Regular.copyWith(
                  fontFamily: "Manrope",
                  color: AppColors.grayClr,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              Divider(color: AppColors.borderSideClr.withValues(alpha: 0.6)),
              const SizedBox(height: 16),

              // ── Sections
              _buildSection(
                title: "1. Data Collection",
                content:
                    "We collect information you provide directly to us when registering for an account, updating your profile, placing an order, subscribing to our curated catalog, or communicating with us. This includes your name, email address, mailing address, and payment information processed through secure token channels.",
              ),
              const SizedBox(height: 20),

              _buildSection(
                title: "2. How We Use Your Data",
                content:
                    "LAMSA utilizes your collected data to personalize your browsing experience and fulfill your accessory orders efficiently. We use it to communicate updates regarding your delivery status, notify you of upcoming curio drops, process transaction receipts safely, and enhance overall interface responsive styling.",
              ),
              const SizedBox(height: 20),

              _buildSection(
                title: "3. Third Party Sharing",
                content:
                    "We never sell, rent, or trade your personal information to third parties. We share limited logistical data with verified delivery partners and secure payment gateways solely for completing transaction actions. These services operate under strict compliance to uphold NOMA's high privacy standards.",
              ),
              const SizedBox(height: 20),

              _buildSection(
                title: "4. Your Rights",
                content:
                    "You retain full control over your private records. You may access, adjust, or completely delete your personal details at any time through our interactive settings panel. If you wish to revoke email circular permission, you may click unsubscribe at the bottom of any luxury bulletin.",
              ),
              const SizedBox(height: 20),

              _buildSection(
                title: "5. Contact Us",
                content:
                    "Should you have queries about these protection standards or wish to request direct access to your data history, please reach out to our privacy curators at support@noma-accessories.com.",
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
