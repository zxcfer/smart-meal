import 'package:flutter/material.dart';
import 'package:smart_meal/core/theme/app_colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.onBackPressed,
    required this.onNextPressed,
    this.nextLabel = 'Next',
    this.backIcon = Icons.arrow_back,
    this.backIconColor = AppColors.primary,
    this.backButtonColor = Colors.white,
  });

  final VoidCallback onBackPressed;
  final VoidCallback? onNextPressed;
  final String nextLabel;
  final IconData backIcon;
  final Color backIconColor;
  final Color backButtonColor;

  static const _textStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: backButtonColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              icon: Icon(
                backIcon,
                color: backIconColor,
                size: 30,
              ),
              onPressed: onBackPressed,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                color:
                    onNextPressed != null ? AppColors.primary : Colors.white24,
                borderRadius: BorderRadius.circular(16),
                boxShadow: onNextPressed != null
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: TextButton(
                onPressed: onNextPressed,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  nextLabel,
                  style: _textStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
