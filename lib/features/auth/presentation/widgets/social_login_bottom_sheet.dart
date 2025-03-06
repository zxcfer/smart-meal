import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_meal/core/constants/app_images.dart';

class SocialLoginBottomSheet extends StatefulWidget {
  const SocialLoginBottomSheet({super.key});

  @override
  State<SocialLoginBottomSheet> createState() => _SocialLoginBottomSheetState();
}

class _SocialLoginBottomSheetState extends State<SocialLoginBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          // Drag Handle
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 32),

          // Social Login Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                _SocialLoginButton(
                  icon: AppImages.googleIcon,
                  text: 'Continue with Google',
                  onPressed: () {},
                  animation: _getDelayedAnimation(0),
                ),
                const SizedBox(height: 16),
                _SocialLoginButton(
                  icon: AppImages.facebookIcon,
                  text: 'Continue with Facebook',
                  onPressed: () {},
                  animation: _getDelayedAnimation(1),
                ),
                const SizedBox(height: 16),
                _SocialLoginButton(
                  icon: AppImages.appleBlackIcon,
                  text: 'Continue with Apple',
                  onPressed: () {},
                  animation: _getDelayedAnimation(2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Animation<double> _getDelayedAnimation(int index) {
    return Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.2 + (index * 0.1),
        0.8 + (index * 0.1),
        curve: Curves.easeOut,
      ),
    ));
  }
}

class _SocialLoginButton extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onPressed;
  final Animation<double> animation;

  const _SocialLoginButton({
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.2),
          end: Offset.zero,
        ).animate(animation),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Stack(
              children: [
                // Icon on the left
                Positioned(
                  left: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(icon),
                    ),
                  ),
                ),
                // Centered text
                Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
