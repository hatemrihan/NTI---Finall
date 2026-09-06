import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/onboarding/presentation/screens/onBoarding1_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _bgScaleAnimation;
  late final Animation<double> _logoScaleAnimation;
  late final Animation<double> _logoFadeAnimation;
  late final Animation<double> _textFadeAnimation;
  late final Animation<Offset> _textSlideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // Subtle background zoom out effect (cinematic feel)
    _bgScaleAnimation = Tween<double>(begin: 1.08, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    // Logo entrance: smooth pop with gentle spring
    _logoScaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.15, 0.70, curve: Curves.easeOutBack),
      ),
    );

    // Logo fade-in
    _logoFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.15, 0.60, curve: Curves.easeOut),
      ),
    );

    // Slogan text fade-in
    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 0.90, curve: Curves.easeOut),
      ),
    );

    // Slogan text slide-up
    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 0.90, curve: Curves.easeOutCubic),
      ),
    );

    _controller.forward();
    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(const Duration(milliseconds: 3000));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const Onboarding1Screen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            child: child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: Stack(
        children: [
          // Background image with cinematic slow scale
          Positioned.fill(
            child: ScaleTransition(
              scale: _bgScaleAnimation,
              child: Image.asset(
                'assets/images/splash_screen.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            top: size.height * 0.28,
            left: 0,
            right: 0,
            child: Center(
              child: FadeTransition(
                opacity: _logoFadeAnimation,
                child: ScaleTransition(
                  scale: _logoScaleAnimation,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.35),
                          blurRadius: 45,
                          spreadRadius: 15,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 195,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 35,
            left: 20,
            right: 20,
            child: SafeArea(
              top: false,
              child: FadeTransition(
                opacity: _textFadeAnimation,
                child: SlideTransition(
                  position: _textSlideAnimation,
                  child: Text(
                    'Accessories For Touch You',
                    style: AppStyles.style18ExtraBold.copyWith(
                      color: AppColors.whiteClr,
                      letterSpacing: 1.1,
                      shadows: const [
                        Shadow(
                          color: Color.fromRGBO(0, 0, 0, 0.35),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
