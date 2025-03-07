import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_meal/core/presentation/widgets/bottom_bar.dart';
import 'package:smart_meal/core/router/app_router.dart';
import 'package:smart_meal/core/theme/app_colors.dart';

@RoutePage()
class AllergiesPage extends StatefulWidget {
  const AllergiesPage({super.key});

  @override
  State<AllergiesPage> createState() => _AllergiesPageState();
}

class _AllergiesPageState extends State<AllergiesPage> {
  final Set<Allergy> _selectedAllergies = {};

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
                          'Allergies',
                          style: _TextStyles.headline,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const _ProgressIndicator(progress: 0.3),
                      const SizedBox(height: 32),
                      const Text(
                        'What food allergies do you have?',
                        style: _TextStyles.subtitle,
                      ),
                      const SizedBox(height: 32),
                      if (_selectedAllergies.isNotEmpty) ...[
                        const Text(
                          'Selected Allergies',
                          style: _TextStyles.sectionTitle,
                        ),
                        const SizedBox(height: 16),
                        ..._buildSelectedAllergies(),
                        const SizedBox(height: 32),
                      ],
                      const Text(
                        'Allergies',
                        style: _TextStyles.sectionTitle,
                      ),
                      const SizedBox(height: 16),
                      ..._buildUnselectedAllergies(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            BottomBar(
              onBackPressed: () => context.router.pop(),
              onNextPressed: _selectedAllergies.isNotEmpty ? _handleNext : null,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSelectedAllergies() {
    return _selectedAllergies
        .map((allergy) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _AllergyOption(
                title: allergy.title,
                isSelected: true,
                onTap: () => _toggleAllergy(allergy),
              ),
            ))
        .toList();
  }

  List<Widget> _buildUnselectedAllergies() {
    return Allergy.values
        .where((allergy) => !_selectedAllergies.contains(allergy))
        .map((allergy) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _AllergyOption(
                title: allergy.title,
                isSelected: false,
                onTap: () => _toggleAllergy(allergy),
              ),
            ))
        .toList();
  }

  void _toggleAllergy(Allergy allergy) {
    setState(() {
      if (_selectedAllergies.contains(allergy)) {
        _selectedAllergies.remove(allergy);
      } else {
        _selectedAllergies.add(allergy);
      }
    });
  }

  void _handleNext() {
    context.router.push(const DietRoute());
  }
}

enum Allergy {
  gluten('Gluten Allergy'),
  egg('Egg Allergy'),
  soy('Soy Allergy'),
  dairy('Dairy Allergy'),
  nut('Nut Allergy'),
  shellfish('Shellfish Allergy'),
  fish('Fish Allergy'),
  wheat('Wheat Allergy'),
  corn('Corn Allergy'),
  sesame('Sesame Allergy'),
  legume('Legume Allergy'),
  coconut('Coconut Allergy');

  const Allergy(this.title);
  final String title;
}

class _TextStyles {
  const _TextStyles();

  static const headline = TextStyle(
    color: Colors.white,
    fontSize: 28,
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

  static const sectionTitle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
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

class _AllergyOption extends StatelessWidget {
  const _AllergyOption({
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
