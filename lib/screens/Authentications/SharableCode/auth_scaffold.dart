// Custom widget: Shared scaffold layout for all authentication screens
import 'package:final_project/app_colors.dart';
import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.children,
    this.scrollable = true,
  });

  final List<Widget> children;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: scrollable ? SingleChildScrollView(child: content) : content,
        ),
      ),
    );
  }
}
