import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrivacyPolicy(),
    ),
  );
}

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      appBar: AppBar(
      backgroundColor: AppColors.backgroundClr,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
        title: Text("Privacy Policy", style: AppStyles.style20ExtraBold,),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Last Updated: October 2026", style: AppStyles.style13Bold.copyWith(color: AppColors.grayClr),),
                Text("At NOMA, your trust is our ultimate accessory. This policy describes how we collect, safeguard, and gracefully handle your personal information to ensure a secure, curated retail experience.Last Updated: October 2026",
                style: AppStyles.style14Regular.copyWith(color: AppColors.hintClr),
                maxLines: 3,),
                Divider(),
                Text("1. Data Collection", style: AppStyles.style16Bold,),
                Text("We collect information you provide directly to us when registering for an account, updating your profile, placing an order, subscribing to our curated catalog, or communicating with us. This includes your name, email address, mailing address, and payment information processed through secure token channels.",
                style: AppStyles.style14Regular.copyWith(color: AppColors.hintClr),
                maxLines: 7,
                ),
                Text("2. How We Use Your Data", style: AppStyles.style16Bold,),
                Text("NOMA utilizes your collected data to personalize your browsing experience and fulfill your accessory orders efficiently. We use it to communicate updates regarding your delivery status, notify you of upcoming curio drops, process transaction receipts safely, and enhance overall interface responsive styling.",
                style: AppStyles.style14Regular.copyWith(color: AppColors.hintClr),
                maxLines: 7,
                ),
                Text("3. Third Party Sharing", style: AppStyles.style16Bold,),
                Text("We never sell, rent, or trade your personal information to third parties. We share limited logistical data with verified delivery partners and secure payment gateways solely for completing transaction actions. These services operate under strict compliance to uphold NOMA's high privacy standards.",
                style: AppStyles.style14Regular.copyWith(color: AppColors.hintClr),
                maxLines: 7,
                ),
                Text("4. Your Rights", style: AppStyles.style16Bold,),
                Text("You retain full control over your private records. You may access, adjust, or completely delete your personal details at any time through our interactive settings panel. If you wish to revoke email circular permission, you may click unsubscribe at the bottom of any luxury bulletin.",
                style: AppStyles.style14Regular.copyWith(color: AppColors.hintClr),
                maxLines: 7,
                ),
                Text("5. Contact Us", style: AppStyles.style16Bold,),
                Text("Should you have queries about these protection standards or wish to request direct access to your data history, please reach out to our privacy curators at support@noma-accessories.com.",
                style: AppStyles.style14Regular.copyWith(color: AppColors.hintClr),
                maxLines: 7,
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}