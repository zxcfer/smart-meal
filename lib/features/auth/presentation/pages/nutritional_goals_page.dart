import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_meal/core/presentation/widgets/bottom_bar.dart';
import 'package:smart_meal/core/router/app_router.dart';
import 'package:smart_meal/core/theme/app_colors.dart';

@RoutePage()
class NutritionalGoalsPage extends StatefulWidget {
  const NutritionalGoalsPage({super.key});

  @override
  State<NutritionalGoalsPage> createState() => _NutritionalGoalsPageState();
}

class _NutritionalGoalsPageState extends State<NutritionalGoalsPage> {
  final Set<NutritionalGoal> _selectedGoals = {};
  static const _maxSelections = 3;

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
                      const Text(
                        'What nutritional related\ngoals do you have?',
                        style: _TextStyles.headline,
                      ),
                      const SizedBox(height: 24),
                      const _ProgressIndicator(progress: 0.9),
                      const SizedBox(height: 32),
                      const Text(
                        'You can select up to 3. I\'ll tailor your meal\nplans to help match with your goals.',
                        style: _TextStyles.subtitle,
                      ),
                      const SizedBox(height: 32),
                      ..._buildGoalOptions(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          '${_selectedGoals.length} of 3 Selected',
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
              onNextPressed: _selectedGoals.isNotEmpty ? _handleNext : null,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildGoalOptions() {
    return NutritionalGoal.values.map((goal) {
      final isSelected = _selectedGoals.contains(goal);
      final canSelect = _selectedGoals.length < _maxSelections || isSelected;
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: _GoalOption(
          title: goal.title,
          isSelected: isSelected,
          onTap: canSelect ? () => _toggleGoal(goal) : null,
        ),
      );
    }).toList();
  }

  void _toggleGoal(NutritionalGoal goal) {
    setState(() {
      if (_selectedGoals.contains(goal)) {
        _selectedGoals.remove(goal);
      } else if (_selectedGoals.length < _maxSelections) {
        _selectedGoals.add(goal);
      }
    });
  }

  void _handleNext() {
    context.router.push(const HomeRoute());
  }
}

enum NutritionalGoal {
  loseWeight('Lose weight'),
  gainWeight('Gain weight'),
  maintainWeight('Maintain my current weight'),
  increaseMuscle('Increase lean muscle mass'),
  eatHealthier('Eat healthier'),
  reduceRedMeat('Reduce red meat intake');

  const NutritionalGoal(this.title);
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

class _GoalOption extends StatelessWidget {
  const _GoalOption({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;

    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: isSelected
              ? AppColors.primary
              : isDisabled
                  ? Colors.white38
                  : Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.5,
        ),
      ),
    );
  }
}
