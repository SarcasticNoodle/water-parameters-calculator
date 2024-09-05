import 'package:bittersalt/provider/water_calculations.dart';
import 'package:bittersalt/widgets/nutrient_level_icon.dart';
import 'package:flutter/material.dart';

class NutrientInfoDisplay extends StatelessWidget {
  final int value;
  final NutrientAmount level;
  final String unit;

  const NutrientInfoDisplay({
    super.key,
    required this.value,
    required this.level,
    this.unit = 'mg/L',
  });

  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          Text('${normalize(value)} $unit', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(width: 8),
          NutrientLevelIcon(level: level),
        ],
      );
  }
}
