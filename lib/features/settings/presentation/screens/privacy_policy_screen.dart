import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  Widget buildSection({required String title, required String content}) {
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
      appBar: AppBar(
        backgroundColor: AppColors.backgroundClr,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 28,
            color: AppColors.textClr,
          ),
        ),
        title: Text("PRIVACY POLICY", style: AppStyles.style20ExtraBold),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

              buildSection(
                title: "1. Data Collection",
                content:
                    "We collect information you provide directly to us when registering for an account, updating your profile, placing an order, subscribing to our curated catalog, or communicating with us. This includes your name, email address, mailing address, and payment information processed through secure token channels.",
              ),
              const SizedBox(height: 20),

              buildSection(
                title: "2. How We Use Your Data",
                content:
                    "LAMSA utilizes your collected data to personalize your browsing experience and fulfill your accessory orders efficiently. We use it to communicate updates regarding your delivery status, notify you of upcoming curio drops, process transaction receipts safely, and enhance overall interface responsive styling.",
              ),
              const SizedBox(height: 20),

              buildSection(
                title: "3. Third Party Sharing",
                content:
                    "We never sell, rent, or trade your personal information to third parties. We share limited logistical data with verified delivery partners and secure payment gateways solely for completing transaction actions. These services operate under strict compliance to uphold NOMA's high privacy standards.",
              ),
              const SizedBox(height: 20),

              buildSection(
                title: "4. Your Rights",
                content:
                    "You retain full control over your private records. You may access, adjust, or completely delete your personal details at any time through our interactive settings panel. If you wish to revoke email circular permission, you may click unsubscribe at the bottom of any luxury bulletin.",
              ),
              const SizedBox(height: 20),

              buildSection(
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
