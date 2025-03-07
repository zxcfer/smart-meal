import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_meal/core/presentation/widgets/bottom_bar.dart';
import 'package:smart_meal/core/router/app_router.dart';
import 'package:smart_meal/core/theme/app_colors.dart';

@RoutePage()
class MealPreferencesPage extends StatefulWidget {
  const MealPreferencesPage({super.key});

  @override
  State<MealPreferencesPage> createState() => _MealPreferencesPageState();
}

class _MealPreferencesPageState extends State<MealPreferencesPage> {
  MealPreference? _selectedPreference;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),

                      Text(
                        'Meal Preferences',
                        style: _TextStyles.headline,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 24),
                      const _ProgressIndicator(progress: 1.0), // 5 of 5
                      const SizedBox(height: 32),
                      const Text(
                        'Select your daily meal preference.',
                        style: _TextStyles.subtitle,
                      ),
                      const SizedBox(height: 32),
                      ..._buildMealOptions(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            BottomBar(
              onBackPressed: () => context.router.pop(),
              onNextPressed: _selectedPreference != null ? _handleNext : null,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMealOptions() {
    return MealPreference.values.map((preference) {
      final isSelected = _selectedPreference == preference;
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: _MealOption(
          title: preference.title,
          icons: preference.icons,
          isSelected: isSelected,
          onTap: () => _selectPreference(preference),
        ),
      );
    }).toList();
  }

  void _selectPreference(MealPreference preference) {
    setState(() {
      _selectedPreference = preference;
    });
  }

  void _handleNext() {
    context.router.push(const NutritionalGoalsRoute());
  }
}

enum MealPreference {
  oneMeal('1 Meal', '🍴'),
  twoMeals('2 Meals', '🍽️🍽️'),
  threeMeals('3 Meals', '🍽️🍽️🍽️'),
  fourPlusMeals('4+ Meals', '🍽️🍽️🍽️🍽️'),
  snack('Snack', '🍔');

  const MealPreference(this.title, this.icons);
  final String title;
  final String icons;
}

class _TextStyles {
  const _TextStyles();

  static const headline = TextStyle(
    color: Colors.white,
    fontSize: 32,
    height: 1.1,
    letterSpacing: -1,
  );

  static const subtitle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    height: 1.2,
    letterSpacing: -0.5,
  );
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    const totalSegments = 8;
    const segmentSpacing = 4.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final segmentWidth =
            (totalWidth - (segmentSpacing * (totalSegments - 1))) /
                totalSegments;
        final activeSegments = (progress * totalSegments).floor();

        return SizedBox(
          height: 4,
          child: Row(
            children: List.generate(totalSegments, (index) {
              final isActive = index < activeSegments;
              return Row(
                children: [
                  Container(
                    width: segmentWidth,
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.primary : Colors.white12,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  if (index < totalSegments - 1)
                    const SizedBox(width: segmentSpacing),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}

class _MealOption extends StatelessWidget {
  const _MealOption({
    required this.title,
    required this.icons,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String icons;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.white24,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    icons,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.white24,
                  width: 2,
                ),
                shape: BoxShape.circle,
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
