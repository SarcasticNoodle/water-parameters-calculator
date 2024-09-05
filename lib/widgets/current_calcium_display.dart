import 'package:bittersalt/widgets/nutrient_info_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/water_calculations.dart';

class CurrentCalciumDisplay extends ConsumerWidget {
  const CurrentCalciumDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calcium = ref.watch(calciumSliderProvider);
    final currentPlantPhase = ref.watch(selectedPlantPhaseProvider);
    final level = currentPlantPhase.calciumLevelOk(calcium);

    return NutrientInfoDisplay(value: calcium, level: level);
  }
}