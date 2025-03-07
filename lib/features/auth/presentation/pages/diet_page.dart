import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_meal/core/presentation/widgets/bottom_bar.dart';
import 'package:smart_meal/core/theme/app_colors.dart';

@RoutePage()
class DietPage extends StatefulWidget {
  const DietPage({super.key});

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  final Set<Diet> _selectedDiets = {};

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
                      const Center(
                        child: Text(
                          'Do you want to follow a specific diet?',
                          style: _TextStyles.headline,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const _ProgressIndicator(progress: 0.8), // 4 of 5
                      const SizedBox(height: 32),
                      const Text(
                        'I can craft recipes that fit with all popular diet regimes.',
                        style: _TextStyles.subtitle,
                      ),
                      const SizedBox(height: 32),
                      ..._buildDietOptions(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          '${_selectedDiets.length} Selected',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            BottomBar(
              onBackPressed: () => context.router.pop(),
              onNextPressed: _selectedDiets.isNotEmpty ? _handleNext : null,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDietOptions() {
    return Diet.values.map((diet) {
      final isSelected = _selectedDiets.contains(diet);
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: _DietOption(
          title: diet.title,
          isSelected: isSelected,
          onTap: () => _toggleDiet(diet),
        ),
      );
    }).toList();
  }

  void _toggleDiet(Diet diet) {
    setState(() {
      if (_selectedDiets.contains(diet)) {
        _selectedDiets.remove(diet);
      } else {
        _selectedDiets.add(diet);
      }
    });
  }

  void _handleNext() {
    // TODO: Navigate to next screen
  }
}

enum Diet {
  lowCarb('Low carb'),
  lowCarbHighProtein('Low carb, high protein'),
  keto('Keto'),
  paleo('Paleo'),
  lowFat('Low fat'),
  atkins('Atkins');

  const Diet(this.title);
  final String title;
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
    color: Colors.white70,
    fontSize: 20,
    fontWeight: FontWeight.w400,
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

class _DietOption extends StatelessWidget {
  const _DietOption({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.5,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                border: isSelected
                    ? null
                    : Border.all(
                        color: Colors.white24,
                        width: 2,
                      ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
