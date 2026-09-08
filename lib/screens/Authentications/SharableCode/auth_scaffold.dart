import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.children,
    this.scrollable = false,
  });

  final List<Widget> children;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final content = Column(children: children);
    return Scaffold(
      body: SafeArea(
        child: scrollable ? SingleChildScrollView(child: content) : content,
      ),
    );
  }
}
