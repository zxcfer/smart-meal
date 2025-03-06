import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_meal/core/router/app_router.dart';
import 'package:smart_meal/core/theme/app_colors.dart';

@RoutePage()
class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  String? _selectedGender;

  static const _textStyles = _TextStyles();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _BackButton(),
                const SizedBox(height: 32),
                Text(
                  "Let's create your profile",
                  style: _textStyles.headline,
                ),
                const SizedBox(height: 48),
                _FormField(
                  label: 'First name',
                  controller: _firstNameController,
                ),
                const SizedBox(height: 15),
                _FormField(
                  label: 'Last name',
                  controller: _lastNameController,
                ),
                const SizedBox(height: 15),
                _FormField(
                  label: 'How old are you?',
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                Text('Gender', style: _textStyles.label),
                const SizedBox(height: 15),
                _GenderSelector(
                  selectedGender: _selectedGender,
                  onGenderChanged: (gender) =>
                      setState(() => _selectedGender = gender),
                ),
                const SizedBox(height: 16),
                Text(
                  'Your age and sex is used to help with nutritional and health related insights.',
                  style: _textStyles.helper,
                ),
                const SizedBox(height: 40),
                _NextButton(onPressed: _handleNext),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleNext() {
    context.router.push(const ActivityLevelRoute());
  }
}

class _TextStyles {
  const _TextStyles();

  final headline = const TextStyle(
    color: Colors.white,
    fontSize: 34,
    fontWeight: FontWeight.w600,
    height: 1.1,
    letterSpacing: -1,
  );

  final label = const TextStyle(
    color: Colors.white70,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.5,
  );

  final input = const TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: -1,
  );

  final helper = const TextStyle(
    color: Colors.white70,
    fontSize: 16,
    height: 1.5,
    letterSpacing: -0.3,
  );

  final button = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
  );
}

class _Spacing {
  const _Spacing();

  final radioSize = 24.0;
  final radioInnerSize = 14.0;
  final buttonHeight = 64.0;
  final borderRadius = 16.0;
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 18),
            onPressed: () => context.router.pop(),
          ),
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.label,
    required this.controller,
    this.keyboardType,
  });

  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: _TextStyles().label),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: _TextStyles().input,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 8),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white24),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white24),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white24),
            ),
            fillColor: Colors.transparent,
            filled: true,
          ),
          cursorColor: Colors.white,
          cursorWidth: 1,
        ),
      ],
    );
  }
}

class _GenderSelector extends StatelessWidget {
  const _GenderSelector({
    required this.selectedGender,
    required this.onGenderChanged,
  });

  final String? selectedGender;
  final ValueChanged<String> onGenderChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _RadioOption(
            label: 'Male',
            isSelected: selectedGender == 'Male',
            onTap: () => onGenderChanged('Male'),
          ),
        ),
        const SizedBox(width: 32),
        Expanded(
          child: _RadioOption(
            label: 'Female',
            isSelected: selectedGender == 'Female',
            onTap: () => onGenderChanged('Female'),
          ),
        ),
      ],
    );
  }
}

class _RadioOption extends StatelessWidget {
  const _RadioOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const spacing = _Spacing();

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: spacing.radioSize,
            height: spacing.radioSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.white : Colors.white24,
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: spacing.radioInnerSize,
                      height: spacing.radioInnerSize,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Text(label, style: _TextStyles().input),
        ],
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    const spacing = _Spacing();
    final textStyles = _TextStyles();

    return Container(
      width: double.infinity,
      height: spacing.buttonHeight,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spacing.borderRadius),
          ),
        ),
        child: Text('Next', style: textStyles.button),
      ),
    );
  }
}
