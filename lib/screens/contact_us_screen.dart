import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
// import 'package:final_project/widgets/custom_appBar_widget.dart';
import 'package:final_project/widgets/custom_container_row.dart';
import 'package:final_project/widgets/custom_elevated_buttom.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:final_project/widgets/custonmAppBar_widget.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final List<Map<String, dynamic>> channels = [
    {
      'icon': Icons.email_outlined,
      'label': 'Email',
      'value': 'hello@noma-curated.com',
    },
    {
      'icon': Icons.phone_outlined,
      'label': 'Phone',
      'value': '+1 (800) 555-NOMA',
    },
    {
      'icon': Icons.location_on_outlined,
      'label': 'Studio',
      'value': '742 Minimalist Way, Suite 10, CA',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      appBar: CustomAppbarWidget(
        title: 'Contact Us',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 24),

                Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primaryClr.withValues(alpha: 0.2),
                      width: 1.5,
                    ),
                    color: AppColors.primaryClr.withValues(alpha: 0.06),
                  ),
                  child: const Icon(
                    Icons.mail_outline_rounded,
                    size: 36,
                    color: AppColors.primaryClr,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "We'd love to hear from you. Please fill out the form below.",
                  textAlign: TextAlign.center,
                  style: AppStyles.style14Regular.copyWith(
                    color: AppColors.grayClr,
                  ),
                ),

                const SizedBox(height: 32),

                CustomTextField(title: 'NAME', hintText: 'Your full name'),
                const SizedBox(height: 16),

                CustomTextField(title: 'EMAIL', hintText: 'Your email address'),
                const SizedBox(height: 16),

                CustomTextField(
                  title: 'SUBJECT',
                  hintText: 'What are you writing about?',
                ),
                const SizedBox(height: 16),

                buildMultilineField(
                  title: 'MESSAGE',
                  hintText: 'Type your message here...',
                ),

                const SizedBox(height: 28),

                CustomElevatedButton(text: 'SEND MESSAGE', onPressed: () {}),

                const SizedBox(height: 32),

                SettingsContainer(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ALTERNATIVE CHANNELS',
                            style: AppStyles.style14Bold.copyWith(
                              fontFamily: 'Manrope',
                              color: AppColors.primaryClr,
                            ),
                          ),
                          SizedBox(height: 8),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: channels.length,
                            separatorBuilder: (context, index) =>
                                Divider(height: 24),
                            itemBuilder: (context, index) {
                              final channel = channels[index];
                              return buildInfoRow(
                                icon: channel['icon'],
                                label: channel['label'],
                                value: channel['value'],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget buildMultilineField({
    required String title,
    required String hintText,
  }) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.style14SemiBold.copyWith(
            fontFamily: 'Manrope',
            color: AppColors.primaryClr,
          ),
        ),
        TextField(
          maxLines: 5,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.bottomBackgroundClr,
            hintText: hintText,
            hintStyle: AppStyles.style14Regular.copyWith(
              color: AppColors.grayClr,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.primaryClr,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppColors.primaryClr),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppStyles.style14Bold),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppStyles.style13Regular.copyWith(
                  color: AppColors.grayClr,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
