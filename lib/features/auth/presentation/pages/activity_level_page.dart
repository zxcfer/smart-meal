import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_meal/core/presentation/widgets/bottom_bar.dart';
import 'package:smart_meal/core/router/app_router.dart';
import 'package:smart_meal/core/theme/app_colors.dart';

@RoutePage()
class ActivityLevelPage extends StatefulWidget {
  const ActivityLevelPage({super.key});

  @override
  State<ActivityLevelPage> createState() => _ActivityLevelPageState();
}

class _ActivityLevelPageState extends State<ActivityLevelPage> {
  ActivityLevel? _selectedLevel;

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
                      Center(
                        child: Text(
                          'Activity level',
                          style: _TextStyles.headline,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const _ProgressIndicator(progress: 0.2),
                      const SizedBox(height: 32),
                      const Text(
                        'How much do you work on average each week?',
                        style: _TextStyles.subtitle,
                      ),
                      const SizedBox(height: 32),
                      ..._buildActivityOptions(),
                    ],
                  ),
                ),
              ),
            ),
            BottomBar(
              onBackPressed: () => context.router.pop(),
              onNextPressed: _selectedLevel != null ? _handleNext : null,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildActivityOptions() {
    return ActivityLevel.values.map((level) {
      final isSelected = _selectedLevel == level;
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: _ActivityOption(
          level: level,
          isSelected: isSelected,
          onTap: () => setState(() => _selectedLevel = level),
        ),
      );
    }).toList();
  }

  void _handleNext() {
    context.router.push(const AllergiesRoute());
  }
}

enum ActivityLevel {
  sedentary(
    title: 'Sedentary',
    description: 'Almost no physical activity, minimal movement.',
  ),
  lightlyActive(
    title: 'Lightly Active',
    description:
        'Small bursts of activity like occasional walking or light chores.',
  ),
  moderatelyActive(
    title: 'Moderately Active',
    description: 'Regular movement and moderate exercise.',
  ),
  highlyActive(
    title: 'Highly Active',
    description: 'Consistent, intense physical activity.',
  ),
  extremelyActive(
    title: 'Extremely Active',
    description: 'Exceptional levels of physical exertion.',
  );

  const ActivityLevel({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
}

class _TextStyles {
  const _TextStyles();

  static const headline = TextStyle(
    color: Colors.white,
    fontSize: 28,
    // fontWeight: FontWeight.w600,
    height: 1.1,
    letterSpacing: -1,
  );

  static const subtitle = TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static const optionTitle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
  );

  static const optionDescription = TextStyle(
    color: Colors.white70,
    fontSize: 16,
    height: 1.4,
    letterSpacing: -0.3,
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

class _ActivityOption extends StatelessWidget {
  const _ActivityOption({
    required this.level,
    required this.isSelected,
    required this.onTap,
  });

  final ActivityLevel level;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    level.title,
                    style: _TextStyles.optionTitle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    level.description,
                    style: _TextStyles.optionDescription,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.white24,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
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
