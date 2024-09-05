import 'package:bittersalt/provider/water_calculations.dart';
import 'package:flutter/material.dart';

class NutrientLevelIcon extends StatelessWidget {
  final NutrientAmount level;

  const NutrientLevelIcon({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return switch (level) {
      NutrientAmount.low || NutrientAmount.high => const Icon(Icons.error, color: Colors.red),
      NutrientAmount.optimal => const Icon(Icons.check_circle, color: Colors.green),
      NutrientAmount.marginal => const Icon(Icons.warning, color: Colors.orange),
    };
  }
}
