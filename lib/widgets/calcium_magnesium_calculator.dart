import 'package:bittersalt/widgets/nutrient_level_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/water_calculations.dart';

class CalciumMagnesiumCalculator extends ConsumerWidget {
  const CalciumMagnesiumCalculator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calcium = ref.watch(calciumSliderProvider);
    final magnesium = ref.watch(magnesiumSliderProvider);
    final targetValuesEnabled = ref.watch(inCalculatorModeProvider);

    final calMagRatio = calcium / magnesium;
    final phase = ref.watch(selectedPlantPhaseProvider);
    final level = phase.calciumMagnesiumRatioOk(calMagRatio);

    final targetOptimalCalMagRatio = ref.watch(calciumTargetSliderProvider) / ref.watch(magnesiumTargetSliderProvider);
    final targetLevel = phase.calciumMagnesiumRatioOk(targetOptimalCalMagRatio);

    return Column(
      children: [
        Row(
          children: [
            Text('Ca:Mg Ratio: ${(calMagRatio.toStringAsFixed(2))}:1'),
            NutrientLevelIcon(level: level),
          ],
        ),

        if (targetValuesEnabled)
          Row(
            children: [
              Text('Ziel Ca:Mg Ratio: ${(targetOptimalCalMagRatio.toStringAsFixed(2))}:1'),
              NutrientLevelIcon(level: targetLevel),
            ],
          ),
      ],
    );
  }
}